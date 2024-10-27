#include <algorithm>
#include <iostream>
#include <vector>

#include "City.h"

void showCities(const vector<City> &c) {
    for (auto city : c) {
        city.show_city();
    }
}

void the_most(vector<City> c, int mode) {
    if (mode == 1) {
        auto max_city = max_element(c.begin(), c.end(), [](const City &a, const City &b) {
            return a.postal_codes() < b.postal_codes();
        });
        cout << "\nMiasto w ktorym jest najwiecej roznych kodow pocztowych: " << endl;
        max_city->show_city();
    } else if (mode == 2){
        auto min_city = min_element(c.begin(), c.end(), [](const City &a, const City &b) {
           return a.city_citizens() < b.city_citizens();
        });
        cout << "Miasto w ktorym mieszka najmniej mieszkancow: " << endl;
        min_city -> show_city();
    } else {
        cout << "Niepoprawny tryb" << endl;
        return;
    }
}

void statistic(const vector<City> &c) {
    for (auto city : c) {
        city.show_city();
        cout << "Liczba mieszkancow: " << city.city_citizens() << endl;
        cout << "Kobiety: " << city.women() << endl;
        cout << "Mezczyzni: " << city.city_citizens() - city.women() << endl;
        cout << "Pelnoletni: " << city.adults() << endl;
        cout << "Niepelnoletni: " << city.city_citizens() - city.adults() << endl;
        cout << endl;
    }
}

void sort_cities(vector<City> &c) {
    sort(c.begin(), c.end(), [](const City &a, const City &b) {
       return a.city_citizens() < b.city_citizens();
    });
}

int main() {

    Citizen citizen1("Mateusz", "Kierepka", 21, 'M', "20-388");
    Citizen citizen2("Mikolaj", "Lukasik", 19, 'M', "20-389");
    Citizen citizen3("Ola", "Gryniuk", 19, 'F', "31-512");

    City city1("Dominow");
    city1.addCitizen(citizen1);
    city1.addCitizen(citizen2);

    City city2("Krakow");
    city2.addCitizen(citizen3);

    vector<City> cities = {city1, city2};

    cout << "\nLista miast:" << endl;
    showCities(cities);

    cout << endl;

    cout << "Miasta posortowane wedlug liczby mieszkancow:" << endl;
    sort_cities(cities);
    showCities(cities);

    cout << endl;

    cout << "Statystyka miast:" << endl;
    statistic(cities);

    the_most(cities, 1);

    cout << endl;

    the_most(cities, 2);

    return 0;
}
