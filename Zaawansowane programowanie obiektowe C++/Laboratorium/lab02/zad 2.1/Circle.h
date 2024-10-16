//
// Created by mateu on 15.10.2024.
//

#ifndef CIRCLE_H
#define CIRCLE_H

#include "Figure.h"

class Circle : public  Figure{

private:

    float r;

public:

    Circle(float r);
    ~Circle();

    void calculateArea() override;
    void calculateCircumference() override;

};



#endif //CIRCLE_H
