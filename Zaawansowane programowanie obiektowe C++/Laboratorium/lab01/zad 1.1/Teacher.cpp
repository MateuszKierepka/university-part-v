//
// Created by mateu on 14.10.2024.
//

#include "Teacher.h"

#include <iostream>

Teacher::Teacher(string name, string surname, int age, int experience, string title) : Person(name, surname, age) {

    this->experience = experience;
    this->title = title;

    cout << "Konstruktor klasy pochodnej Teacher" << endl;

}

Teacher::Teacher() {

    cout << "Konstruktor bez. klasy pochodnej Teacher" << endl;

}

void Teacher::setTitle(string title) {
    this->title = title;
}

int Teacher::getExperience() {
    return experience;
}

bool Teacher::is_Phd() {

    if (title == "Phd") {
        return true;
    } else
        return false;

}

void Teacher::showInfoTeacher() {

    showInfoPerson();
    cout << "Staz pracy: " << experience << "\nTytul naukowy: " << title << endl;

}
