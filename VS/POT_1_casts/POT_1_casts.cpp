// POT_cast_examples.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <bitset>

#define SIZE(var) printf("Size of %s (%s): %dB\n", #var, typeid(var).name(), sizeof(var));
#define PRINT(num) printf("Dec: %i, Hex: %x, Oct: %o, Bin: ", num, num, num); PRINT_BIN(num, 8)
#define PRINT_BIN(num, l) std::cout << std::bitset<l>(num) << std::endl;

#define ADD(n1, n2, r, f) _asm{ \
                                __asm  mov       al, byte ptr[n1]      \
                                __asm  mov       bl, byte ptr[n2]      \
                                __asm  add       al, bl                \
                                __asm  pushf                           \
                                __asm  pop       cx                    \
                                __asm  mov       word ptr[f], cx       \
                                __asm  mov       byte ptr[r], al     \
                              }

void overflow_single_operation()
{
    uint16_t flags = 0;
    bool c, ov;

    uint8_t u8 = 200;
    uint8_t uRes = 0;

    printf("uint8 200 + 50\n");
    PRINT(u8);
    //uRes = u8 + 50;
    ADD(u8, 50, uRes, flags);
    PRINT(uRes);
    PRINT_BIN(flags, 16);
    c = flags & 0x0001;
    ov = flags & 0x0800;
    printf("Carry: %d, Overflow: %d\n\n", c, ov);

    printf("uint8 200 + 100\n");
    PRINT(u8);
    //uREs = u8 + 100;
    ADD(u8, 100, uRes, flags);
    PRINT(uRes);
    PRINT_BIN(flags, 16);
    c = flags & 0x0001;
    ov = flags & 0x0800;
    printf("Carry: %d, Overflow: %d\n\n", c, ov);


    int8_t s8 = 100;
    int8_t sRes = 0;

    printf("int8 100 + 20\n");
    PRINT(s8);
    //sRes = s8 + 20;
    ADD(s8, 20, sRes, flags);
    PRINT(sRes);
    PRINT_BIN(flags, 16);
    c = flags & 0x0001;
    ov = flags & 0x0800;
    printf("Carry: %d, Overflow: %d\n\n", c, ov);

    printf("int8 100 + 50\n");
    PRINT(s8);
    //sRes = s8 + 50;
    ADD(s8, 50, sRes, flags);
    PRINT(sRes);
    PRINT_BIN(flags, 16);
    c = flags & 0x0001;
    ov = flags & 0x0800;
    printf("Carry: %d, Overflow: %d\n\n", c, ov);

}

void overflow_multi_operation()
{
    int16_t i = 22330;
    int16_t res16;
    int32_t res32;

    res32 = i * 70;
    res32 = res32 / 100;
    printf("int32: 22330 * 70 / 100 = %d\n", res32);

    res32 = i / 100;
    res32 = res32 * 70;
    printf("int32: 22330 / 100 * 70 = %d\n", res32);

    res16 = i * 70;
    res16 = res16 / 100;
    printf("int16: 22330 * 70 / 100 = %d\n", res16);

    res16 = i / 100;
    res16 = res16 * 70;
    printf("int16: 22330 / 100 * 70 = %d\n", res16);

    system("PAUSE");

    res16 = i * 70 / 100;
    printf("int16 22330 * 70 / 100 = %d\n", res16);

}
void float_precision()
{
    float f10 = 10000000;
    float f100 = 100000000;
    double d100 = 100000000;

    printf("Float: %.0f + 1 = %.0f\n", f10, f10 + 1);
    printf("Float: %.0f + 1 = %.0f\n", f100, f100 + 1);
    printf("Double: %.0f + 1 = %.0f\n", d100, d100 + 1);

    SIZE(f100);
    SIZE(d100);
}

struct Template
{
    uint8_t first;
    uint16_t third;
    uint32_t second;
};

void mem_storing()
{
    Template var;
    SIZE(var.first)
        SIZE(var.second)
        system("PAUSE");
    SIZE(var)
}

int main()
{
    //overflow_single_operation();
    //overflow_multi_operation();
    float_precision();
    //mem_storing();

    return 0;
}