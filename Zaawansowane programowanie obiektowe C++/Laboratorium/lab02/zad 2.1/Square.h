//
// Created by mateu on 15.10.2024.
//

#ifndef SQUARE_H
#define SQUARE_H

#include "Figure.h"

class Square : public Figure{

private:

    float a;

public:

    Square(float a);
    ~Square();

    void calculateArea() override;
    void calculateCircumference() override;
    void show();

};



#endif //SQUARE_H
