#include <fstream>
#include <iostream>
#include <memory>
#include <vector>

using namespace std;

class Buffer {
public:
    virtual void add(int a) = 0;
    virtual void write() = 0;

    Buffer() {
        cout << "Konstruktor Buffer" << endl;
    }
    virtual ~Buffer() {
        cout << "Destruktor Buffer" << endl;
    }
};

class BufferArr: public Buffer {
private:
    unique_ptr<int[]> tab;
    int size;
    int currentIndex;

public:
    BufferArr(int size) : tab(new int[size]), size(size), currentIndex(0) {
        cout << "Konstruktor klasy BufferArr" << endl;
    }
    ~BufferArr() {
        cout << "Destruktor klasy BufferArr" << endl;
    }

    void add(int a) override {
        if (currentIndex < size) {
            tab[currentIndex++] = a;
        } else {
            cout << "tablica pelna" << endl;
        }
    }
    void write() override {
        cout << "tablica:" << endl;
        for (int i = 0; i < currentIndex; ++i) {
            cout << tab[i] << " ";
        }
        cout << endl;
    }
    int getSize() {
        return size;
    }
    int getCurrentIndex() {
        return currentIndex;
    }
    void setSize(int newSize) {
        if (newSize >= 0 && newSize <= size) {
            size = newSize;
        } else {
            cout << "nieprawidlowa wartosc" << endl;
        }
    }
};

class BufferFile: public Buffer {
private:
    unique_ptr<ofstream> file;
    string path;

public:
    BufferFile(string path) : path(path), file(new ofstream(path)) {
        if (!file->is_open()) {
            cout << "nie mozna otworzyc pliku" << endl;
            return;
        }
        cout << "Konstruktor klasy BufferFile" << endl;
    }
    ~BufferFile() {
        if (file && file->is_open()) {
            file->close();
        }
        cout << "Destruktor klasy BufferFile" << endl;
    }

    void add(int a) override {
        if (file && file->is_open()) {
            *file << a << endl;
        } else {
            cout << "plik nie otwarty" << endl;
        }
    }
    void write() override {
        file->close();
        ifstream inFile(path);
        if (!inFile.is_open()) {
            cout << "nie mozna otworzyc pliku" << endl;
            return;
        }
        cout << "plik:" << endl;
        string line;
        while(getline(inFile, line)) {
            cout << line << endl;
        }
        inFile.close();
        file.reset(new ofstream(path, ios::app));
    }
};

int main() {
    vector<unique_ptr<Buffer>> buffers;

    buffers.push_back(make_unique<BufferArr>(5));
    buffers.push_back(make_unique<BufferArr>(3));
    buffers.push_back(make_unique<BufferArr>(7));

    buffers.push_back(make_unique<BufferFile>("buffer1.txt"));
    buffers.push_back(make_unique<BufferFile>("buffer2.txt"));
    buffers.push_back(make_unique<BufferFile>("buffer3.txt"));

    for (auto& buffer : buffers) {
        buffer->add(10);
        buffer->add(20);
    }

    for (auto& buffer : buffers) {
        buffer->write();
    }

    return 0;
}
