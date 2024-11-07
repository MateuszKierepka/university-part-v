//
// Created by mateu on 25.10.2024.
//

#include <iostream>

#include "City.h"

using namespace std;

City::City(const string &city_name) {
    this->city_name = city_name;
}

void City::addCitizen(const Citizen &citizen) {
    citizens_.push_back(citizen);
}

void City::deleteCitizen(const string &surname, int age) {
    for (auto it = citizens_.begin(); it != citizens_.end(); ++it) {
        if (it->getSurname() == surname && it->getAge() == age) {
            citizens_.erase(it);
            break;
        }
    }
}

void City::show_citizens() const {
    for (auto citizen : citizens_) {
        citizen.show();
    }
}

void City::show_city() const {
    cout << "City: " << city_name << endl;
}

int City::women() const {
    int count = 0;
    for (auto citizen : citizens_) {
        if (citizen.getSex() == 'F' || citizen.getSex() == 'f') {
            count++;
        }
    }
    return count;
}

int City::city_citizens() const {
    return citizens_.size();
}

int City::adults() const {
    int count = 0;
    for (auto citizen : citizens_) {
        if (citizen.getAge() >= 18) {
            count++;
        }
    }
    return count;
}

int City::postal_codes() const {
    for (auto citizen: citizens_){
        string postalCode = citizen.getPostalCode();
        if(codes.count(postalCode) == 0){
            codes[postalCode] = 1;
        } else{
            codes[postalCode] += 1;
        }
    }
    for(const auto& pair: codes){
        std::cout << pair.first << " -> " << pair.second << std::endl;
    }
    return codes.size();
}

const vector<Citizen>& City::getCitizens() const {
    return citizens_;
}

vector<Citizen>& City::getCitizensRef() {
    return citizens_;
}