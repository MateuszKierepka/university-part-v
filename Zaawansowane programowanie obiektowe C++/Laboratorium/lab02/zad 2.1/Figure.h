//
// Created by mateu on 15.10.2024.
//

#ifndef FIGURE_H
#define FIGURE_H

class Figure {

private:

    float area;

public:

    Figure();
    virtual ~Figure();

    float getArea();
    void setArea(float area);
    virtual void calculateArea()=0;
    virtual void calculateCircumference()=0;
    void show();

};



#endif //FIGURE_H
