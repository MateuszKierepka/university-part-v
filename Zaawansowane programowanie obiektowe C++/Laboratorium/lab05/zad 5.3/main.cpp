#include <iostream>
#include <map>
#include <string>

using namespace std;

char findChar(const string &string1, const string &string2) {
    map<char, int> map;
    for (int i = 0; i < string1.length(); ++i) {
        map[string1[i]]++;
    } // W tej pętli przechodzimy przez każdy znak w string1 i zliczamy jego wystąpienia, dodając je do mapy. Jeśli dany znak pojawia się kilka razy, jego licznik jest odpowiednio zwiększany.
    for (int i = 0; i < string2.length(); ++i) {
        if (map.find(string2[i]) == map.end()) {
            return string2[i]; // Jeśli nie ma go w mapie – zwracamy ten znak, bo oznacza to, że jest to dodany znak.
        } else {
            map[string2[i]]--;
            if (map[string2[i]] == 0) {
                map.erase(string2[i]); // Jeśli licznik tego znaku spada do zera, usuwamy ten wpis z mapy (map.erase(string2[i])), co pozwala optymalnie zarządzać pamięcią.
            }
        }
    }
    return map.begin()->first;
}

int main() {

    string str1 = "Sgdfdcfs";
    string str2 = "Sgdftcfs";
    cout << "Znak ktory zostal dodany to: " << findChar(str1, str2) << endl;

    return 0;
}
