
#include <iostream>

using namespace std;

extern "C" {
    void asmMain();

    int promptFirst();
    int promptSecond();
    void printInt(int myint);
}

int main()
{
    asmMain();
}

int promptFirst()
{
    cout << " The first number = ";
    int newint;
    cin >> newint;

    return newint;
}

int promptSecond()
{
    cout << "\nThe second number = ";
    int newint;
    cin >> newint;

    return newint;
}

void printInt(int myint)
{
    cout << myint;
}