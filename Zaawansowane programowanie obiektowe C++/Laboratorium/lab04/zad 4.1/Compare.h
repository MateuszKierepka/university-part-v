//
// Created by mateu on 24.10.2024.
//

#ifndef COMPARE_H
#define COMPARE_H

#include "Student.h"

class Compare {

public:
    bool operator() (Student &s1, Student &s2);
};



#endif //COMPARE_H
