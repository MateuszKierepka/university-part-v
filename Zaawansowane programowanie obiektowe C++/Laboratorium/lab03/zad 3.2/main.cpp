#include <iostream>

using namespace std;

template <typename T>
T findMin(T arr[], int size) {
    T min = arr[0];
    for (int i = 0; i < size; ++i) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    return min;
}

int main() {

    int arr_int[] = {17, 18, 8, 2, 11};
    double arr_double[] = {2.3, 2.1, -1.4, 0.5, 0.2};

    cout << "Minimalny element (int): " << findMin(arr_int, 5) << endl;


    cout << "Minimalny element (double): " << findMin(arr_double, 5) << endl;


    return 0;
}
