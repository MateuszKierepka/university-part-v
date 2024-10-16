//
// Created by mateu on 14.10.2024.
//

#ifndef ANIMAL_H
#define ANIMAL_H
#include <string>

using namespace std;

class Animal {

private:

    int limbNr;
    string name;
    bool protectedAnimal;

public:

    Animal();
    Animal(int limbNr, string name, bool protectedAnimal = true);

    void setLimbNr(int limbNr);
    int getLimbNr();
    void setName(string name);
    string getName();
    void setProtectedAnimal(bool protectedAnimal);
    bool getProtectedAnimal();

    void giveVoice();
    void info();

};



#endif //ANIMAL_H
