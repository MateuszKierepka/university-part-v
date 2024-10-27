//
// Created by mateu on 25.10.2024.
//

#ifndef CITY_H
#define CITY_H

#include <vector>
#include <string>
#include <map>

#include "Citizen.h"

class City {

private:
    vector<Citizen> citizens_;
    string city_name;
    mutable map<string, int> codes;

public:
    City(const string &city_name);

    void addCitizen(const Citizen &citizen);
    void deleteCitizen(const string &surname, int age);
    void show_citizens() const;
    void show_city() const;
    int women() const;
    int city_citizens() const;
    int adults() const;
    int postal_codes() const;

};



#endif //CITY_H
