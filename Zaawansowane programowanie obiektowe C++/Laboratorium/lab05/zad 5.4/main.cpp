#include <iostream>

#include "Dictionary.h"

using namespace std;

int main() {

    Dictionary dict;

    dict.addWord("kot", "cat");
    dict.addWord("dom", "house");
    dict.addWord("pies", "dog");

    cout << endl;
    dict.show();

    cout << endl;
    dict.showTranslation("kot");
    dict.showTranslation("ptak");

    cout << endl;
    dict.deleteWord("pies");
    dict.show();

    cout << endl;
    dict.sortByAlphabet();

    return 0;
}
