//
// Created by mateu on 16.10.2024.
//

#ifndef BUFOR_H
#define BUFOR_H

class Bufor {

private:
    int* tab;
    int size;
    int index;

public:

    Bufor();
    Bufor(int size);
    virtual ~Bufor();

    virtual void add(int value);
    virtual double calculate()=0;
    int getIndex();
    int getSize();
    int getTab(int i);
    int getFirst();
    void setFirst(int value);
    void setTab(int pos, int value);
    void show();

};



#endif //BUFOR_H
