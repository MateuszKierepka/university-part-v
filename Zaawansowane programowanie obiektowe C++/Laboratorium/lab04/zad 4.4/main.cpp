#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int sum(int number) {
    int sum = 0;
    while (number > 0) {
        sum += number%10;
        number /= 10;
    }
    return sum;
}

int size(int number) {
    int counter = 0;
    while (number > 0) {
        number /= 10;
        counter++;
    }
    return counter;
}

class SortBySum {
public:
    bool operator()(int a, int b) const {
        return sum(a) < sum(b);
    }
};

class SortBySize {
public:
    bool operator()(int a, int b) const {
        return size(a) > size(b);
    }
};

int main() {

    vector<int> vector = {11, 27, 7, 60, 301, 10, 20, 1001};

    cout << "Stan poczatkowy:" << endl;
    for_each (vector.begin(), vector.end(), [](int num) {
       cout << num << " ";
    });

    cout << endl << endl;

    cout << "Liczby posortowane rosnaco wedlug sumy cyfr w liczbie (iterator): " << endl;
    sort(vector.begin(), vector.end(), [](int a, int b) {
       return sum(a) < sum(b);
    });
    for_each (vector.begin(), vector.end(), [](int num) {
       cout << num << " ";
    });

    cout << endl;

    cout << "\nLiczby posortowane malejaco wedlug liczby cyfr (funktor): " << endl;
    sort(vector.begin(), vector.end(), SortBySize());
    for_each(vector.begin(), vector.end(), [](int num) {
        cout << num << " ";
    });

    cout << endl << endl;

    cout << "Liczby posortowane rosnaco wedlug sumy cyfr w liczbie (nazwana lambda)" << endl;
    auto sortBySumLambda = [](int a, int b) {
        return sum(a) < sum(b);
    };
    sort(vector.begin(), vector.end(), sortBySumLambda);
    for_each (vector.begin(), vector.end(), [](int num) {
       cout << num << " ";
    });

    cout << endl;

    cout << "\nLiczby posortowane malejaco wedlug liczby cyfr (nienazwana lambda): " << endl;
    sort(vector.begin(), vector.end(),
        [](int a, int b){ return size(a) > size(b);});
    for_each (vector.begin(), vector.end(), [](int num) {
       cout << num << " ";
    });

    return 0;
}
