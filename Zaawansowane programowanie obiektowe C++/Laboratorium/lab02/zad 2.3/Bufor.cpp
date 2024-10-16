//
// Created by mateu on 16.10.2024.
//

#include "Bufor.h"

#include <iostream>

using namespace std;

Bufor::Bufor() {

    cout << "Konstruktor bez. klasy bazowej - Bufor" << endl;
    size = 10;
    tab = new int[size];
    index = 0;

}

Bufor::Bufor(int size) {

    cout << "Konstruktor klasy bazowej - Bufor" << endl;
    this->size = size;
    tab = new int[size];
    index = 0;

}

Bufor::~Bufor() {

    cout << "Destruktor klasy bazowej - Bufor" << endl;
    delete[] tab;

}

void Bufor::add(int value) {

    tab[index] = value;
    index++;

}

int Bufor::getIndex() {
    return index;
}

int Bufor::getSize() {
    return size;
}

int Bufor::getTab(int i) {
    return tab[i];
}

int Bufor::getFirst() {
    return index;
}

void Bufor::setFirst(int value) {
    index = value;
}

void Bufor::setTab(int pos, int value) {

    if (pos >= 0 && pos < size) {
        tab[pos] = value;
    } else {
        cout << "Niepoprawny indeks." << endl;
    }

}

void Bufor::show() {

    for (int i = 0; i < index; ++i) {
        cout << tab[i] << " ";
    }

    cout << endl;
}

