//
// Created by mateu on 15.10.2024.
//

#include "Developer.h"
#include "Employee.h"

#include <iostream>

using namespace std;

Developer::Developer(string surname, int age, int experience, double salary) : Employee(surname, age, experience, salary) {

    cout << "Konstruktor klasy pochodnej - Developer" << endl;

}

Developer::Developer() : Employee() {

    cout << "Konstruktor bez. klasy pochodnej Developer" << endl;

}

Developer::~Developer() {

    cout << "Destruktor klasy pochodnej - Developer" << endl;

}

void Developer::show() {

    Employee::show();
    cout << "Stanowisko: Developer" << endl;

}

int Developer::calculateSalary(int value) {

    return value + calculateBonus(value);

}

float Developer::calculateBonus(int value){
    return 0.2 * value * (getSalary() + getExperience());
}
