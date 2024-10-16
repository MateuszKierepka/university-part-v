//
// Created by mateu on 16.10.2024.
//

#ifndef MEANBUFOR_H
#define MEANBUFOR_H

#include "Bufor.h"

class MeanBufor : public Bufor{

public:

    MeanBufor();
    ~MeanBufor();
    MeanBufor(int size);

    double calculate() override;

};



#endif //MEANBUFOR_H
