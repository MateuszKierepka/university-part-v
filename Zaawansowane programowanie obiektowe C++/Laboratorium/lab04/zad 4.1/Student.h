//
// Created by mateu on 24.10.2024.
//

#ifndef STUDENT_H
#define STUDENT_H

#include <iostream>

using namespace std;

class Student {

private:
    int mark;
    string name;

public:
    Student(int mark, string name);
    int getMark();
};



#endif //STUDENT_H
