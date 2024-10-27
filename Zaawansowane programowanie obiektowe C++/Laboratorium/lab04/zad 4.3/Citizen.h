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
    Citizen(const string &name, const string &surname, int age, char sex, const string &postal_code);
    void show() const;

    string getName();
    void setName(const string &name);
    string getSurname();
    void setSurname(const string &surname);
    int getAge() const;
    void setAge(int age);
    char getSex() const;
    void setSex(char sex);
    string getPostalCode();
    void setPostalCode(const string &postal_code);

};



#endif //CITIZEN_H
