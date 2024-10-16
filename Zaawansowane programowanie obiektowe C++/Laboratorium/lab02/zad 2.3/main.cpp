#include <iostream>

#include "Bufor.h"
#include "MaxBufor.h"
#include "MeanBufor.h"


using namespace std;

int main() {

    Bufor* bufor[3];

    bufor[0] = new MeanBufor(3);
    bufor[1] = new MaxBufor(5);
    bufor[2] = new MeanBufor(6);

    for (int i = 0; i < 3; ++i) {
        cout << "Dodawanie elementow do bufora" << endl;
        for (int j = 1; j <= 6; ++j) {
            bufor[i]->add(j);
        }
        cout << "Zawartość bufora " << i << ": ";
        bufor[i]->show();
    }

    for (int i = 0; i < 3; ++i) {
        cout << "Wynik calculate dla bufora[" << i << "]: " << bufor[i]->calculate() << endl;
    }

    for (int i = 0; i < 3; ++i) {
        delete[] bufor[i];
    }

    return 0;
}
