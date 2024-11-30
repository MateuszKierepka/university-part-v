#include "mainwindow.h"

#include <boost/bind.hpp>
#include <QCoreApplication>
#include <iostream>
#include <QVector>

using namespace std;

template<typename T>
void show(QVector<T> vec){
    cout << "Zawartosc vec: ";
    typename QVector<T>::iterator p;
    for (p = vec.begin(); p!=vec.end(); ++p){
        cout << *p << " ";
    }
    cout << endl;
}

class Compare{
public:
    bool operator()(int s1, int s2){
        if(s1%2 > s2%2)
            return true;
        else
            return false;
    }
};

int main(int argc, char *argv[]){
    QCoreApplication a(argc, argv);

    // przykład działania kontenera QVector
    QVector<int> vec(6);
    vec[0] = 1;
    vec[1] = 2;

    vec.append(2);
    vec.push_back(4);

    vec << 5 << 6;

    cout << "Zawartosc vec: ";
    for(int i=0; i<vec.count(); ++i){
        cout << vec.at(i) << " ";
    }

    cout << endl << "Zawartosc vec: :";
    QVectorIterator<int> i(vec);
    while(i.hasNext()){
        cout << i.next() << " ";
    }

    cout << endl;
    show(vec);

    cout << "Zawartosc vec: :";
    QVector<int>::iterator p;
    for (p=vec.begin(); p!=vec.end(); ++p){
        *p += 2;
        cout << *p << " ";
    }

    cout << endl;
    vec.insert(1,666);
    vec.insert(vec.begin(), 777);
    show(vec);

    cout << "Ostatni indeks gdzie 2: " << vec.lastIndexOf(2) << endl;
    vec.move(1, vec.length()-1);
    vec.remove(3);
    show(vec);



    // przyklad uzycia kontenera QMap
    QMap<int, QString> shops;
    shops[111] = "CCC";
    shops[222] = "Decathlon";
    shops.insert(333, "Reserved");

    QMapIterator<int, QString> j(shops);
    while(j.hasNext()){
        j.next();
        cout << "Id: " << j.key() << " sklep: " << j.value().toStdString() << endl;
    }

    QList<int> keys = shops.keys();
    QList<QString> values = shops.values();
    cout << "Klucze: " << endl;
    for (int i=0; i<keys.size(); i++){
        cout << keys[i] << " ";
    }
    cout << endl;
    QPair<QMap<int,QString>::iterator, QMap<int, QString>::iterator> range = shops.equal_range(111);
    cout << "Wartosc dla klucza 111: " << range.first->toStdString() << endl;



    // przyklad uzycia iteratora
    cout << endl << "Zawartosc vec: ";
    QVectorIterator<int> it(vec);
    while(it.hasNext()){
        cout << it.next() << " ";
    }
    cout << endl;
    // QMutableVectorIterator<int> itM(vec);
    // while(itM.hasNext()){
    //     itM.next();
    //     itM.setValue(-1);
    // }

    // itM.toFront();
    // cout << endl << "Zawartosc vec: ";
    // while (itM.hasNext()) {
    //     cout << itM.next() << " ";
    // }

    // przyklad dzialania algorytmow z QtAlgorithms

    show(vec);
    int howMany = 0;
    qCount(vec.begin(), vec.end(), 2, howMany);
    cout << "Liczba wystapien 2: " << howMany << endl;

    QVector<int>::iterator it2 = qFind(vec.begin(), vec.end(), -2);

    if(it2 == vec.end())
        cout << "Element nie zostal znaleziony" << endl;

    qSort(vec.begin(), vec.end(), qGreater<int>());
    show(vec);

    qSort(vec.begin(), vec.end(), Compare());
    show(vec);

    return a.exec();
}
