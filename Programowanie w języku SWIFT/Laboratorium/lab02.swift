// var str = "Studencie"
// str.insert("!", at: str.endIndex)
// print(str); //Studencie!
// str.insert(contentsOf: " Witaj na zajeciach z programowania
// Swift", at: str.endIndex)
// print(str);
// //Studencie! Witaj na zajeciach z programowania Swift
// str.insert(contentsOf: " w języku", at:
//  str.index(str.endIndex, offsetBy: -6))
// print(str);
// //Studencie! Witaj na zajeciach z programowania w jezyku Swift

// str.remove(at: str.index(str.startIndex, offsetBy: 9))
// print(str)
// //Studencie Witaj na zajęciach z programowania w języku Swift
// let range = str.index(str.endIndex, offsetBy: -15) ..<
//  str.index(str.endIndex, offsetBy: -6)
// str.removeSubrange(range)
// print(str)
// //Studencie Witaj na zajęciach z programowania Swift


// // zadanie 1

// import Foundation

// print("Podaj dlugosc boku szescianu:")
// if let input = readLine(), let dlugosc = Double(input) {
//     let pole = 6 * pow(dlugosc, 2)
//     let objetosc = pow(dlugosc, 3)
    
//     print(String(format: "Pole calkowite: %.2f\nObjetosc: %.2f", pole, objetosc))
    
// } else {
//     print("Blad: Nieprawidlowa liczba.")
// }


// // zadanie 2

// import Foundation

// func readDouble(prompt: String) -> Double {
//     while true {
//         print(prompt, terminator: "")
//         if let input = readLine(), let value = Double(input) {
//             return value
//         }
//         print("Nieprawidłowe dane. Proszę wprowadzić liczbę.")
//     }
// }

// let roomWidth = readDouble(prompt: "Podaj szerokość pokoju [m]: ")
// let roomLength = readDouble(prompt: "Podaj długość pokoju [m]: ")
// let hallwayWidth = readDouble(prompt: "Podaj szerokość korytarza [m]: ")
// let hallwayLength = readDouble(prompt: "Podaj długość korytarza [m]: ")
// let doorWidth = readDouble(prompt: "Podaj szerokość drzwi [m]: ")
// let moldingPrice = readDouble(prompt: "Podaj cenę listwy za metr bieżący [PLN]: ")

// let roomPerimeter = 2 * (roomWidth + roomLength)
// let hallwayPerimeter = 2 * (hallwayWidth + hallwayLength)
// let totalLength = roomPerimeter + hallwayPerimeter - 2 * doorWidth
// let totalPrice = totalLength * moldingPrice

// print("Całkowita długość potrzebnej listwy: \(String(format: "%.2f", totalLength)) metrów")
// print("Całkowita cena listwy: \(String(format: "%.2f", totalPrice)) PLN")



// // zadanie 3

// import Foundation

// let number1 = Int.random(in: 1...9)
// let number2 = Int.random(in: 1...9)
// let number3 = Int.random(in: 1...9)

// print("Wylosowane liczby: \(number1), \(number2), \(number3)")

// let sum = number1 + number2 + number3
// let average = Double(sum) / 3.0

// print(String(format: "Średnia arytmetyczna: %.2f", average))


// // zadanie 4

// import Foundation

// print("Podaj pierwszą ocenę: ", terminator: "")
// if let input1 = readLine(), let ocena1 = Double(input1) {
//     print("Podaj wagę pierwszej oceny (1-3): ", terminator: "")
//     if let wagaInput1 = readLine(), let waga1 = Int(wagaInput1), waga1 >= 1 && waga1 <= 3 {

//         print("Podaj drugą ocenę: ", terminator: "")
//         if let input2 = readLine(), let ocena2 = Double(input2) {
//             print("Podaj wagę drugiej oceny (1-3): ", terminator: "")
//             if let wagaInput2 = readLine(), let waga2 = Int(wagaInput2), waga2 >= 1 && waga2 <= 3 {

//                 print("Podaj trzecią ocenę: ", terminator: "")
//                 if let input3 = readLine(), let ocena3 = Double(input3) {
//                     print("Podaj wagę trzeciej oceny (1-3): ", terminator: "")
//                     if let wagaInput3 = readLine(), let waga3 = Int(wagaInput3), waga3 >= 1 && waga3 <= 3 {

//                         let sumaWazona = ocena1 * Double(waga1) + ocena2 * Double(waga2) + ocena3 * Double(waga3)
//                         let sumaWag = Double(waga1 + waga2 + waga3)

//                         let sredniaWazona = sumaWazona / sumaWag

//                         print("\nWażona średnia ocen: \(String(format: "%.2f", sredniaWazona))")

//                     } else {
//                         print("Nieprawidłowa waga trzeciej oceny. Waga musi być liczbą całkowitą od 1 do 3.")
//                     }
//                 } else {
//                     print("Nieprawidłowa wartość trzeciej oceny.")
//                 }

//             } else {
//                 print("Nieprawidłowa waga drugiej oceny. Waga musi być liczbą całkowitą od 1 do 3.")
//             }
//         } else {
//             print("Nieprawidłowa wartość drugiej oceny.")
//         }

//     } else {
//         print("Nieprawidłowa waga pierwszej oceny. Waga musi być liczbą całkowitą od 1 do 3.")
//     }
// } else {
//     print("Nieprawidłowa wartość pierwszej oceny.")
// }



// // zadanie 5

// import Foundation

// let singleLineString = "To jest jednoliniowy łańcuch znaków."

// let multiLineString = """
// To jest pierwszy wiersz
// To jest drugi wiersz
// A to jest trzeci wiersz wieloliniowego łańcucha znaków.
// """

// print(singleLineString)
// print(multiLineString)


// // zadanie 6

// import Foundation

// let formattedText = """
// \tNauka kodowania to nie tylko nauka języka technologii.\n
// \tTo odkrywanie nowych sposobów myślenia\n
// \tI urzeczywistnianie rozmaitych koncepcji.
// """
// print(formattedText)

// // zadanie 7

import Foundation

print("Podaj swoje imię: ", terminator: "")
let firstName = readLine() ?? ""

print("Podaj swoje drugie imię: ", terminator: "")
let middleName = readLine() ?? ""

print("Podaj swoje nazwisko: ", terminator: "")
let lastName = readLine() ?? ""

print("Podaj swój rok urodzenia: ", terminator: "")
let birthYear = readLine() ?? ""

let fullString = "Imię: \(firstName) \(middleName) \(lastName), Rok urodzenia: \(birthYear)"

print(fullString)

