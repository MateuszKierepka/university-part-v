//
// Created by mateu on 31.10.2024.
//

#include <iostream>
#include "Dictionary.h"

using namespace std;

Dictionary::Dictionary() {
    cout << "Konstruktor bez. klasy bazowej Dictionary" << endl;
}

Dictionary::~Dictionary() {
    cout << "Destruktor klasy bazowej Dictionary" << endl;
}

void Dictionary::addWord(const string &word, const string &translation) {
    if (words.count(word) == 0) {
        words[word] = translation;
        cout << "Dodano: " << word << " -> " << translation << endl;
    } else {
        cout << "Podane slowo juz istnieje w slowniku..." << endl;
    }
}

void Dictionary::deleteWord(const string &word) {
    if (words.count(word) != 0) {
        words.erase(word);
        cout << "Usunieto slowo: " << word << endl;
    } else {
        cout << "Brak podanego slowa w slowniku..." << endl;
    }
}

void Dictionary::show() {
    cout << "Zawartosc slownika: " << endl;
    for (auto word : words) {
        cout << word.first << " -> " << word.second << endl;
    }
}

void Dictionary::showTranslation(string word) {
    if (words.count(word) != 0) {
        cout << "Tlumaczenie dla " << word << " = " << words[word] << endl;
    } else {
        cout << "Brak tlumaczenia dla slowa: " << word << endl;
    }
}

void Dictionary::sortByAlphabet() { // Elementy w kontenerze przechowywane są w domyślnej postaci rosnąco względem kluczy.
    cout << "Slowa posortowane alfabetycznie: " << endl;
    for (auto word : words) {
        cout << word.first << " -> " << word.second << endl;
    }
}
