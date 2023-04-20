#include <iostream>

char msg[] = "Hello world!\n";

extern "C" {
    void proc_asm();
    int sum_asm(int a, int b);
    void myprint();
    int sum1(int a, int b);
}

void myprint() {
    std::cout << msg;
}

int sum1(int a, int b)
{
    a = a + b;
    return a;
}

int sum2(int* a, int b)
{
    *a = *a + b;
    return *a;
}

int sum3(int& a, int b)
{
    a = a + b;
    return a;
}

int main()
{
    proc_asm();

    int res = sum1(1, 2);
    res = sum_asm(11, 22);

    sum2(&res, 5);
    sum3(res, 5);

    _asm {
        push  5
        push  7
        call  sum1
        mov   dword ptr [res], eax
        pop edx
        pop edx
    }

    __asm
    {
        lea  eax, msg
        push eax
        call printf
        pop  edx
    }

    return 0;
}



