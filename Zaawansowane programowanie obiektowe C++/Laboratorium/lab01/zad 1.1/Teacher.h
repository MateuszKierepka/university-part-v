//
// Created by mateu on 14.10.2024.
//

#ifndef TEACHER_H
#define TEACHER_H

#include "Person.h"

class Teacher : public Person{

private:

    int experience;
    string title;

public:

    Teacher(string name, string surname, int age, int experience, string title);
    Teacher();

    void setTitle(string title);
    int getExperience();
    bool is_Phd();
    void showInfoTeacher();

};



#endif //TEACHER_H
