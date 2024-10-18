import Foundation

// Zadanie 4.1. Utwórz aplikację konsolową – ciąg Fibonacciego

print("podaj maksymalna wartosc ciagu fibonacciego: ")
if let input = readLine(), let licz = Int(input), licz >= 0{
    
    var a = 0
    var b = 1

    print(a)

    while b <= licz {
        
        print(b)
        let temp = a + b
        a = b
        b = temp

    }
} else{
    print("blad danych.")
}

// Zadanie 4.2. Utwórz aplikację konsolową – liczba pierwsza

print("podaj liczbe: ")
if let input = readLine(), let liczba = Int(input){

    if liczba < 2{
        print("\(liczba) nie jest liczba pierwsza")
    } else{
        var czyPierwsza = true

        for i in 2 ..< Int(sqrt(Double(liczba))) + 1{
            if liczba % i == 0{
                czyPierwsza = false
                break
            }
        }

        if czyPierwsza{
            print("\(liczba) jest liczba pierwsza.")
        } else{
            print("\(liczba) nie jest liczba pierwsza.")
        }
    }
    
} else{
    print("blad danych.")
}

// Zadanie 4.3. Utwórz aplikację konsolową – średnia cyfr

var liczba: Int?

repeat {
    print("Podaj liczbę co najmniej trzycyfrową:")
    
    if let input = readLine(), let num = Int(input), num >= 100 {
        liczba = num
    } else {
        print("Niepoprawna liczba. Spróbuj ponownie.")
    }
} while liczba == nil

var temp = liczba!
var iloczyn: Double = 1
var liczbaCyfr = 0

while temp > 0 {
    let cyfra = temp % 10
    iloczyn *= Double(cyfra)
    liczbaCyfr += 1
    temp /= 10
}

let srednia = pow(iloczyn, 1.0 / Double(liczbaCyfr))

print("Średnia geometryczna cyfr liczby \(liczba!) wynosi \(srednia).")

// Zadanie 4.4. Utwórz aplikację konsolową – palindrom

print("podaj ciag: ")
if let input = readLine(){
    let ciag = input.replacingOccurrences(of:" ", with:"").lowercased()

    var isPalindrome = true;

    for i in 0 ..< ciag.count/2{
        let leftIndex = ciag.index(ciag.startIndex, offsetBy: i)
        let rightIndex = ciag.index(ciag.endIndex, offsetBy: -1 - i)

        if ciag[leftIndex] != ciag[rightIndex]{
            isPalindrome = false
            break
        }
    }
    if isPalindrome{
        print("ciag jest palindromem")
    } else{
        print("ciag nie jest palindromem")
    }
}

// Zadanie 4.5. Utwórz aplikację konsolową – minima i maksima lokalne

