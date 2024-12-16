#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>
#include <algorithm>
#include <stdexcept>
#include <iomanip>
#include <regex>
#include <cctype>

using namespace std;

// Klasa reprezentująca studenta
class Student {
public:
    string imie, nazwisko, plec, email;
    double ocena;

    Student(string imie, string nazwisko, string plec, double ocena, string email = "")
        : imie(imie), nazwisko(nazwisko), plec(plec), ocena(ocena), email(email) {}

    void wyswietl() const {
        cout << setw(30) << left << imie
             << setw(30) << left << nazwisko
             << setw(10) << left << plec
             << setw(10) << left << ocena;
        if (!email.empty())
            cout << setw(30) << left << email;
        cout << endl;
    }
};

// Funkcja walidująca dane studenta
void walidujDane(const string& imie, const string& nazwisko, const string& plec, double ocena, const string& email) {
    regex regexImieNazwisko("^[A-Z][a-zA-Z]*$");
    regex regexEmail("^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$");

    if (!regex_match(imie, regexImieNazwisko) || !regex_match(nazwisko, regexImieNazwisko)) {
        throw invalid_argument("Imię i nazwisko muszą zaczynać się wielką literą i zawierać tylko litery.");
    }
    if (plec != "K" && plec != "M") {
        throw invalid_argument("Płeć musi być 'K' lub 'M'.");
    }
    if (ocena < 2.0 || ocena > 5.0) {
        throw invalid_argument("Ocena musi być w przedziale od 2.0 do 5.0.");
    }
    if (!email.empty() && !regex_match(email, regexEmail)) {
        throw invalid_argument("Email musi zawierać znak '@' i być poprawny.");
    }
}

// Funkcja wczytująca dane z pliku CSV
vector<Student> wczytajDane(const string& sciezka) {
    ifstream plik(sciezka);
    if (!plik.is_open()) {
        throw runtime_error("Nie można otworzyć pliku: " + sciezka);
    }

    vector<Student> studenci;
    string linia;
    getline(plik, linia); // Pomijamy nagłówki
    while (getline(plik, linia)) {
        stringstream ss(linia);
        string imie, nazwisko, plec, ocenaStr, email;
        getline(ss, imie, ';');
        getline(ss, nazwisko, ';');
        getline(ss, plec, ';');
        getline(ss, ocenaStr, ';');
        getline(ss, email, ';');

        double ocena = stod(ocenaStr);
        studenci.emplace_back(imie, nazwisko, plec, ocena, email);
    }

    plik.close();
    return studenci;
}

// Funkcja zapisująca dane do pliku CSV
void zapiszDane(const string& sciezka, const vector<Student>& studenci) {
    ofstream plik(sciezka, ios::app);
    if (!plik.is_open()) {
        throw runtime_error("Nie można zapisać do pliku: " + sciezka);
    }

    for (const auto& student : studenci) {
        plik << student.imie << ";" << student.nazwisko << ";" << student.plec << ";" << student.ocena;
        if (!student.email.empty()) {
            plik << ";" << student.email;
        }
        plik << endl;
    }

    plik.close();
}

// Funkcja sortująca studentów po ocenie
void posortujOceny(vector<Student>& studenci) {
    sort(studenci.begin(), studenci.end(), [](const Student& a, const Student& b) {
        return a.ocena < b.ocena;
    });
}

// Funkcja wyświetlająca książkę adresową
void wyswietlKsiazke(const vector<Student>& studenci) {
    cout << setw(30) << left << "Imię"
         << setw(30) << left << "Nazwisko"
         << setw(10) << left << "Płeć"
         << setw(10) << left << "Ocena"
         << setw(30) << left << "Email" << endl;
    cout << string(110, '-') << endl;

    for (const auto& student : studenci) {
        student.wyswietl();
    }
}

int main() {
    vector<Student> studenci;

    try {
        string sciezka;
        cout << "Podaj ścieżkę do pliku CSV: ";
        cin >> sciezka;

        studenci = wczytajDane(sciezka);

        int opcja;
        do {
            cout << "\nMenu:\n"
                 << "1. Wyświetl książkę adresową\n"
                 << "2. Dodaj nowego studenta\n"
                 << "3. Wyświetl osoby o podanym nazwisku\n"
                 << "4. Stwórz pliki k.csv i m.csv\n"
                 << "5. Wyświetl X pierwszych studentów\n"
                 << "6. Posortuj studentów po ocenie\n"
                 << "7. Wyjdź\n"
                 << "Wybierz opcję: ";
            cin >> opcja;

            switch (opcja) {
                case 1:
                    wyswietlKsiazke(studenci);
                    break;

                case 2: {
                    string imie, nazwisko, plec, email;
                    double ocena;

                    cout << "Podaj imię: ";
                    cin >> imie;
                    cout << "Podaj nazwisko: ";
                    cin >> nazwisko;
                    cout << "Podaj płeć (K/M): ";
                    cin >> plec;
                    cout << "Podaj ocenę: ";
                    cin >> ocena;
                    cout << "Podaj email (opcjonalnie): ";
                    cin >> email;

                    try {
                        walidujDane(imie, nazwisko, plec, ocena, email);
                        studenci.emplace_back(imie, nazwisko, plec, ocena, email);
                        cout << "Dodano studenta!\n";
                    } catch (const invalid_argument& e) {
                        cout << "Błąd: " << e.what() << endl;
                    }
                    break;
                }

                case 3: {
                    string nazwisko;
                    cout << "Podaj nazwisko: ";
                    cin >> nazwisko;

                    for (const auto& student : studenci) {
                        if (student.nazwisko == nazwisko) {
                            student.wyswietl();
                        }
                    }
                    break;
                }

                case 4: {
                    vector<Student> kobiety, mezczyzni;

                    for (const auto& student : studenci) {
                        if (student.plec == "K") {
                            kobiety.push_back(student);
                        } else if (student.plec == "M") {
                            mezczyzni.push_back(student);
                        }
                    }

                    zapiszDane("k.csv", kobiety);
                    zapiszDane("m.csv", mezczyzni);

                    cout << "Pliki k.csv i m.csv zostały stworzone.\n";
                    break;
                }

                case 5: {
                    int x;
                    cout << "Podaj liczbę X: ";
                    cin >> x;

                    if (x > studenci.size()) {
                        cout << "Błąd: Plik zawiera mniej studentów niż " << x << ".\n";
                    } else {
                        for (int i = 0; i < x; ++i) {
                            studenci[i].wyswietl();
                        }
                    }
                    break;
                }

                case 6:
                    posortujOceny(studenci);
                    cout << "Studenci zostali posortowani po ocenie.\n";
                    break;

                case 7:
                    zapiszDane(sciezka, studenci);
                    cout << "Zapisano zmiany do pliku. Wyjście z programu.\n";
                    break;

                default:
                    cout << "Nieprawidłowa opcja.\n";
            }
        } while (opcja != 7);

    } catch (const exception& e) {
        cout << "Błąd: " << e.what() << endl;
    }

    return 0;
}
