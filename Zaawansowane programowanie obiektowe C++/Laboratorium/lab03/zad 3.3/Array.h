//
// Created by mateu on 17.10.2024.
//

#ifndef ARRAY_H_INCLUDED
#define ARRAY_H_INCLUDED

#include <iostream>

using namespace std;

template <typename T>
class Array {

private:

    T* data;
    int maxSize;
    int index;

public:

    Array(int size);
    Array();
    ~Array();

    void sort();
    T getMax();
    void show();
    void add(T value);
    T getId(int id);

};

template<typename T>
Array<T>::Array(int size) {
    maxSize = size;
    data = new T[maxSize];
    index = 0;
}

template<typename T>
Array<T>::Array() {
    maxSize = 10;
    data = new T[maxSize];
    index = 0;
}

template<typename T>
Array<T>::~Array() {
    delete[] data;
}

template<typename T>
void Array<T>::sort() {
    if (index == 0) {
        return;
    } else {
        for (int i = 0; i < maxSize - 1; ++i) {
            for (int j = 0; j < maxSize - i - 1; ++j) {
                if (data[j] > data[j + 1]) {
                    swap(data[j], data[j + 1]);
                }
            }
        }
    }
}

template<typename T>
T Array<T>::getMax() {
    if (index == 0) {
        cout << "Pusta tablica." << endl;
        return 0;
    } else {
        int max = data[0];
        for (int i = 1; i < index; i++) {
            if (max < data[i]) {
                max = data[i];
            }
        }
        return max;
    }
}

template<typename T>
void Array<T>::show() {
    if (index == 0) {
        cout << "Tablica pusta." << endl;
    } else {
        for (int i = 0; i < index; i++) {
            cout << data[i] << " ";
        }
        cout << endl;
    }
}

template<typename T>
void Array<T>::add(T value) {
    if (index > maxSize) {
        cout << "Tablica jest pelna!" << endl;
    } else {
        data[index] = value;
        index++;
    }
}

template<typename T>
T Array<T>::getId(int id) {
    if (id < 0 || id > index) {
        cout << "Nieprawidlowe id." << endl;
        return 0;
    }else {
        return data[id];
    }
}

template <>
class Array<string> {

private:

    string* array;
    int max_size;
    int index;

public:

    Array(int size){
        max_size = size;
        array = new string[max_size];
        index = 0;
    }
    Array(){
        max_size = 10;
        array = new string[max_size];
        index = 0;
    }
    ~Array() {
        delete[] array;
    }
    void add(string element) {
        if (index > max_size) {
            cout << "Tablica jest pelna." << endl;
            return;
        }
        array[index] = element;
        index++;
    }
    void sort() {
        if (index == 0) {
            cout << "Pusta tablica." << endl;
        } else {
            for (int i = 0; i < max_size - 1; ++i) {
                for (int j = 0; j < max_size - i - 1; ++j) {
                    if (array[j].length() > array[j + 1].length()) {
                        swap(array[j], array[j + 1]);
                    }
                }
            }
        }
    }
    string max_element(){
        if (index == 0) {
            cout << "Tablica jest pusta" << endl;
            return "";
        } else {
            string maxString = array[0];
            for (int i = 1; i < index; ++i) {
                if (array[i].length() > array[i-1].length()) {
                    maxString = array[i];
                }
            }
            return maxString;
        }
    }
    void show(){
        for (int i = 0; i < index; ++i) {
            cout << array[i] << " ";
        }
        cout << endl;
    }
    string get(int id){
        if (id <= 0 || id >= index) {
            cout << "Blad danych" << endl;
            return "";
        }
        return array[index];
    }
};

#endif //ARRAY_H_INCLUDED
