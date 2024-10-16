#include <iostream>

#include "Animal.h"
#include "Dog.h"

using namespace std;

int main() {

    // Animal a1 = Animal(4, "Scooby", true);
    // a1.info();

    Dog d1 = Dog("Golden Retriever", 5, 5, 4,"Scooby", false);
    d1.info();



    return 0;
}

int howManyProtectedAnimals(Animal* animal, int size) {

    int counter = 0;

    for (int i = 0; i < size; ++i) {
        if (animal[i].getProtectedAnimal() == true) {
            counter++;
        }
    }

    return counter;
}

Dog* howManyTrackerDogs(Dog* dog, int size) {

    int counter = 0;

    for (int i = 0; i < size; ++i) {
        if (dog->getSkillLevel(0) > dog->getSkillLevel(1)) {
            counter++;
        }
    }

    return dog;
}