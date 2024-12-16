#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {
    try {
        ifstream inputFile("kod.txt");
        if (!inputFile.is_open()) {
            throw runtime_error("Nie można otworzyć pliku kod.txt. Sprawdź, czy plik istnieje.");
        }

        ofstream outputFile("kod_bez_komentarzy.txt");
        if (!outputFile.is_open()) {
            throw runtime_error("Nie można utworzyć pliku wynikowego.");
        }

        string line;
        while (getline(inputFile, line)) {
            size_t commentPos = line.find("//");
            if (commentPos != string::npos) {
                inputFile.ignore(line.length() - commentPos); // Ignorowanie komentarza
                line = line.substr(0, commentPos);           // Zatrzymanie kodu przed komentarzem
            }
            outputFile << line << endl; // Zapis do nowego pliku
        }
        inputFile.close();
        outputFile.close();
    } catch (const runtime_error &e) {
        cerr << "Błąd: " << e.what() << endl;
        return 1;
    } catch (...) {
        cerr << "nieznany blad" << endl;
        return 1;
    }

    return 0;
}

