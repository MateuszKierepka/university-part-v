#include <iostream>
#include <cstdlib>
#include <ctime>
#include <vector>

#include <list>

using namespace std;

int main() {


    // vektor
    srand(time(0));

    int n = (rand() % 100) + 1;
    cout << "n = " << n << endl;

    vector<int> vec;
    vector<int> vec2;

    for (int i = 0; i < n; ++i) {
        int value = (rand() % 201) - 100;
        if (value >= 0) {
            vec.push_back(value);
        } else {
            vec2.push_back(value);
        }
    }

    vec.insert(vec.end(), vec2.begin(), vec2.end());

    cout << "Zawartosc wektora: " << endl;
    for (int i : vec) {
        cout << i << " ";
    }

    cout << endl;

    // lista
    srand(time(0));

    int n2 = (rand() % 100) + 1;
    cout << "n = " << n2 << endl;

    list<int> list;

    for (int i = 0; i < n2; ++i) {
        int val = (rand() % 201) - 100;

        if (val >= 0) {
            list.push_front(val);
        } else {
            list.push_back(val);
        }
    }

    for (int value : list) {
        cout << value << " ";
    }

    return 0;
}
