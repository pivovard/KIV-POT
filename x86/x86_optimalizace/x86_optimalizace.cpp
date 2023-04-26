#include <iostream>
#include <chrono>

#define SIZE 1000000

// inicializace
void init(int* arr1, int* arr2) {
	for (int i = 0; i < SIZE; ++i)
	{
		arr1[i] = i;
		arr2[i] = i + 1;
	}
}

int main()
{
	int* arr1 = new int[SIZE];
	int* arr2 = new int[SIZE];

	// bez optimalizace /Od	-> general purpose registry
	// optimalizovany   /O2 -> SSE registry
	init(arr1, arr2);
	auto start = std::chrono::high_resolution_clock::now();

	for (int i = 0; i < SIZE; i++)
	{
		//if(arr1[i] % 2 == 0) //podminka rozbije optimalizaci
		arr1[i] = arr1[i] * arr2[i];
	}

	auto end = std::chrono::high_resolution_clock::now();
	auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
	std::cout << "1. " << duration.count() << std::endl;

	// optimalizovany kod
	init(arr1, arr2);
	start = std::chrono::high_resolution_clock::now();

	for (int i = 0; i < SIZE; i += 5)
	{
		arr1[i] = arr1[i] * arr2[i];
		arr1[i + 1] = arr1[i + 1] * arr2[i + 1];
		arr1[i + 2] = arr1[i + 2] * arr2[i + 2];
		arr1[i + 3] = arr1[i + 3] * arr2[i + 3];
		arr1[i + 4] = arr1[i + 4] * arr2[i + 4];
	}

	end = std::chrono::high_resolution_clock::now();
	duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
	std::cout << "2. " << duration.count() << std::endl;

	// asm
	init(arr1, arr2);
	start = std::chrono::high_resolution_clock::now();

	_asm {
		mov ecx, 0
		mov edi, arr1
		mov esi, arr2
		loop1 :
		mov eax, [edi + 4 * ecx]
			mov ebx, [esi + 4 * ecx]
			imul eax, ebx
			mov[edi + 4 * ecx], eax
			add ecx, 1
			cmp ecx, SIZE
			jl loop1
	}

	end = std::chrono::high_resolution_clock::now();
	duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
	std::cout << "3. " << duration.count() << std::endl;

	// vektorove funkce
	/*init(arr1, arr2);
	start = std::chrono::high_resolution_clock::now();

	_asm {
		mov ecx, 0
		lea edi, arr1
		lea esi, arr2
	loop2 :
		movups      xmm0, xmmword ptr[edi + 4 * ecx]
		movups      xmm1, xmmword ptr[esi + 4 * ecx]
		mulps xmm0, xmm1
		movdqa [edi + 4 * ecx], xmm0
		add ecx, 4
		cmp ecx, SIZE
		jl loop2
	}

	end = std::chrono::high_resolution_clock::now();
	duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
	std::cout << "4. " << duration.count() << std::endl;*/

	delete[] arr1;
	delete[] arr2;
	return 0;
}
