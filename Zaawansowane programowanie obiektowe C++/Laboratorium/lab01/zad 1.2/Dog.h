//
// Created by mateu on 14.10.2024.
//

#ifndef DOG_H
#define DOG_H

#include "Animal.h"

class Dog : public Animal {

private:

    string breed;
    int levelOfGuideSkills;
    int levelOfTrackerSkills;

public:

    Dog(string breed, int levelOfGuideSkills, int levelOfTrackerSkills, int limbNr, string name, bool protectedAnimal);
    Dog(int limbNr, string name, bool protectedAnimal = true);
    Dog();
    void setSkillLevel(int type, int value);
    int getSkillLevel(int type);
    void  giveVoice();
    void info();

};



#endif //DOG_H
