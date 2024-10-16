//
// Created by mateu on 15.10.2024.
//

#ifndef EMPLOYEE_H
#define EMPLOYEE_H

#include <string>

using namespace std;

class Employee {

private:

    string surname;
    int age;
    int experience;
    double salary;

public:

    Employee(string surname, int age, int experience, double salary);
    Employee();
    virtual ~Employee();

    virtual void show();
    virtual int calculateSalary(int value)=0;
    int ageEmployment();

    void setSurname(string surname);
    string getSurname();

    void setAge(int age);
    int getAge();

    void setExperience(int experience);
    int getExperience();

    void setSalary(double salary);
    double getSalary();

};



#endif //EMPLOYEE_H
