#include <boost/multi_index_container.hpp>
#include <boost/multi_index/hashed_index.hpp>
#include <boost/multi_index/member.hpp>
#include <boost/bind.hpp>
#include <boost/multi_index/ordered_index.hpp>
#include <boost/multi_index/random_access_index.hpp>
#include <boost/fusion/container.hpp>
#include <boost/fusion/sequence.hpp>
#include <boost/fusion/container.hpp>

#include <iostream>
#include <numeric>
#include <vector>
#include <set>
#include <map>

#include "Person.h"
#include "Print.h"

using namespace std;
using namespace boost::multi_index;

typedef multi_index_container<Person, indexed_by<hashed_non_unique<member<Person, string, &Person::name>>, hashed_non_unique<member<Person, int, &Person::age>>>> person_multi;

typedef person_multi::nth_index<0>::type name_type;

typedef person_multi::nth_index<1>::type age_type;

void UlaToUrszula(Person& x) {
    x.name = "Urszula";
}

void AlaToAlicja(Person& x) {
    if (x.name == "Ala") {
        x.name = "Alicja";
    }
}

typedef multi_index_container<Person, indexed_by<ordered_non_unique<member<Person, string, &Person::name> >,
    ordered_non_unique<member<Person, int, &Person::age> >, random_access<> >> person_multi_2;

typedef person_multi_2::nth_index<0>::type name_type2;

typedef person_multi_2::nth_index<1>::type age_type2;

// przyklad dzialania funkcji bind
void firstArgMod(int& x, int y) {
    x += y;
}

void printF(int x) {
    cout << x << " ";
}

void contatination(int i1, int i2) {
    cout << i1 << i2 << endl;
}

class Operation {
public:
    int operator()(int a, int b) {
        return a - b;
    }
    int operator()(char a) {
        return (int)a-32;
    }
};
int addition(int a, int b) {
    return a + b;
}


// Zadanie 6.2. Ksiazka teleadresowa
class Contact {
public:
    string name;
    string surname;
    int age;
    string phone_number;
    string street;

    Contact(string name, string surname, int age, string phone, string street) : name(name), surname(surname), age(age), phone_number(phone), street(street){}

    void show() const {
        cout << "Imie: " << name << ", Nazwisko: " << surname << ", Wiek: " << age
             << ", Numer telefonu: " << phone_number << ", Ulica: " << street << endl;
    }
};

class Contacts {
private:
    typedef multi_index_container<
        Contact, indexed_by<
            hashed_unique<member<Contact, string, &Contact::phone_number>>,
            ordered_non_unique<member<Contact, string, &Contact::street>>,
            ordered_non_unique<member<Contact, int, &Contact::age>>,
            ordered_non_unique<member<Contact, string, &Contact::surname>>
            >> phone_book_t;

    phone_book_t phone_book;

    typedef phone_book_t::nth_index<0>::type phone_index;
    typedef phone_book_t::nth_index<1>::type street_index;
    typedef phone_book_t::nth_index<2>::type age_index;
    typedef phone_book_t::nth_index<3>::type surname_index;

public:
    bool addContact(const Contact& contact) {
        return phone_book.insert(contact).second;
    }
    bool removeContact(const string& phone_number) {
        cout << "Usuwanie kontaktu o numerze tel. " << phone_number << endl;
        return phone_book.get<0>().erase(phone_number) > 0;
    }
    void findByStreet(const string& street) const{
        auto& street_index = phone_book.get<1>();
        auto range = street_index.equal_range(street);

        cout << "Wszystkie osoby mieszkajace na ulicy " << street << ": " << endl;
        for (auto it=range.first; it!=range.second; ++it) {
            it->show();
        }
    }
    void findByAgeRange(int min_age, int max_age) const {
        auto& age_index = phone_book.get<2>();
        auto start = age_index.lower_bound(min_age);
        auto end = age_index.upper_bound(max_age);

        cout << "Osoby z podanego przedzialu wiekowego <" << min_age << ", " << max_age << ">:" << endl;
        for(auto it = start; it != end; ++it) {
            it->show();
        }
    }
    void findByPhone(const string& phone) const {
        auto& phone_index = phone_book.get<0>();
        auto it = phone_index.find(phone);

        if(it != phone_index.end()) {
            cout << "Osoba z podanym numerem telefonu (" << phone << "):" << endl;
            it->show();
        } else {
            cout << "Nie znaleziono kontaktu z numerem " << phone << endl;
        }
    }
    void changeStreetName(const string& old_street, const string& new_street) {
        auto& street_index = phone_book.get<1>();
        auto range = street_index.equal_range(old_street);

        vector<Contact> contacts_to_modify;
        for(auto it = range.first; it != range.second; ++it) {
            Contact modified = *it;
            modified.street = new_street;
            contacts_to_modify.push_back(modified);
        }

        for(const auto& contact : contacts_to_modify) {
            phone_book.get<0>().erase(contact.phone_number);
            phone_book.insert(contact);
        }
    }
    int countAdults() const {
        auto& age_index = phone_book.get<2>();
        return distance(age_index.lower_bound(18), age_index.end());
    }
    int countUniqueSurnames() const {
        set<string> unique_surnames;
        auto& surname_index = phone_book.get<3>();

        for(const auto& contact : surname_index) {
            unique_surnames.insert(contact.surname);
        }

        return unique_surnames.size();
    }
    void showAll() const {
        cout << "Zapisane kontakty:" << endl;
        for(const auto& contact : phone_book) {
            contact.show();
        }
        cout << endl;
    }
};


// Zadanie 6.3. Statystyka
template<typename T>
void zad6_3(const vector<T>& vec) {
    if (vec.empty()) {
        cout << "wektor jest pusty." << endl;
        return;
    }

    T mean = accumulate(vec.begin(), vec.end(), T(0)) / vec.size();\
    vector<T> sorted = vec;
    sort(sorted.begin(), sorted.end());
    T median = sorted.size() % 2 == 0
        ? (sorted[sorted.size() / 2 - 1] + sorted[sorted.size() / 2]) / 2
        : sorted[sorted.size() / 2];

    cout << "Srednia = " << mean << endl;
    cout << "Mediana = " << median << endl;

    cout << "a) elementy mniejsze od sredniej (" << mean << "): " << endl;
    for_each(vec.begin(), vec.end(),
        bind([](T el, T mean) {
            if (el < mean)
                cout << el << " ";
        }, placeholders::_1,mean));
    cout << endl;

    cout << "b) elementy miedzy srednia arytmetyczna a mediana: " << endl;
    for_each(vec.begin(), vec.end(),
             bind([](T el, T mean, T median) {
                 if (el > min(mean, median) && el < max(mean, median))
                     cout << el << " ";
             }, placeholders::_1, mean, median));
    cout << endl;

    cout << "c) elementy dodatnie: " << endl;
    for_each(vec.begin(), vec.end(),
        bind([](T el) {
            if (el > 0)
                cout << el << " ";
        }, placeholders::_1));
    cout << endl;
}

// Zadanie 6.4. Mix
template<typename FusionVector>
map<string, int> countTypes(const FusionVector& vec) {
    map<string, int> typeCounts;

    auto countType = [&typeCounts](const auto& element) {
        string typeName = typeid(element).name();
        typeCounts[typeName]++;
    };

    for_each(vec, countType);

    return typeCounts;
}

int main() {
    // person_multi persons;
    //
    // persons.insert({"Ala", 40});
    // persons.insert({"Piotr", 10});
    // persons.insert({"Ola", 18});
    // persons.insert({"Ala", 46});
    // persons.insert({"Ula", 46});
    //
    // cout << "Liczba osob o imieniu Ala: " << persons.count("Ala") << endl;
    //
    // cout << "Liczba osob o imieniu Ala: " << persons.get<0>().count("Ala") << endl;
    //
    // age_type &age_index = persons.get<1>();
    // cout << "Liczba osob z wiekiem 18 lat: " << age_index.count(18) << endl;
    //
    // for (name_type::iterator it=persons.get<0>().begin(); it != persons.get<0>().end(); ++it){
    //     it->show();
    // }
    //
    // auto &age_indexx = persons.get<1>();
    // auto it = age_indexx.find(46);
    // cout << "Znaleziona osoba, ktora ma 46 lat " << it->name << endl;
    //
    // auto &name_indexx = persons.get<0>();
    // auto itt = name_indexx.find("Ula");
    // name_indexx.modify(itt, boost::bind(UlaToUrszula,_1));
    //
    // cout << "Przed modyfikacja: " << endl;
    // vector<name_type::iterator> elements;
    // for (name_type::iterator it=persons.get<0>().begin(); it != persons.get<0>().end(); ++it) {
    //     it->show();
    //     elements.push_back(it);
    // }
    //
    // for (int i=0; i<elements.size(); i++) {
    //     name_indexx.modify(elements[i], boost::bind(AlaToAlicja,_1));
    // }
    //
    // cout << "Po modyfikacji" << endl;
    // for (name_type::iterator it=persons.get<0>().begin(); it != persons.get<0>().end(); ++it) {
    //     it->show();
    // }
    //
    // person_multi_2 persons2;
    //
    // persons2.get<2>().push_back({"Ala", 40});
    // persons2.get<2>().push_back({"Ala", 45});
    // persons2.get<2>().push_back({"Piotr", 10});
    // persons2.get<2>().push_back({"Ola", 18});
    // persons2.get<2>().push_back({"Aga", 46});
    // persons2.get<2>().push_back({"Ula", 46});
    //
    // auto &name_indexx2 = persons2.get<0>();
    // auto iterStart = name_indexx2.equal_range("Ala");
    // auto iterStop = name_indexx2.equal_range("Piotr");
    //
    // cout << "przedzial od Ala do Piotr - wersja 1" << endl;
    //
    // for (name_type2::iterator it=iterStart.first; it!=iterStop.second; ++it) {
    //     it->show();
    // }
    //
    // auto from = name_indexx2.lower_bound("Ala");
    // auto to = name_indexx2.upper_bound("Piotr");
    //
    // cout << "przedzial od Ala do Piotr - wersja 2" << endl;
    //
    // for (auto it=from; it != to; ++it) {
    //     it->show();
    // }
    //
    // auto &rand_indexx = persons2.get<2>();
    // cout << rand_indexx[0].name << endl;
    //
    // boost::fusion::vector<int, string, bool, double> vec{10, "C++", true, 3.14};
    // cout << "Trzeci element w vec: " << boost::fusion::at<boost::mpl::int_<2>>(vec) << endl;
    //
    // auto vec2 = push_back(vec, 'M');
    // cout << "Liczba elementow w vec: " << size(vec) << endl;
    // cout << "Liczba elementow w vec2: " << size(vec2) << endl;
    // cout << "Pierwszy element w vec2: " << front(vec2) << endl;
    // cout << "Ostatni element w vec2: " << back(vec2) << endl;
    //
    // cout << "Cala zawartosc vec2: " << endl;
    // boost::fusion::for_each(vec2, Print());
    //
    // auto itvStart = begin(vec);
    // auto itvStop = end(vec);
    // cout << "Pierwszy element: " << *itvStart << endl;
    // cout << "Drugi element: " << *next(itvStart) << endl;
    // cout << "Trzeci element: " << *advance<boost::mpl::int_<2>>(itvStart) << endl;


    // przyklad dzialania funkcji bind
    // cout << "vec: " << endl;
    // vector<int> vec = {1,2,3,4,5};
    // vector<int>::iterator iter1 = vec.begin();
    // vector<int>::iterator iter2 = vec.end();
    // for_each(iter1, iter2, boost::bind(printF,_1));
    //
    // cout << endl << "vec - kazdy element zwiekszony o 5: " << endl;
    // for_each(iter1, iter2, boost::bind(firstArgMod,_1,5));
    // for_each(iter1, iter2, boost::bind(printF,_1));
    //
    // int count = count_if(vec.begin(), vec.end(),
    //     boost::bind(logical_and<bool>(),
    //     boost::bind(greater<int>(),_1,8),
    //     boost::bind(less_equal<int>(),_1,10)));
    //
    // cout << endl << "vec - 8<Elementy<=10 " << count << endl;
    //
    // cout << addition(1,2) << endl;
    // int res = boost::bind(addition,_1,_2)(1,2);
    // cout << res << endl;
    //
    // int i1=1, i2=2;
    // boost::bind(contatination,_2,_1)(i1,i2);
    //
    // Operation ff;
    // int x = 1024;
    // cout << "Funktor: " << boost::bind<int>(ff,_1,_1)(x) << endl;
    // char y = 'a';
    // cout << "Funktor: " << boost::bind<char>(ff,_1)(y) << endl;


    // Zadanie 6.2. Ksiazka teleadresowa
    // cout << "Zadanie 6.2. Ksiazka teleadresowa" << endl;
    // Contacts phone_book;
    // phone_book.addContact({"Mateusz", "Kierepka", 21, "516942256", "Sloneczne Wzgorze"});
    // phone_book.addContact({"Ola", "Gryniuk", 19, "731911946", "Topolowa"});
    // phone_book.addContact({"Mikolaj", "Lukasik", 19, "514949456", "Wygodna"});
    // phone_book.addContact({"Michal", "Kierepka", 17, "514723494", "Sloneczne Wzgorze"});
    //
    // phone_book.showAll();
    //
    // phone_book.removeContact("514949456");
    //
    // cout << endl;
    //
    // phone_book.findByStreet("Sloneczne Wzgorze");
    //
    // cout << endl;
    //
    // phone_book.findByAgeRange(19,20);
    //
    // cout << endl;
    //
    // phone_book.findByPhone("516942256");
    //
    // cout << endl;
    //
    // phone_book.changeStreetName("Sloneczne Wzgorze", "Zielone Wzgorze");
    // phone_book.showAll();
    //
    // cout << "Liczba osob pelnoletnich w ksiazce telefonicznej: " << phone_book.countAdults() << endl;
    //
    // cout << endl;
    //
    // cout << "Liczba unikalnych nazwisk: " << phone_book.countUniqueSurnames() << endl;
    //
    // cout << endl;

    // Zadanie 6.3. Statystyka
    cout << "Zadanie 6.3. Statystyka" << endl;
    vector<int> vectorInt = {1, -3, -2, 72, 9};
    vector<double> vectorDouble = {1.2, 4.3, 6, 6.4, 6.7, 8.5};

    cout << "statystyka dla vectorInt" << endl;
    zad6_3(vectorInt);

    cout << endl;

    cout << "statystyka dla vectoraDouble" << endl;
    zad6_3(vectorDouble);

    cout << endl;

    // Zadanie 6.4. Mix
    boost::fusion::vector<int, double, bool, int, char, double, int, bool, char, float> fusionVec{10, 3.14, true, 7,'c', 2.71, 42, false, 'a', 7.7f};
    auto typeCounts = countTypes(fusionVec);

    cout << "Liczba wystapien kazdego typu w kontenerze: " << endl;
    for (const auto& [type, count] : typeCounts) {
        cout << "typ: " << type << ", liczba wystapien: " << count << endl;
    }

    return 0;
}
