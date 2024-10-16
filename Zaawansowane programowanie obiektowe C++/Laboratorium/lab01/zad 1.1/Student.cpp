//
// Created by mateu on 14.10.2024.
//

#include "Student.h"

#include <iostream>

Student::Student(string name, string surname, int age, string index) : Person(name, surname, age) {

   this->index = index;

   cout << "Konstruktor klasy pochodnej Student" << endl;

}

Student::Student() {

    cout << "Konstruktor bez. klasy pochodnej Student" << endl;

}

void Student::setIndex(string index) {
   this->index = index;
}

string Student::getIndex() {
   return index;
}

void Student::showInfoStudent() {

   showInfoPerson();
   cout << "Indeks: " << index << endl;

}
