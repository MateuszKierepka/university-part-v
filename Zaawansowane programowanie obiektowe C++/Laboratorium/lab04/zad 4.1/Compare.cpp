//
// Created by mateu on 24.10.2024.
//

#include "Compare.h"

bool Compare::operator()(Student &s1, Student &s2) {
    return s1.getMark() < s2.getMark();
}
