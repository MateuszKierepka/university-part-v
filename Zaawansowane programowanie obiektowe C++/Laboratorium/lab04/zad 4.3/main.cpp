#include <algorithm>
#include <iostream>
#include <vector>

#include "City.h"

template <typename T>
void showVector(const vector<T> &vec) {
    for (auto element:vec) {
        element.show_city();
    }
}

void find_city_with_most_postal_codes(const vector<City>& cities) {
    auto max_city = max_element(cities.begin(), cities.end(),
        [](const City &a, const City &b) {
            return a.postal_codes() < b.postal_codes();
        });

    cout << "\nMiasto, w ktorym jest najwiecej roznych kodow pocztowych: " << endl;
    if (max_city != cities.end()) {
        max_city->show_city();
    }
}

void find_city_with_most_citizens(const vector<City>& cities) {
    auto max_city = max_element(cities.begin(), cities.end(),
        [](const City &a, const City &b) {
            return a.city_citizens() < b.city_citizens();
        });

    cout << "Miasto, w ktorym mieszka najwiecej mieszkancow: " << endl;
    if (max_city != cities.end()) {
        max_city->show_city();
    }
}

void find_youngest_citizen(const vector<City>& cities) {

    int youngest_age = INT_MAX;
    const Citizen *youngest_citizen = nullptr;

    for (const auto& city : cities) {
        const auto& citizens = city.getCitizens();
        for (const auto& citizen : citizens) {
            if (citizen.getAge() < youngest_age) {
                youngest_age = citizen.getAge();
                youngest_citizen = &citizen;
            }
        }
    }

    if (youngest_citizen) {
        cout << "Najmlodszy mieszkaniec: " << endl;
        youngest_citizen->show();
    } else {
        cout << "Brak danych o mieszkancach." << endl;
    }

}

void the_most(const vector<City>& cities, int mode) {
    switch (mode) {
        case 1:
            find_city_with_most_postal_codes(cities);
            break;
        case 2:
            find_city_with_most_citizens(cities);
            break;
        case 3:
            find_youngest_citizen(cities);
            break;
        default:
            cout << "Niepoprawny tryb..." << endl;
            break;
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
    showVector(cities);

    cout << endl;

    cout << "Miasta posortowane wedlug liczby mieszkancow:" << endl;
    sort_cities(cities);
    showVector(cities);

    cout << endl;

    cout << "Statystyka miast:" << endl;
    statistic(cities);

    the_most(cities, 1);

    cout << endl;

    the_most(cities, 2);

    cout << endl;

    the_most(cities, 3);

    return 0;
}
