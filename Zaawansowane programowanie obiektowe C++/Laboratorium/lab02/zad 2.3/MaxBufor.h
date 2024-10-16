//
// Created by mateu on 16.10.2024.
//

#ifndef MAXBUFOR_H
#define MAXBUFOR_H

#include "Bufor.h"

class MaxBufor : public Bufor{

public:

    MaxBufor();
    ~MaxBufor();
    MaxBufor(int size);

    double calculate() override;
    void add(int value) override;

};



#endif //MAXBUFOR_H
