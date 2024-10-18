#include <iostream>
#include <type_traits>

using namespace std;

template<int divider, typename T>
void showConvertingFromGrams(T elem) {
    cout << "Dla podanego typu brak specjalizacji" << endl;
}

template<>
void showConvertingFromGrams<10, int>(int elem) {
    cout << elem << "g = " << elem / 10 << "dag" << endl;
}

template<>
void showConvertingFromGrams<1000, int>(int elem) {
    cout << elem << "g = " << elem / 1000 << "kg" << endl;
}

template<>
void showConvertingFromGrams<1000000, int>(int elem) {
    cout << elem << "g = " << elem / 1000000 << "t" << endl;
}

template<>
void showConvertingFromGrams<1, int>(int elem) {
    cout << elem << "g = " << elem * 1000 << "mg" << endl;
}

template<>
void showConvertingFromGrams<10, float>(float elem) {
    cout << elem << "g = " << elem / 10 << "dag" << endl;
}

template<>
void showConvertingFromGrams<1000, float>(float elem) {
    cout << elem << "g = " << elem / 1000 << "kg" << endl;
}

template<>
void showConvertingFromGrams<1000000, float>(float elem) {
    cout << elem << "g = " << elem / 1000000 << "t" << endl;
}

template<>
void showConvertingFromGrams<1, float>(float elem) {
    cout << elem << "g = " << elem * 1000 << "mg" << endl;
}

int main() {
    showConvertingFromGrams<10, int>(1000); // 1000g = 100dag
    showConvertingFromGrams<1000, int>(1000); // 1000g = 1kg
    showConvertingFromGrams<1000000, float>(1000000); // 1000000g = 1t
    showConvertingFromGrams<1, float>(1); // 1g = 1000mg
    showConvertingFromGrams<10, float>(100.7); // 100.7g = 10.07dag

    showConvertingFromGrams<10, double>(100.0); // brak specjalizacji

    return 0;
}