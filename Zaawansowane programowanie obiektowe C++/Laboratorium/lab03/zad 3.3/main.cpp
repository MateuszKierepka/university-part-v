#include <iostream>

#include "Array.h"

int main() {

    Array<int> intArray(5);
    intArray.add(3);
    intArray.add(1);
    intArray.add(9);
    intArray.add(7);
    intArray.add(5);

    cout << "Tablica int: ";
    intArray.show();

    cout << "Posortowana tablica int: ";
    intArray.sort();
    intArray.show();

    cout << "Maksymalny element int: " << intArray.getMax() << endl;

    Array<string> strArray(5);
    strArray.add("pies");
    strArray.add("kot");
    strArray.add("chomik");
    strArray.add("krowa");
    strArray.add("sarna");

    cout << "\nTablica string: ";
    strArray.show();

    cout << "Posortowana tablica string (wedlug dlugosci): ";
    strArray.sort();
    strArray.show();

    cout << "Najdluzszy napis: " << strArray.max_element() << endl;

    return 0;
}
