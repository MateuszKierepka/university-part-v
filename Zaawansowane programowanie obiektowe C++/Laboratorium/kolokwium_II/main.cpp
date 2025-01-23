#include <iostream>
#include <tuple>
#include <vector>
#include <algorithm>

using namespace std;

int main(){
    vector<tuple<string, string, int>> cars = {
        make_tuple("Mazda", "benzyna", 2018),
        make_tuple("Peugeot", "diesel", 2019),
        make_tuple("Skoda", "benzyna", 2009),
        make_tuple("Toyota", "benzyna", 2025),
        make_tuple("Audi", "diesel", 2020),
        make_tuple("Hunday", "diesel", 2015)
    };
    vector<tuple<string, string, int>> auta_benzynowe;
    for(const auto& car : cars) {
        if(get<1>(car).compare("benzyna") == 0) {
            auta_benzynowe.push_back(car);
        }
    }
    sort(auta_benzynowe.begin(), auta_benzynowe.end(),
        [](const tuple<string, string, int>& a, const tuple<string, string, int>& b) {
            return get<2>(a) > get<2>(b);
        });
    cout << "samochody benzynowe posortowane malejaco wedlug roku produkcji:" << endl;
    for(const auto& car : auta_benzynowe) {
        cout << get<0>(car) << ", " << get<1>(car) << ", " << get<2>(car) << endl;
    }
    return 0;
}
