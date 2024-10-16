//
// Created by mateu on 14.10.2024.
//

#include "Dog.h"

#include <iostream>

using namespace std;

Dog::Dog(string breed, int levelOfGuideSkills, int levelOfTrackerSkills, int limbNr, string name, bool protectedAnimal) : Animal(limbNr, name, protectedAnimal) {

    Animal(limbNr, name, protectedAnimal);
    this->breed = breed;
    this->levelOfGuideSkills = levelOfGuideSkills;
    this->levelOfTrackerSkills = levelOfTrackerSkills;

    cout << "Konstruktor klasy pochodnej - Dog" << endl;

}

Dog::Dog(int limbNr, string name, bool protectedAnimal) : Animal(limbNr, name, protectedAnimal) {
    cout << "Konstruktor klasy pochodnej - Dog" << endl;
}

Dog::Dog() {
    cout << "Konstruktor bez. klasy pochodnej - Dog" << endl;
}

void Dog::setSkillLevel(int type, int value) {

    if (type == 0) {
        levelOfGuideSkills = value;
    } else if (type == 1) {
        levelOfTrackerSkills = value;
    } else {
        cout << "Blad! Podales bledna wartosc" << endl;
    }
}

int Dog::getSkillLevel(int type) {

    if (type == 0) {
        return levelOfGuideSkills;
    } else if (type == 1) {
        return levelOfTrackerSkills;
    } else {
        cout << "Blad! Podales bledna wartosc" << endl;
        return 0;
    }

}

void Dog::giveVoice() {

    cout << "Hau, hau" << endl;

}

void Dog::info() {

    Animal::info();

    cout << "Rasa psa: " << breed << "\nPoziom umiejetnosci przewodnika: " << levelOfGuideSkills <<
        "\nPoziom umiejetnosci tropiciela: " << levelOfTrackerSkills << endl;

}
