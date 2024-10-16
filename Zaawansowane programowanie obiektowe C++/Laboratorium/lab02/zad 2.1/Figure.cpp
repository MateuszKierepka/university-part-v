//
// Created by mateu on 15.10.2024.
//

#include "Figure.h"

#include <iostream>

using namespace std;

Figure::Figure() {
    cout << "Konstruktor klasy bazowej - Figure" << endl;
}

Figure::~Figure() {
    cout << "Wirtualny destruktor klasy bazowej - Figure" << endl;
}

float Figure::getArea() {
    return area;
}

void Figure::setArea(float area) {
    this->area = area;
}

void Figure::show() {
    cout << "Area: " << area << endl;
}

