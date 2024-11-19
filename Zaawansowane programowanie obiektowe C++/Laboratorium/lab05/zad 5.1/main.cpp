#include <iostream>
#include <set>
#include <vector>

using namespace std;

pair<int, int> duplikat(const vector<int>& values) {
    set<int> uniqueNums;
    int duplicatedValue = 0;
    int sumOfUniqueElements = 0;

    for (int num : values) {
        if (!uniqueNums.insert(num).second) {
            duplicatedValue = num;
        }
    }

    for (int num : uniqueNums) {
        sumOfUniqueElements += num;
    }

    return {duplicatedValue, sumOfUniqueElements};
}

int main() {

    vector<int> vector = {1, 2, 3, 4, 5, 3};
    pair<int, int> result = duplikat(vector);
    cout << "Duplikat: " << result.first << endl;
    cout << "Suma unikatowych elementow: " << result.second << endl;

    return 0;
}
