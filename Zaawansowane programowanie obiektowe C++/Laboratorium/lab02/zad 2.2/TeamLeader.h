//
// Created by mateu on 15.10.2024.
//

#ifndef TEAMLEADER_H
#define TEAMLEADER_H

#include <iostream>

#include "Employee.h"

using namespace std;

class TeamLeader : public Employee{

public:

    TeamLeader(string surname, int age, int experience, double salary);
    TeamLeader();
    ~TeamLeader() override;

    float calculateBonus(int value);
    int calculateSalary(int value) override;;
    void show() override;

};



#endif //TEAMLEADER_H
