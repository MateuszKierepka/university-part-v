#include <iostream>
#include <set>

using namespace std;

template <typename T>
void alternatywaWykluczajaca(set<T> set1, set<T> set2) {
    T sum = 0;
    for (T set : set1) {
        if (set2.find(set) == set2.end()) {
            sum += set;
        }
    }
    for (T set : set2) {
        if (set1.find(set) == set1.end()) {
            sum += set;
        }
    }

    cout << "Suma elementow, ktore znajduja sie tylko w pierwszym lub tylko w drugim zbiorze: " << sum << endl;
}

int main() {

    set<int> set1 = {5, 17, 23, 30, 100};
    set<int> set2 = {14, 37, 5, 12, 30};
    alternatywaWykluczajaca(set1, set2); //203

    set<float> set3 = {75.95, 33.59, 67.12, 50.48, 23.36};
    set<float> set4 = {67.12, 31.56, 54.21, 33.59, 50.48};
    alternatywaWykluczajaca(set3, set4); //185.08

    return 0;
}
