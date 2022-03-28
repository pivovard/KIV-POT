#include <iostream>

extern "C" {
    void asmMain();
    int sum(int a, int b);
    int asmSum(int a, int b);
}

int main()
{
    asmMain();
    int res = sum(1, 2);
    res = asmSum(11, 22);

    _asm {
        push  5
        push  7
        call  sum
        mov   dword ptr [res], eax
    }

    char msg[] = "Hello world!\n";

    __asm
    {
        lea  eax, msg
        push eax
        call printf
        pop  ebx
    }
}

int sum(int a, int b)
{
    int sum = a + b;
    return sum;
}