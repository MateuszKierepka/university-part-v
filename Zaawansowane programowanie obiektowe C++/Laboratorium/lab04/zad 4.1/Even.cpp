//
// Created by mateu on 24.10.2024.
//

#include "Even.h"

Even::Even(int divider) {
    this->divider = divider;
}

bool Even::operator()(int x) {
    if (divider % 2 == 0) {
        return true;
    } else {
        return false;
    }
}