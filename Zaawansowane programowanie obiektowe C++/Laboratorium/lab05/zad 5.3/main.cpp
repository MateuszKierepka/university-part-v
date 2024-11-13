#include <iostream>
#include <map>
#include <string>

using namespace std;

char findChar(const string &string1, const string &string2) {
    map<char, int> map;
    for (int i = 0; i < string1.length(); ++i) {
        map[string1[i]]++;
    } // w tej pętli przechodzimy przez kazdy znak w string1 i zliczamy jego wystapienia, dodajac je do mapy. jesli dany znak pojawia sie kilka razy, jego licznik jest odpowiednio zwiększany.
    for (int i = 0; i < string2.length(); ++i) {
        if (map.find(string2[i]) == map.end()) {
            return string2[i]; // jesli nie ma go w mapie – zwracamy ten znak, bo oznacza to, ze jest to dodany znak.
        } else {
            map[string2[i]]--;
            if (map[string2[i]] == 0) {
                map.erase(string2[i]); // jesli licznik tego znaku spada do zera, usuwamy ten wpis z mapy (map.erase(string2[i])), co pozwala optymalnie zarzadzac pamiecia.
            }
        }
    }
    return map.begin()->first;
}

int main() {

    string str1 = "Sgdfdcfs";
    string str2 = "DSgdfcfs";
    cout << "Znak ktory zostal dodany to: " << findChar(str1, str2) << endl;

    return 0;
}
