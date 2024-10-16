//
// Created by mateu on 16.10.2024.
//

#include "MaxBufor.h"

#include <iostream>

using namespace std;

MaxBufor::MaxBufor(){
    cout << "Konstruktor bez. klasy pochodnej - MaxBufor" << endl;

}

MaxBufor::~MaxBufor() {
    cout << "Destruktor klasy pochodnej - MaxBufor" << endl;
}

MaxBufor::MaxBufor(int size) : Bufor(size) {
    cout << "Konstruktor klasy pochodnej - MaxBufor" << endl;

}

double MaxBufor::calculate() {
    if (getFirst() == 0) {
        return 0;
    } else {

        int max = getTab(0);

        for (int i = 0; i < getFirst(); ++i) {
            if (max < getTab(i)) {
                max = getTab(i);
            }
        }

        return max;
    }
}

void MaxBufor::add(int value) {

    if (getFirst() < getSize()) {
        Bufor::add(value);
    } else {
        cout << "Brak miejsca w tablicy." << endl;
    }

}

