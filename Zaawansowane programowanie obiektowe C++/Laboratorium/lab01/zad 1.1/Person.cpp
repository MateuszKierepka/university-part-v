//
// Created by mateu on 14.10.2024.
//

#include "Person.h"

using namespace std;

Person::Person(string name, string surname, int age) {

    this->name = name;
    this->surname = surname;
    this->age = age;

    cout << "Konstruktor klasy bazowej - Person" << endl;
}

Person::Person() {

    cout << "Konstruktor bez. klasy bazowej - Person" << endl;

}

void Person::setAge(int age) {

    this->age = age;

}

string Person::getSurname() {
    return surname;
}

bool Person::is_18() {

    if (age >= 18) {
        return true;
    } else
        return false;
}

void Person::showInfoPerson() {

    cout << "Imie: " << name << "\nNazwisko: " << surname << "\nWiek: " << age << endl;
}

void Person::init(string name, string surname, int age) {

    this->name = name;
    this->surname = surname;
    this->age = age;

}
