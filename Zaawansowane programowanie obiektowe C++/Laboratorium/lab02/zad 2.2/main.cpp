#include <iostream>

#include "Employee.h"
#include "Developer.h"
#include "TeamLeader.h"

using namespace std;

void whoWorkMoreThan5Years(Employee** employee, int size) {

    cout << "Pracownicy pracujacy wiecej niz 5 lat: " << endl;

    for (int i = 0; i < size; ++i) {
        if (employee[i]->getExperience() > 5) {
            employee[i]->show();
            cout << "------------------------------" << endl;
        }
    }

}

int howManyEarnLessThanMeanBonus(Employee** employee, int size) {

    float totalBonus = 0;

    for (int i = 0; i < size; ++i) {
        totalBonus += employee[i]->calculateSalary(1000)-1000;
    }

    float meanBonus = totalBonus / size;

    int count = 0;

    for (int i = 0; i < size; ++i) {
        if ((employee[i]->calculateSalary(1000)-1000) < meanBonus) {
            count++;
        }
    }

    return count;
}

int main() {

    Employee* employee[5];

    employee[0] = new Developer("Kierepka", 21, 3, 5500);
    employee[1] = new Developer("Kiszka", 21, 3, 4000);
    employee[2] = new TeamLeader("Kosmala", 22, 2, 7999);
    employee[3] = new Developer("Szuper", 23, 4, 10000);
    employee[4] = new TeamLeader("Szelepusta", 22, 5, 9000);

    cout << "Informacje o pracownikach:" << endl;

    for (int i = 0; i < 5; ++i) {
        employee[i]->show();

        cout << "Wyplata z premia: " << employee[i]->calculateSalary(1000) << endl;
        cout << "------------------------------" << endl;
    }

    whoWorkMoreThan5Years(employee, 5);

    cout << "Liczba pracownikow z premia ponizej sredniej: " << howManyEarnLessThanMeanBonus(employee, 5) << endl;

    for (int i = 0; i < 5; ++i) {
        delete employee[i];
    }

    return 0;
}
