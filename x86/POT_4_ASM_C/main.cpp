#include <iostream>
#include "Class.h"

extern "C" {
    void asmMain();
    int sum(int a, int b);
    int asmSum(int a, int b);
}

int sum(int a, int b)
{
    a = a + b;
    return a;
}

int sum2(int* a, int b)
{
    *a = *a + b;
}

int sum3(int& a, int b)
{
    a = a + b;
}

int main()
{
    int res = sum(1, 2);
    sum2(&res, 5);
    sum3(res, 5);

    asmMain();
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



