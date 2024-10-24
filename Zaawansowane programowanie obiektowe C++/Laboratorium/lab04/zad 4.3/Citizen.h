//
// Created by mateu on 24.10.2024.
//

#ifndef CITIZEN_H
#define CITIZEN_H
#include <string>

using namespace std;

class Citizen {

private:
    string name;
    string surname;
    int age;
    char sex;
    string postal_code;

public:
    Citizen();
    Citizen(string name, string surname, int age, char sex, string postal_code);
    void show();

    string getName();
    void setName(string name);
    string getSurname();
    void setSurname(string surname);
    int getAge();
    void setAge(int age);
    char getSex();
    void setSex(char sex);
    string getPostalCode();
    void setPostalCode(string postal_code);

};



#endif //CITIZEN_H
