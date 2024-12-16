#include <iostream>

using namespace std;

class konto_zlotowkowe {
protected:
    int numer_konta;
    float saldo;

public:
    konto_zlotowkowe(int numer, float saldo): numer_konta(numer), saldo(saldo) {}

    virtual void print() const {
        cout << "Numer konta: " << numer_konta << ", saldo: " << saldo << " PLN" << endl;
    }

    virtual float przelicz() const = 0;

    virtual ~konto_zlotowkowe() {}
};

class konto_dolarowe : public konto_zlotowkowe {
private:
    float kurs;

public:
    konto_dolarowe(int numer, float saldo, float kurs_wymiany = 4.4119)
        : konto_zlotowkowe(numer, saldo), kurs(kurs_wymiany) {}

    float przelicz() const override {
        return saldo / kurs;
    }

    void print() const override {
        cout << "Numer konta: " << numer_konta
             << ", saldo: " << przelicz() << " USD" << endl;
    }

    virtual ~konto_dolarowe() {}
};

int main(){

    return 0;
}
