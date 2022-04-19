#pragma once

#include <iostream>

class Class1
{
public:
    int i;

    Class1()
    {
        i = 0;
        std::cout << "Init constructor.\n";
    }

    Class1(Class1& o)
    {
        std::cout << "Copy constructor.\n";
    }

    Class1(Class1&& o)
    {
        std::cout << "Move constructor.\n";
    }


};