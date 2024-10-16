//
// Created by mateu on 15.10.2024.
//

#include "Square.h"
#include "Figure.h"

#include <iostream>

using namespace std;

Square::Square(float a) :Figure(){
    this->a = a;
    cout << "Konstruktor klasy Square" << endl;
}

Square::~Square() {
    cout << "Destruktor klasy Square" << endl;
}

void Square::calculateArea() {
    float p = a*a;
    setArea(p);
}

void Square::calculateCircumference() {
    float o = 4*a;
    cout << "Obwod kwadratu wynosi: " << o << endl;
}

void Square::show() {
    cout << "Show w klasie Square, area: " << getArea() << endl;
}
