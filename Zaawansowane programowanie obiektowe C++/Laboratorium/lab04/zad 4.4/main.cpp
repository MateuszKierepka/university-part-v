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

int main() {

    vector<int> vector = {11, 27, 7, 60, 301, 10, 20, 1001};

    cout << "Liczby posortowane rosnaco wedlug sumy cyfr w liczbie: " << endl;
    sort(vector.begin(), vector.end(), [](int a, int b) {
       return sum(a) < sum(b);
    });

    for_each (vector.begin(), vector.end(), [](int num) {
       cout << num << " ";
    });

    cout << "\nLiczby posortowane malejaco wedlug liczby cyfr: " << endl;

    sort(vector.begin(), vector.end(), [](int a, int b) {
        return size(a) > size(b);
    });

    for_each(vector.begin(), vector.end(), [](int num) {
        cout << num << " ";
    });

    return 0;
}
