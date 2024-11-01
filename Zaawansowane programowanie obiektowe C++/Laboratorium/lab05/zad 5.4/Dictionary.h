//
// Created by mateu on 31.10.2024.
//

#ifndef DICTIONARY_H
#define DICTIONARY_H
#include <map>
#include <string>

using namespace std;

class Dictionary {

private:
    map<string, string> words;

public:
    Dictionary();
    ~Dictionary();

    void addWord(const string &word, const string &translation);
    void deleteWord(const string &word);
    void show();
    void showTranslation(string word);
    void sortByAlphabet();
};



#endif //DICTIONARY_H
