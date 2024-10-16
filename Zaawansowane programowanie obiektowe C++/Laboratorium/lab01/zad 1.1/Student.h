//
// Created by mateu on 14.10.2024.
//

#ifndef STUDENT_H
#define STUDENT_H

#include "Person.h"

class Student : public Person {

private:

    string index;

public:

    Student(string name, string surname, int age, string index);
    Student();

    void setIndex(string index);
    string getIndex();
    void showInfoStudent();

};



#endif //STUDENT_H
