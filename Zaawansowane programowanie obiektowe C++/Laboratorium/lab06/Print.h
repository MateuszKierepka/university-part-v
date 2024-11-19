//
// Created by mateu on 18.11.2024.
//

#ifndef PRINT_H
#define PRINT_H

class Print {
public:
    template <typename T>
    void operator()(T t) {
        cout << t << endl;
    }
};

#endif //PRINT_H
