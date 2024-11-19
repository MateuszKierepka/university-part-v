import Foundation

// Zadanie 7.1.

let osoba1 = (imie:"Mateusz", nazwisko:"Kierepka", rokUrodzenia:2003)
let osoba2 = (imie:"Ola", nazwisko:"Gryniuk", rokUrodzenia:2005)

if osoba1.rokUrodzenia < osoba2.rokUrodzenia {
    print("\(osoba1.imie) \(osoba1.nazwisko) jest starszy od \(osoba2.imie) \(osoba2.nazwisko).")    
} else if osoba1.rokUrodzenia > osoba2.rokUrodzenia{
    print("\(osoba2.imie) \(osoba2.nazwisko) jest starszy od \(osoba1.imie) \(osoba1.nazwisko).") 
} else{
    print("\(osoba1.imie) \(osoba1.nazwisko) i \(osoba2.imie) \(osoba2.nazwisko) sa w tym samym wieku.")
}

// Zadanie 7.2.

enum Ocena: Double{
    case ocena2 = 2.0
    case ocena3 = 3.0
    case ocena3_5 = 3.5
    case ocena4 = 4.0
    case ocena4_5 = 4.5
    case ocena5 = 5.0
}

let student : (nazwisko: String, ocena1: Ocena, ocena2: Ocena, ocena3: Ocena)
func sredniaOcen(student: (nazwisko: String, ocena1: Ocena, ocena2: Ocena, ocena3: Ocena)) -> (String, Double){
    let srednia = (student.ocena1.rawValue + student.ocena2.rawValue + student.ocena3.rawValue) / 3.0
    return (student.nazwisko, srednia)
}

print(sredniaOcen(student: ("Mateusz", Ocena.ocena4, Ocena.ocena5, Ocena.ocena5)))

var studenci: [(nazwisko: String, ocena1: Ocena, ocena2: Ocena, ocena3: Ocena)] = []

for i in 0...2{
    print("Wczytywanie danych dla studenta #\(i+1):")
    print("Podaj nazwisko: ")
    let nazwisko = readLine() ?? ""

    print("Podaj 1. ocene: ")
    guard let ocena = readLine(), let ocena1 = Double(ocena), let ocenaEnum1 = Ocena(rawValue: ocena1) else{
        print("niepoprawne dane")
        continue
    }
    
    print("Podaj 2. ocene: ")
    guard let ocena = readLine(), let ocena2 = Double(ocena), let ocenaEnum2 = Ocena(rawValue: ocena2) else{
        print("niepoprawne dane")
        continue
    }

    print("Podaj 3. ocene: ")
    guard let ocena = readLine(), let ocena3 = Double(ocena), let ocenaEnum3 = Ocena(rawValue: ocena3) else{
        print("niepoprawne dane")
        continue
    }

    studenci.append((nazwisko:nazwisko, ocena1: ocenaEnum1, ocena2: ocenaEnum2, ocena3: ocenaEnum3))
}

let posortowaniStudenci = studenci.map { student in
    (nazwisko: student.nazwisko,
     srednia: (student.ocena1.rawValue + student.ocena2.rawValue + student.ocena3.rawValue) / 3.0)
}.sorted(by: { $0.srednia > $1.srednia })

print("studenci z ich srednimi ocen (malejaco):")
for (index, student) in posortowaniStudenci.enumerated(){
        print("\(index + 1). \(student.nazwisko) - średnia: \(String(format: "%.2f", student.srednia))")
}

// Zadanie 7.3.

enum Miesiac: String{
    case styczen, luty, marzec, kwiecien, maj, czerwiec, lipiec, sierpien, wrzesien, pazdziernik, listopad, grudzien
}

func poraRoku(dla miesiaca: Miesiac) -> String {
    switch miesiaca {
    case .grudzien, .styczen, .luty:
        return "Zima"
    case .marzec, .kwiecien, .maj:
        return "Wiosna"
    case .czerwiec, .lipiec, .sierpien:
        return "Lato"
    case .wrzesien, .pazdziernik, .listopad:
        return "Jesien"
    }
}

var miesiac = Miesiac.czerwiec
print("Pora roku dla miesiąca \(miesiac): \(poraRoku(dla: miesiac))")
miesiac = Miesiac.luty
print("Pora roku dla miesiąca \(miesiac): \(poraRoku(dla: miesiac))")
miesiac = Miesiac.pazdziernik
print("Pora roku dla miesiąca \(miesiac): \(poraRoku(dla: miesiac))")
miesiac = Miesiac.maj
print("Pora roku dla miesiąca \(miesiac): \(poraRoku(dla: miesiac))")

// Zadanie 7.4.

func wczytajDaneMieszkan() -> [(lokalizacja: String, powierzchnia: Double, cena_za_m2: Double)]{
    print("podaj liczbe mieszkan:")
    if let input = readLine(), let liczba_mieszkan = Int(input), liczba_mieszkan > 0{
        var mieszkanie: [(lokalizacja: String, powierzchnia: Double, cena_za_m2: Double)] = []
        for i in 0...liczba_mieszkan-1{
            print("Wczytywanie danych dla mieszkania #\(i+1):")
            print("podaj lokalizacje mieszkania: ")
            guard let lokal = readLine(), !lokal.isEmpty else{
                print("nieprawidlowe dane...")
                continue
            }
            print("podaj powierzchnie mieszkania: ")
            guard let input = readLine(), let powierz = Double(input), powierz > 0 else{
                print("nieprawidlowe dane...")
                continue
            }
            print("podaj cene za m^2 mieszkania: ")
            guard let input = readLine(), let cena = Double(input), cena > 0 else{
                print("nieprawidlowe dane...")
                continue
            }
            mieszkanie.append((lokalizacja: lokal, powierzchnia: powierz, cena_za_m2: cena))
        }
        for i in 0...liczba_mieszkan-1{
            print("\(i+1). mieszkanie : \(mieszkanie[i].lokalizacja) \(mieszkanie[i].powierzchnia) \(mieszkanie[i].cena_za_m2)")
        }
        return mieszkanie
    } else{
        print("nieprawidlowe dane...")
        return []
    }
}

func najdrozszeOrazNajtansze(mieszkanie: [(lokalizacja: String, powierzchnia: Double, cena_za_m2: Double)]) -> (String, String){
    guard !mieszkanie.isEmpty else{
        print("brak mieszkan...")
        return ("", "")
    }
    
    var najdrozsze = mieszkanie[0].lokalizacja
    var najtansze = mieszkanie[0].lokalizacja
    var max_cena = mieszkanie[0].powierzchnia * mieszkanie[0].cena_za_m2
    var min_cena = max_cena

    for i in 1..<mieszkanie.count{
        let cena = mieszkanie[i].powierzchnia * mieszkanie[i].cena_za_m2
        if cena > max_cena{
            max_cena = cena
            najdrozsze = mieszkanie[i].lokalizacja
        }
        if cena < min_cena{
            min_cena = cena
            najtansze = mieszkanie[i].lokalizacja
        }
    }
    
    return (najdrozsze, najtansze)
}

let mieszkania = wczytajDaneMieszkan()
if !mieszkania.isEmpty{
    let wynik = najdrozszeOrazNajtansze(mieszkanie: mieszkania)
    print("Najdrozsze mieszkanie znajduje sie w lokalizacji: \(wynik.0)")
    print("Najtansze mieszkanie znajduje sie w lokalizacji: \(wynik.1)")
}