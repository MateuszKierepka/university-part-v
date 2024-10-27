//
// Created by mateu on 24.10.2024.
//
#include <iostream>
#include "Citizen.h"

using namespace std;

Citizen::Citizen() {
    cout << "Konstruktor bez. klasy Citizen" << endl;
}

Citizen::Citizen(const string &name, const string &surname, int age, char sex, const string &postal_code) {
    cout << "Konstruktor klasy Citizen" << endl;
    this->name = name;
    this->surname = surname;
    this->age = age;
    this-> sex = sex;
    this->postal_code = postal_code;
}

void Citizen::show() const {
    cout << "Informacje o mieszkancu:" << endl;
    cout << "Imie: " << name << "\nNazwisko: " << surname << "\nWiek: " << age << "\nPlec: " << sex << "\nKod pocztowy: " << postal_code << endl;
}

string Citizen::getName() {
    return name;
}

void Citizen::setName(const string &name) {
    this->name = name;
}

string Citizen::getSurname() {
    return surname;
}

void Citizen::setSurname(const string &surname) {
    this->surname = surname;
}

int Citizen::getAge() const {
    return age;
}

void Citizen::setAge(int age) {
    this->age = age;
}

char Citizen::getSex() const {
    return sex;
}

void Citizen::setSex(char sex) {
    this->sex = sex;
}

string Citizen::getPostalCode() {
    return postal_code;
}

void Citizen::setPostalCode(const string &postal_code) {
    this->postal_code = postal_code;
}
