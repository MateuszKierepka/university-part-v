//
// Created by mateu on 17.10.2024.
//

#ifndef STUDENT_H_INCLUDED
#define STUDENT_H_INCLUDED

#include <iostream>

using namespace std;

template<typename T>
class Student {

private:

    string name;
    int mark;

public:

    Student(int mark, string name) {
        this->mark = mark;
        this->name = name;
    }
    Student(){}

    void show() {
        cout << "Imie: " << name << "\nOcena: " << mark << endl;
    }

    void showMark() {
        cout << mark << endl;
    }
};

template<>
void Student<int>::showMark() {
    cout << "Twoja ocena to: " << mark << endl;
}

template<>
class Student<string> {

private:

    string name;
    int mark;

public:

    Student(int mark, string name) {
        this->mark = mark;
        this->name = name;
    }

    Student(){}

    void show() {
        cout << "Imie: " << name << "\nOcena: " << mark << endl;
    }

    int showMark() {
        string word[6] = {"jedynka", "dwojka", "trojka", "czworka", "piatka", "szostka"};
        cout << "Twoja ocena to: " << word[mark-1] << endl;
        return mark;
    }

};

#endif //STUDENT_H_INCLUDED
