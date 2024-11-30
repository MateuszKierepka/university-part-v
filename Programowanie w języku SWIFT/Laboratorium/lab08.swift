import Foundation

// Zadanie 8.1.
struct liczbaZespolona {
    var czesc_rzeczywista: Int
    var czesc_urojona: Int
}

func + (lhs: liczbaZespolona, rhs: liczbaZespolona) -> liczbaZespolona {
    let czesc_rzeczywista = lhs.czesc_rzeczywista + rhs.czesc_rzeczywista
    let czesc_urojona = lhs.czesc_urojona + rhs.czesc_urojona
    return liczbaZespolona(czesc_rzeczywista: czesc_rzeczywista, czesc_urojona: czesc_urojona)
}

func - (lhs: liczbaZespolona, rhs: liczbaZespolona) -> liczbaZespolona {
    let czesc_rzeczywista = lhs.czesc_rzeczywista - rhs.czesc_rzeczywista
    let czesc_urojona = lhs.czesc_urojona - rhs.czesc_urojona
    return liczbaZespolona(czesc_rzeczywista: czesc_rzeczywista, czesc_urojona: czesc_urojona)
}

func * (lhs: liczbaZespolona, rhs: liczbaZespolona) -> liczbaZespolona {
    let czesc_rzeczywista = (lhs.czesc_rzeczywista * rhs.czesc_rzeczywista) - (lhs.czesc_urojona * rhs.czesc_urojona)
    let czesc_urojona = (lhs.czesc_rzeczywista * rhs.czesc_urojona) + (lhs.czesc_urojona * rhs.czesc_rzeczywista)
    return liczbaZespolona(czesc_rzeczywista: czesc_rzeczywista, czesc_urojona: czesc_urojona)
}

var lz1 = liczbaZespolona(czesc_rzeczywista: 0, czesc_urojona: 0)
var lz2 = liczbaZespolona(czesc_rzeczywista: 0, czesc_urojona: 0)

print("dane dla 1 liczby zespolonej")
print("podaj czesc rzeczywista: ")
if let input1 = readLine(), let rzeczywista1 = Int(input1) {
    lz1.czesc_rzeczywista = rzeczywista1
    print("podaj czesc urojona: ")
    if let input2 = readLine(), let urojona1 = Int(input2) {
        lz1.czesc_urojona = urojona1
    }
}

print("dane dla 2 liczby zespolonej")
print("podaj czesc rzeczywista: ")
if let input3 = readLine(), let rzeczywista2 = Int(input3) {
    lz2.czesc_rzeczywista = rzeczywista2
    print("Podaj część urojoną: ")
    if let input4 = readLine(), let urojona2 = Int(input4) {
        lz2.czesc_urojona = urojona2
    }
}

print("""
Menu funkcjonalnosci:
+ - suma liczb zespolonych
- - roznica liczb zespolonych
* - iloczyn liczb zespolonych
""")
if let choice = readLine(){
    switch choice {
    case "+":
        let suma = lz1 + lz2
        print("suma liczb zespolonych wynosi: \(suma.czesc_rzeczywista) + \(suma.czesc_urojona)i")
    case "-":
        let roznica = lz1 - lz2
        print("roznica liczb zespolonych wynosi: \(roznica.czesc_rzeczywista) + \(roznica.czesc_urojona)i")
    case "*":
        let iloczyn = lz1 * lz2
    print("iloczyn liczb zespolonych wynosi: \(iloczyn.czesc_rzeczywista) + \(iloczyn.czesc_urojona)i")
    default:
        print("blad danych...")
    }
}

// Zadanie 8.2.
struct rzutOszczepem{
    var id_zawodnika: String
    var proba1: Double
    var proba2: Double
    var proba3: Double

    func srednia() -> Double{
        return (proba1 + proba2 + proba3) / 3.0
    }
}

var zawodnicy: [rzutOszczepem] = []

for i in 1...4{
    print("wczytywanie danych zawodnika \(i).")
    print("podaj id:")
    guard let id = readLine(), !id.isEmpty else {
        print("blad danych...")
        continue
    }
    print("wynik pierwszej proby:")
    guard let res1 = readLine(), let proba1 = Double(res1) else {
        print("blad danych...")
        continue
    }
    print("wynik drugiej proby:")
    guard let res2 = readLine(), let proba2 = Double(res2) else {
        print("blad danych...")
        continue
    }
    print("wynik trzeciej proby:")
    guard let res3 = readLine(), let proba3 = Double(res3) else {
        print("blad danych...")
        continue
    } 
    let zawodnik = rzutOszczepem(id_zawodnika: id, proba1: proba1, proba2: proba2, proba3: proba3)
    zawodnicy.append(zawodnik)
}

var max_srednia = zawodnicy[0].srednia()
var zawodnik_z_max_srednia = zawodnicy[0]
var min_srednia = zawodnicy[0].srednia()
var zawodnik_z_min_srednia = zawodnicy[0]
for zawodnik in zawodnicy{
    let srednia = zawodnik.srednia()
    if srednia < min_srednia{
        min_srednia = srednia
        zawodnik_z_min_srednia = zawodnik
    }
    if srednia > max_srednia{
        max_srednia = srednia
        zawodnik_z_max_srednia = zawodnik
    }
}

print("zawodnik z najlepsza srednia:")
print("ID: \(zawodnik_z_max_srednia.id_zawodnika) , proby: \(zawodnik_z_max_srednia.proba1), \(zawodnik_z_max_srednia.proba2), \(zawodnik_z_max_srednia.proba3)")

if let index = zawodnicy.firstIndex(where: { $0.id_zawodnika == zawodnik_z_min_srednia.id_zawodnika }) {
    zawodnicy.remove(at: index)
}
print("pozostali zawodnicy:")
for zawodnik in zawodnicy {
    print("ID: \(zawodnik.id_zawodnika), proby: \(zawodnik.proba1), \(zawodnik.proba2), \(zawodnik.proba3)")
}

// Zadanie 8.3.
var samochody = Set<String>()
samochody.insert("Audi")
samochody.insert("Ford")
samochody.insert("Opel")
samochody.insert("Renault")
samochody.insert("Mercedes")
samochody.insert("BMW")

print(samochody)

print("podaj nazwe samochodu:")
if let input = readLine(){
    if samochody.contains(input){
        samochody.remove(input)
    } else{
        print("Samochód \(input) nie istnieje w zbiorze.")
    }
}

if samochody.isEmpty{
    print("zbior pusty")
} else{
    print(samochody)
}

// Zadanie 8.4.
var students: [Int: String] = [:]

func getStudentData() -> (Int, String) {
    print("podaj id:")
    let id = Int(readLine() ?? "") ?? 0
    
    print("podaj nazwisko:")
    let lastName = readLine() ?? ""
    
    return (id, lastName)
}

for _ in 1...5 {
    let (id, lastName) = getStudentData()
    students[id] = lastName
}

for (id, lastName) in students {
    print("ID: \(id), nazwisko: \(lastName)")
}

print("podaj id szukanego studenta:")
if let id = Int(readLine() ?? "") {
    if let studentLastName = students[id] {
        print("znaleziony student: ID: \(id), nazwisko: \(studentLastName)")
    } else {
        print("nie znaleziono studenta o podanym id: \(id)")
    }
} else {
    print("blad danych...")
}

print("podaj id studenta do usuniecia:")
if let id = Int(readLine() ?? "") {
    if students.removeValue(forKey: id) != nil {
        print("Student id: \(id) zostal usuniety")
    }
} else {
    print("blad danych...")
}

// Zadanie 8.5.
struct loty{
    var departure: [Int:String]
    var destination: [Int:String]
    var time: Int
}

func sprawdzPoprawnosc(lot: loty) -> Bool {
    if lot.time <= 0 {
        return false
    }
    if lot.departure.count != 1 || lot.destination.count != 1 {
        return false
    }
    if lot.departure.keys.first == nil || lot.destination.keys.first == nil {
        return false
    }
    if lot.departure.values.first == nil || lot.destination.values.first == nil {
        return false
    }
    return true
}

print("podaj n:")
if let n = Int(readLine() ?? ""), n > 0 {
    var flights: [loty] = []
    for i in 1...n {
        print("dane dla lotu \(i):")
        print("numer lotniska wylotu:")
        let departure_number = Int(readLine() ?? "") ?? 0
        print("nazwa lotniska wylotu:")
        let departure_name = readLine() ?? ""
        print("numer lotniska docelowego:")
        let destination_number = Int(readLine() ?? "") ?? 0
        print("nazwa lotniska docelowego:")
        let destination_name = readLine() ?? ""
        print("czas podrozy w minutach:")
        let time = Int(readLine() ?? "") ?? 0
        let lot = loty(
            departure: [departure_number: departure_name],
            destination: [destination_number: destination_name],
            time: time
        )
        if sprawdzPoprawnosc(lot: lot) {
            flights.append(lot)
        } else {
            print("dane lotu \(i) niepoprawne...")
        }
    }

    for (index, lot) in flights.enumerated() {
        print("Lot \(index + 1):\nwylot z \(lot.departure.values.first ?? "") (nr \(lot.departure.keys.first ?? 0)) -> docelowe: \(lot.destination.values.first ?? "") (nr \(lot.destination.keys.first ?? 0)), czas podrozy: \(lot.time)")
    } 

    var total_time = 0
    for lot in flights {
        total_time += lot.time
    }
    let average_time = total_time / flights.count
    print("loty trwajace dluzej niz srednia:")
    for (index, lot) in flights.enumerated() {
        if lot.time > average_time {
            print("Lot \(index + 1):\nwylot z \(lot.departure.values.first ?? "") (nr \(lot.departure.keys.first ?? 0)) -> docelowe: \(lot.destination.values.first ?? "") (nr \(lot.destination.keys.first ?? 0)), czas podrozy: \(lot.time)")
        }
    }

    var indexesToRemove: [Int] = []
    for (index, lot) in flights.enumerated() {
        if lot.time < average_time {
            indexesToRemove.append(index)
        }
    }
    for index in indexesToRemove.reversed() {
        flights.remove(at: index)
    }

    for (index, lot) in flights.enumerated() {
        print("Lot \(index + 1):\nwylot z \(lot.departure.values.first ?? "") (nr \(lot.departure.keys.first ?? 0)) -> docelowe: \(lot.destination.values.first ?? "") (nr \(lot.destination.keys.first ?? 0)), czas podrozy: \(lot.time)")
    } 

} else {
    print("blad danych...")
}

