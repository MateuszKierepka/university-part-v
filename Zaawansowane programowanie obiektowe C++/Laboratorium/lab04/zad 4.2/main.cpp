#include <iostream>
#include <algorithm>
#include <list>
#include <cstdlib>
#include <ctime>

int main() {
    srand( time(nullptr));

    int n = rand() % 100 + 1;

    std::list<int> list;

    for (int i = 0; i < n; i++) {
        int val = rand() % 201 - 100;
        if (val >= 0) {
            list.push_front(val);
        } else {
            list.push_back(val);
        }
    }

    std::cout << "Wypisanie za pomoca iteratora i petli for:" << std::endl;
    for (auto it = list.begin(); it != list.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    std::cout << "Wypisanie za pomoca petli for_each:" << std::endl;
    std::for_each(list.begin(), list.end(), [](int value) {
        std::cout << value << " ";
    });
    std::cout << std::endl;

    std::cout << "Wypisanie za pomoca petli for z typem auto:" << std::endl;
    for (auto value : list) {
        std::cout << value << " ";
    }
    std::cout << std::endl;

    return 0;
}
