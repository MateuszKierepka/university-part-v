//
// Created by mateu on 16.10.2024.
//

#include "MeanBufor.h"

#include <iostream>

using namespace std;

MeanBufor::MeanBufor(){
    cout << "Konstruktor bez. klasy pochodnej - MeanBufor" << endl;
}

MeanBufor::~MeanBufor(){
    cout << "Destruktor klasy pochodnej - MeanBufor" << endl;
}

MeanBufor::MeanBufor(int size) : Bufor(size){
    cout << "Konstruktor klasy pochodnej - MeanBufor" << endl;
}

double MeanBufor::calculate() {

    if (getFirst() == 0) {
        return 0;
    } else {
        double sum = 0;
        for (int i = 0; i < getFirst(); ++i) {
            sum += getTab(i);
        }
        return sum / getFirst();
    }

}
