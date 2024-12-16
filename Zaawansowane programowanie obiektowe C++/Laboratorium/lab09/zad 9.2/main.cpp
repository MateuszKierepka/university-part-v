#include <climits>
#include <exception>
#include <fstream>
#include <iostream>

using namespace std;

int main(){
    int num;
    int sum = 0;
    int count = 1;
    cin.exceptions(ifstream::failbit);
    while(sum < 21){
        try{
            cout << "Podaj liczbe ";
            cin >> num;
            sum += num;
        }
        catch(exception &e){
            cerr << "Błędne dane" << endl;
            cin.clear();
            cin.ignore();
        }
    }
    while(1){
        try{
            if(sum != 21)
                throw -1;
            cout << "Suma to 21 po probach " << count << endl;
            break;
        }
        catch(int e){
            try{
                sum -= num;
                cout << "Podaj liczbe ";
                cin >> num;
                sum += num;
                count++;
            }
            catch(exception &e){
                cerr << "Błędne dane" << endl;
                cin.clear();
                cin.ignore();
            }
        }
    }
}