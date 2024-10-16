//
// Created by mateu on 14.10.2024.
//

#ifndef PERSON_H
#define PERSON_H

#include <iostream>

using namespace std;

class Person {

private:

    string name;
    string surname;
    int age;

public:

    Person(string name, string surname, int age);
    Person();

    void setAge(int age);
    string getSurname();
    bool is_18();
    void showInfoPerson();
    void init(string name, string surname, int age);

};

#endif //PERSON_H
