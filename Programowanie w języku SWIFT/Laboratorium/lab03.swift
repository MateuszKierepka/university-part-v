import Foundation

// Zadanie 3.1. Utwórz aplikację konsolową – szukanie znaku

print("podaj dowolny ciag znakow: ")
let inputString = readLine() ?? ""

print("Podaj pojedynczy znak: ")
let inputChar = readLine() ?? ""

print("Podaj liczbe calkowita: ")
let inputNumber = Int(readLine() ?? "") ?? 0

if inputChar.count != 1 {

    print("Podano więcej niż jeden znak.")

} else {

    let char = Character(inputChar)


    if inputString.first == char {
        print("Znak \(char) znajduje się na początku ciągu.")
    }

    if inputString.last == char {
        print("Znak \(char) znajduje się na końcu ciągu.")
    }

    if inputNumber >= 1 && inputNumber < inputString.count {

        let indexFromStart = inputString.index(inputString.startIndex, offsetBy: inputNumber)
        if inputString[indexFromStart] == char {

            print("Znak \(char) znajduje się na pozycji oddalonej o \(inputNumber) od początku ciągu.")
        
        }
    }

    if inputNumber >= 0 && inputNumber < inputString.count {

        let indexFromEnd = inputString.index(inputString.endIndex, offsetBy: -inputNumber - 1)
        if inputString[indexFromEnd] == char {
            
            print("Znak \(char) znajduje się na pozycji oddalonej o \(inputNumber) od końca ciągu.")
        
        }
    }

}

// Zadanie 3.2. Utwórz aplikację konsolową – porównywanie ciągów

// Polecenie 1. Utwórz program, który wczyta od użytkownika dwa ciągi i sprawdzi, czy oba ciągi są identyczne.

print("Podaj pierwszy ciąg znaków:")
let firstString = readLine() ?? ""


print("Podaj drugi ciąg znaków:")
let secondString = readLine() ?? ""

if firstString == secondString {
    print("Oba ciągi są identyczne.")
} else {
    print("Ciągi są różne.")
}

// Polecenie 2. Wczytaj prefiks od użytkownika. Należy sprawdzić, czy prefiks występuje w podanych ciągach.

print("Podaj prefiks:")
let prefix = readLine() ?? ""

if firstString.hasPrefix(prefix) {
    print("Prefiks '\(prefix)' występuje w pierwszym ciągu.")
} else {
    print("Prefiks '\(prefix)' nie występuje w pierwszym ciągu.")
}

if secondString.hasPrefix(prefix) {
    print("Prefiks '\(prefix)' występuje w drugim ciągu.")
} else {
    print("Prefiks '\(prefix)' nie występuje w drugim ciągu.")
}

// Polecenie 3. Wczytaj sufiks od użytkownika. Należy sprawdzić, czy sufiks występuje w podanych ciągach.

print("Podaj sufiks:")
let suffix = readLine() ?? ""

if firstString.hasSuffix(suffix) {
    print("Sufiks '\(suffix)' występuje w pierwszym ciągu.")
} else {
    print("Sufiks '\(suffix)' nie występuje w pierwszym ciągu.")
}

if secondString.hasSuffix(suffix) {
    print("Sufiks '\(suffix)' występuje w drugim ciągu.")
} else {
    print("Sufiks '\(suffix)' nie występuje w drugim ciągu.")
}

// Zadanie 3.3. Utwórz aplikację konsolową – rok przestępny

print("Podaj rok: ")
if let input = readLine(), let year = Int(input), year > 0 {

    if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) {
        print("Rok przestepny.")
    } else {
        print("Rok nieprzestepny.")
    }

} else {
    print("Podano niepoprawne dane. Upewnij się, że podajesz liczbę dodatnią.")
}

// Zadanie 3.4. Utwórz aplikację konsolową – wiek

print("Podaj rok z zakresu 2-3010:")
if let input = readLine(), let year = Int(input), year >= 2 && year <= 3010 {

     let century = (year - 1) / 100 + 1
     print("Rok \(year) należy do wieku \(century).")

} else{
    print("Podano niepoprawny rok. Upewnij się, że rok jest liczbą z zakresu 2-3010.")
}

// Zadanie 3.5. Utwórz aplikację konsolową – stypendium

print("Podaj srednia ze studiow: ")
if let input = readLine(), let avg = Double(input), avg >= 2.0 && avg <= 5.0{

    let scholarship: Int

    switch avg {
    case 4.5 ... 5.0:
        scholarship = 200
        break
    case 4.0 ..< 4.5:
        scholarship = 150
        break
    case 3.5 ..< 4.0:
        scholarship = 100
        break
    case 2.0 ..< 4.0:
        scholarship  = 0
        break 
    default:
        print("Podales bledne dane...")
        scholarship = 0;    
    }

    print("Stypendium wynosi:  \(scholarship) PLN.")

} else{
    print("Podano nieprawidlowe dane!")
}

// Zadanie 3.6. Utwórz aplikację konsolową – kalkulator

print("podaj pierwsza liczbe: ")
guard let input = readLine(), let var1 = Int(input) else {
    fatalError("Bledne dane.")
}

print("podaj druga liczbe: ")
guard let input = readLine(), let var2 = Int(input) else {
    fatalError("Bledne dane.")
}

print("""
Wybierz działanie:
1 - Dodawanie
2 - Odejmowanie
3 - Mnożenie
4 - Dzielenie
""")

guard let input = readLine(), let choice = Int(input) else {
    fatalError("Bledne dane")
}

switch choice {
case 1:

    let result = var1 + var2
    print("Wynik dodawania: \(result)")
    
case 2:

    let result = var1 - var2
    print("Wynik odejmowania: \(result)")
    
case 3:

    let result = var1 * var2
    print("Wynik mnożenia: \(result)")
    
case 4:

    if var2 == 0 {
        print("dzielenie przez 0")
    } else {
        let result = Double(var1) / Double(var2)
        print("Wynik dzielenia: \(result)")
    }

default:
    print("Wybrano niepoprawną opcję.")
}

// Zadanie 3.7. Utwórz aplikację konsolową – znak z klawiatury

print("podaj jeden znak:")
if let input = readLine(), let char = input.first {

    switch char{
        case "a", "A", "e", "E", "i", "I", "o", "O", "u", "U":
            print("Samogloska")
        case "b", "B", "c", "C", "d", "D", "f", "F", "g", "G", "h", "H", "j", "J", "k", "K", "l", "L", "m", "M", "n", "N", "p", "P", "q", "Q", "r", "R", "s", "S", "t", "T", "v", "V", "w", "W", "x", "X", "y", "Y", "z", "Z":
            print("Spolgloska")
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            print("Cyfra")
        default:
            print("Inny znak")
    }

} else{
    print("blad")
}