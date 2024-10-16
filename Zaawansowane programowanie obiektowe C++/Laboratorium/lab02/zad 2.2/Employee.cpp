//
// Created by mateu on 15.10.2024.
//

#include "Employee.h"

#include <iostream>

using namespace std;

Employee::Employee(string surname, int age, int experience, double salary) {

    this->surname = surname;
    this->age = age;
    this->experience = experience;
    this->salary = salary;

    cout << "Konstruktor klasy bazowej - Employee" << endl;

}

Employee::Employee() {

    cout << "Konstruktor bez. klasy bazowej - Employee" << endl;

}

Employee::~Employee() {

    cout << "Wirtualny destruktor klasy bazowej - Employee" << endl;

}

void Employee::show() {

    cout << "Surname: " << surname << "\nAge: " << age << "\nExperience: " << experience << "\nSalary: " << salary << endl;

}

int Employee::ageEmployment() {
    return age - experience;
}

void Employee::setSurname(string surname) {
    this->surname = surname;
}

string Employee::getSurname() {
    return surname;
}

void Employee::setAge(int age) {
    this->age = age;
}

int Employee::getAge() {
    return age;
}

void Employee::setExperience(int experience) {
    this->experience = experience;
}

int Employee::getExperience() {
    return experience;
}

void Employee::setSalary(double salary) {
    this->salary = salary;
}

double Employee::getSalary() {
    return salary;
}
