//
// Created by mateu on 15.10.2024.
//

#include "Circle.h"
#include "Figure.h"

#include <iostream>

using namespace std;

Circle::Circle(float r) {
    this->r = r;
    cout << "Konstruktor w klasie Circle" << endl;
}

Circle::~Circle() {
    cout << "Destruktor w klasie Circle" << endl;
}

void Circle::calculateArea() {
    float p = 3.14 * r * r;
    setArea(p);
}

void Circle::calculateCircumference() {
    float o = 2 * 3.14 * r;
    cout << "Obwod kola wynosi: " << o << endl;
}

