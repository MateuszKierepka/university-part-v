//
// Created by mateu on 15.10.2024.
//

#ifndef DEVELOPER_H
#define DEVELOPER_H

#include "Employee.h"

class Developer : public Employee{

public:

    Developer(string surname, int age, int experience, double salary);
    Developer();
    ~Developer() override;

    void show() override;
    int calculateSalary(int value) override;
    float calculateBonus(int value);

};



#endif //DEVELOPER_H
