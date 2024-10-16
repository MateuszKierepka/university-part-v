//
// Created by mateu on 15.10.2024.
//

#include "TeamLeader.h"

#include <iostream>

using namespace std;

TeamLeader::TeamLeader(string surname, int age, int experience, double salary) : Employee(surname, age, experience, salary) {

    cout << "Konstruktor klasy pochodnej - TeamLeader" << endl;

}

TeamLeader::TeamLeader() {

    cout << "Konstruktor bez. klasy pochodnej - TeamLeader" << endl;

}

TeamLeader::~TeamLeader() {

    cout << "Destruktor klasy pochodnej - TeamLeader" << endl;

}

float TeamLeader::calculateBonus(int value) {

    return value * (1 + getSalary() + getExperience());

}

int TeamLeader::calculateSalary(int value) {

    return value + calculateBonus(value);

}

void TeamLeader::show() {

    Employee::show();

    cout << "Jestem Team Leaderem z " <<getExperience() << " letnim doswiadczeniem." << endl;

}
