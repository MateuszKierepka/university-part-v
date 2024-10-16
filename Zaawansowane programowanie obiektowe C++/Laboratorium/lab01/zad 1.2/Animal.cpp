//
// Created by mateu on 14.10.2024.
//

#include "Animal.h"

#include <iostream>

using namespace std;

Animal::Animal() {

    cout << "Konstruktor bez. klasy bazowej - Animal" << endl;

}

Animal::Animal(int limbNr, string name, bool protectedAnimal) {

    this->limbNr = limbNr;
    this->name = name;
    this->protectedAnimal = protectedAnimal;

    cout << "Konstruktor klasy bazowej - Animal" << endl;

}

void Animal::setLimbNr(int limbNr) {
    this->limbNr = limbNr;
}

int Animal::getLimbNr() {
    return limbNr;
}

void Animal::setName(string name) {
    this->name = name;
}

string Animal::getName() {
    return name;
}

void Animal::setProtectedAnimal(bool protectedAnimal) {
    this->protectedAnimal = protectedAnimal;
}

bool Animal::getProtectedAnimal() {
    return protectedAnimal;
}

void Animal::giveVoice() {
    cout << "Chrum, miai, hau, piiii" << endl;
}

void Animal::info() {
    cout << "Liczba konczyn: " << limbNr << "\nNazwa: " << name << "\nChroniony? " << protectedAnimal << endl;
}
