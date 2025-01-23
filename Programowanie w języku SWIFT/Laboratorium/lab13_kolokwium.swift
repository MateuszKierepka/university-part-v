import Foundation

// LABORATORIUM 8 - STRUKTURY, ZBIORY, SŁOWNIKI 
// --> Przykład 1 <--
struct Prostopadloscian{
    var a: Double
    var b: Double
    var h: Double
}

struct Osoba{
    var imie: String
    var wiek: Int

    init(imie: String, wiek: Int){
        self.imie = imie
        self.wiek = wiek
    }
}

var pp = Prostopadloscian(a: 12.0, b: 20, h: 100)
pp.a = 10
pp.b = 25
pp.h = 70

let os = Osoba(imie: "Janek", wiek: 21)

var o = Osoba(imie: "Andrzej", wiek: 35)
print(o)


// --> Przykład 2 <--
var znaki = Set<Character>()
var osoby = Set<String>()

znaki.insert("z")
znaki.insert(";")
print(znaki)
znaki = []

osoby.insert("Monika")
osoby.insert("Janek")

var kwiaty: Set<String> = ["róża", "tulipan", "fiołek"] //jawnie zadeklarowany typ danych
var kwiaty2: Set = ["róża", "tulipan", "fiołek"] // pominięty typ danych

if kwiaty.isEmpty{
    print("Zbiór jest pusty")
} else{
    print(kwiaty)
}

kwiaty.insert("róża")
print(kwiaty)
kwiaty.remove("róża")
print(kwiaty)

// removeAll() - usuwa wszystkie elementy ze zbioru


// --> Przykład 3 <--
var s1: Set = [1, 5, 3, 27, 80]
var s2: Set = [2, 4, 27, 80]

var s = s1.intersection(s2).sorted() // część wspólna dwóch zbiorów
print(s) // [27, 80]

s = s1.union(s2).sorted() // suma dwóch zbiorów
print(s) // [1, 2, 3, 4, 5, 27, 80]

s = s1.subtracting(s2).sorted() // różnica dwóch zbiorów
print(s) // [1, 3, 5]

s = s1.symmetricDifference(s2).sorted() // nowy zestaw z wartoscami w jednym zestawie ale nie w obu
print(s) // [1, 2, 3, 4, 5]

// == - sprawdza czy dwa zbiory są takie same
// isSubset(of:) - sprawdza czy zbiór jest podzbiorem innego zbioru
// isSuperset(of:) - sprawdza czy zbiór jest nadzbiorem innego zbioru
// isStrictSubset(of:) - sprawdza czy zbiór jest podzbiorem czy nadzbiorem ale nie jest rowny innemu zbiorowi
// isDisjoint(with:) - sprawdza czy dwa zbiory nie mają wspólnych elementów

if s1.isSubset(of: s2){
    print("s1 jest podzbiorem s2")
} else{
    print("s1 nie jest podzbiorem s2")
}

if s1.isDisjoint(with: s2){
    print("s1 i s2 nie maja wspolnych elementow")
} else{
    print("s1 i s2 maja wspolne elementy")
}


// --> Przykład 4 <--
var sl: [Int: String] = [:] // pusty słownik
print(sl) // [:]

sl[1] = "jeden"
sl[21] = "dwadziescia jeden"
print(sl) // [21: "dwadziescia jeden", 1: "jeden"]

var kraje: [String: String] = ["PL": "Polska", "DE": "Niemcy", "FR": "Francja"]
print("Zdefiniowano \(kraje.count) kraje")

if kraje.isEmpty{
    print("Słownik jest pusty")
} else{
    print("Slownik zawiera \(kraje.count) elementow")
}
kraje["US"] = "Stany Zjednoczone"
kraje["CZ"] = "Czech"
print(kraje) // ["US": "Stany Zjednoczone", "CZ": "Czech", "FR": "Francja", "PL": "Polska", "DE": "Niemcy"]

kraje["CZ"] = "Czechy"
print(kraje) // ["US": "Stany Zjednoczone", "CZ": "Czechy", "FR": "Francja", "PL": "Polska", "DE": "Niemcy"]
// lub
if let kr = kraje.updateValue("Czech Republic", forKey: "CZ"){
    print("Zmodyfikowano \(kr)")
} else{
    print("Brakuje szukanego klucza")
}
print(kraje) // ["US": "Stany Zjednoczone", "CZ": "Czech Republic", "FR": "Francja", "PL": "Polska", "DE": "Niemcy"]

kraje["CZ"] = nil
print(kraje) // ["US": "Stany Zjednoczone", "FR": "Francja", "PL": "Polska", "DE": "Niemcy"]
// lub
if let usunietyElem = kraje.removeValue(forKey: "US"){
    print("Usunieto \(usunietyElem)")
} else{
    print("Brakuje szukanego klucza")
}
print(kraje) // ["FR": "Francja", "PL": "Polska", "DE": "Niemcy"]

for (symbol, panstwo) in kraje{
    print("\(symbol) - \(panstwo)")
}

for symbol in kraje.keys{
    print(symbol) // DE FR PL
}

for panstwo in kraje.values{
    print(panstwo) // Niemcy Francja Polska
}

let symbole = [String](kraje.keys)
print(symbole) // ["DE", "FR", "PL"]
let panstwa = [String](kraje.values)
print(panstwa) // ["Niemcy", "Francja", "Polska"]


// --> Zadanie 8.1. <--
var samochody: Set = ["Audi", "Ford", "BMW", "Mercedes", "Bugatti", "Ferrari"]
print(samochody)

print("podaj model samochodu: ")
if let input = readLine(), samochody.contains(input){
    print("Samochod \(input) znajduje sie w zbiorze")
    samochody.remove(input)
    print(samochody)
} else{
    print("Samochod nie znajduje sie w zbiorze")
}


// --> Zadanie 8.2. <--
var student: [String: String] = [:]

func pobierzDaneStudenta() {
    var count = 0
    while count < 5 {
        print("Podaj id studenta: ")
        let id = readLine()!
        if student.keys.contains(id) {
            print("Identyfikator już istnieje. Podaj inny id.")
            continue
        }
        print("Podaj nazwisko studenta: ")
        let nazwisko = readLine()!
        student[id] = nazwisko
        count += 1
    }
}

func wyswietlWszystkichStudentow() {
    print(student)
}

func wyszukajStudenta() {
    print("Wyszukiwanie w slowniku. Podaj id: ")
    if let id = readLine(), let nazwisko = student[id] {
        print("Student o id \(id) ma nazwisko: \(nazwisko)")
    } else {
        print("Nie znaleziono studenta o podanym id")
    }
}

func usunStudenta() {
    print("Usuwanie studenta. Podaj id: ")
    let id_usun = readLine()!
    print("Podaj nazwisko: ")
    let nazwisko_usun = readLine()!
    if let nazwisko = student[id_usun], nazwisko == nazwisko_usun {
        student[id_usun] = nil
        print("Usunieto studenta o id \(id_usun)")
    } else {
        print("Nie znaleziono studenta o podanym id")
    }
}

pobierzDaneStudenta()
wyswietlWszystkichStudentow()
wyszukajStudenta()
usunStudenta()
wyswietlWszystkichStudentow()


// --> Zadanie 8.3. <--
struct lot{
    var miejsceWylotu: [Int: String] = [:]
    var miejsceDocelowe: [Int: String] = [:]
    var czasPodrozy: Int
}

print("podaj n: ")
if let input = readLine(), let n = Int(input), n > 0{
    var loty: [lot] = []
    for _ in 0..<n {
        var lot = lot(czasPodrozy: 0)
        print("MIEJSCE WYLOTU")
        print("Podaj id miejsca wylotu: ")
        if let idWylotu = readLine(), let idWylotuInt = Int(idWylotu) {
            print("Podaj nazwe miejsca wylotu: ")
            if let nazwaWylotu = readLine() {
                lot.miejsceWylotu[idWylotuInt] = nazwaWylotu
            }
        }
        print("MIEJSCE DOCELOWE")
        print("Podaj id miejsca docelowego: ")
        if let idDocelowe = readLine(), let idDoceloweInt = Int(idDocelowe) {
            print("Podaj nazwe miejsca docelowego: ")
            if let nazwaDocelowa = readLine() {
                lot.miejsceDocelowe[idDoceloweInt] = nazwaDocelowa
            }
        }
        print("Podaj czas podrozy w minutach: ")
        if let czasPodrozy = readLine(), let czasPodrozyInt = Int(czasPodrozy) {
            lot.czasPodrozy = czasPodrozyInt
        }
        loty.append(lot)
    }

    for lot in loty {
        for (idWylotu, nazwaWylotu) in lot.miejsceWylotu {
            print("Miejsce wylotu: \(idWylotu) - \(nazwaWylotu)")
        }
        for (idDocelowe, nazwaDocelowa) in lot.miejsceDocelowe {
            print("Miejsce docelowe: \(idDocelowe) - \(nazwaDocelowa)")
        }
        print("Czas podrozy: \(lot.czasPodrozy) minut")
    }

    let sumaCzasuPodrozy = loty.reduce(0) { $0 + $1.czasPodrozy }
    let sredniCzasPodrozy = sumaCzasuPodrozy / loty.count
    print("\nŚredni czas podróży: \(sredniCzasPodrozy) minut")

    for lot in loty where lot.czasPodrozy > sredniCzasPodrozy {
        for (idWylotu, nazwaWylotu) in lot.miejsceWylotu {
            print("Miejsce wylotu: \(idWylotu) - \(nazwaWylotu)")
        }
        for (idDocelowe, nazwaDocelowa) in lot.miejsceDocelowe {
            print("Miejsce docelowe: \(idDocelowe) - \(nazwaDocelowa)")
        }
        print("Czas podróży: \(lot.czasPodrozy) minut")
    }

    loty = loty.filter { $0.czasPodrozy > sredniCzasPodrozy }
    print("\nLoty, których czas podróży jest dłuższy niż średnia:")
    for lot in loty {
        for (idWylotu, nazwaWylotu) in lot.miejsceWylotu {
            print("Miejsce wylotu: \(idWylotu) - \(nazwaWylotu)")
        }
        for (idDocelowe, nazwaDocelowa) in lot.miejsceDocelowe {
            print("Miejsce docelowe: \(idDocelowe) - \(nazwaDocelowa)")
        }
        print("Czas podróży: \(lot.czasPodrozy) minut")
    }
} else {
    print("Nieprawidłowa liczba n")
}


// --> Zadanie 8.4. <--
struct liczbaZespolona{
    var rzeczywista: Double
    var urojona: Double
}

func wczytajLiczbeZespolona() -> liczbaZespolona? {
    print("Podaj czesc rzeczywista:")
    guard let rzeczywistaString = readLine(), let rzeczywista = Double(rzeczywistaString) else {
        print("Nieprawidlowa czesc rzeczywista")
        return nil
    }

    print("Podaj czesc urojona:")
    guard let urojonaString = readLine(), let urojona = Double(urojonaString) else {
        print("Nieprawidlowa czesc urojona")
        return nil
    }

    return liczbaZespolona(rzeczywista: rzeczywista, urojona: urojona)
}

func + (lhs: liczbaZespolona, rhs: liczbaZespolona) -> liczbaZespolona {
    return liczbaZespolona(
        rzeczywista: lhs.rzeczywista + rhs.rzeczywista,
        urojona: lhs.urojona + rhs.urojona
    )
}

func - (lhs: liczbaZespolona, rhs: liczbaZespolona) -> liczbaZespolona {
    return liczbaZespolona(
        rzeczywista: lhs.rzeczywista - rhs.rzeczywista,
        urojona: lhs.urojona - rhs.urojona
    )
}

func * (lhs: liczbaZespolona, rhs: liczbaZespolona) -> liczbaZespolona {
    return liczbaZespolona(
        rzeczywista: lhs.rzeczywista * rhs.rzeczywista - lhs.urojona * rhs.urojona,
        urojona: lhs.rzeczywista * rhs.urojona + lhs.urojona * rhs.rzeczywista
    )
}

func wyswietlWynik(_ liczba: liczbaZespolona) {
    print("Wynik: \(liczba.rzeczywista) + \(liczba.urojona)i")
}

if let liczba1 = wczytajLiczbeZespolona(), let liczba2 = wczytajLiczbeZespolona() {
    print("Pierwsza liczba zespolona: \(liczba1.rzeczywista) + \(liczba1.urojona)i")
    print("Druga liczba zespolona: \(liczba2.rzeczywista) + \(liczba2.urojona)i")

    var dzialanie = true
    while dzialanie {
        print("\nWybierz operację:")
        print("1. Dodawanie")
        print("2. Odejmowanie")
        print("3. Mnożenie")
        print("4. Wyjście")
        if let wybor = readLine(), let opcja = Int(wybor) {
            switch opcja {
                case 1:
                    wyswietlWynik(liczba1 + liczba2)
                case 2:
                    wyswietlWynik(liczba1 - liczba2)
                case 3:
                    wyswietlWynik(liczba1 * liczba2)
                case 4:
                    dzialanie = false
                default:
                    print("Nieprawidłowa opcja")
            }
        }
    }
} else {
    print("Wystapil blad podczas wczytywania liczb zespolonych")
}


// --> Zadanie 8.5. <--
struct rzutOszczepem{
    var id: Int
    var proby: [Double]

    init?(id: Int, proby: [Double]) {
        guard proby.count == 3 else {
            print("Muszą być dokładnie 3 próby")
            return nil
        }
        
        self.id = id
        self.proby = proby
    }
}

func wczytajWynik() -> Double? {
    guard let input = readLine(), let wynik = Double(input), wynik >= 0 else {
        print("Nieprawidlowy wynik")
        return nil
    }
    return wynik
}

func wczytajZawodnika(numer: Int) -> rzutOszczepem? {
    print("\nZawodnik numer \(numer)")
    print("Podaj wynik 1 proby:")
    guard let proba1 = wczytajWynik() else { return nil }
    
    print("Podaj wynik 2 proby:")
    guard let proba2 = wczytajWynik() else { return nil }
    
    print("Podaj wynik 3 proby:")
    guard let proba3 = wczytajWynik() else { return nil }
    
    return rzutOszczepem(id: numer, proby: [proba1, proba2, proba3])
}

func obliczSrednia(_ zawodnik: rzutOszczepem) -> Double {
    return zawodnik.proby.reduce(0, +) / Double(zawodnik.proby.count)
}

var zawodnicy: [rzutOszczepem] = []

guard let zawodnik1 = wczytajZawodnika(numer: 1),
      let zawodnik2 = wczytajZawodnika(numer: 2),
      let zawodnik3 = wczytajZawodnika(numer: 3),
      let zawodnik4 = wczytajZawodnika(numer: 4) else {
    print("Blad podczas wczytywania danych")
    exit(1)
}

zawodnicy = [zawodnik1, zawodnik2, zawodnik3, zawodnik4]

print("\nWczytane dane:")
for zawodnik in zawodnicy {
    print("Zawodnik \(zawodnik.id): \(zawodnik.proby)")
}

var najlepszaSrednia = obliczSrednia(zawodnicy[0])
var najlepszyZawodnik = zawodnicy[0]

for zawodnik in zawodnicy {
    let srednia = obliczSrednia(zawodnik)
    if srednia > najlepszaSrednia {
        najlepszaSrednia = srednia
        najlepszyZawodnik = zawodnik
    }
}

print("\nZawodnik z najwyższą średnią:")
print("ID: \(najlepszyZawodnik.id)")
print("Próby: \(najlepszyZawodnik.proby)")
print("Średnia: \(najlepszaSrednia) m")

var najnizszaSrednia = obliczSrednia(zawodnicy[0])
var indexDoUsuniecia = 0
for i in 0..<zawodnicy.count {
    let srednia = obliczSrednia(zawodnicy[i])
    if srednia < najnizszaSrednia {
        najnizszaSrednia = srednia
        indexDoUsuniecia = i
    }
}
zawodnicy.remove(at: indexDoUsuniecia)

print("\nZawodnicy po usunięciu zawodnika z najniższą średnią:")
for zawodnik in zawodnicy {
    print("Zawodnik \(zawodnik.id):\n\(zawodnik.proby)\nśrednia: \(obliczSrednia(zawodnik)) m")
}


// LABORATORIUM 9 - DEFINIOWANIE KLAS
// --> Przykład 1 <--
class Samochod{
    var marka: String = ""
    var model: String = ""
    var rokProd: Int = 0
    var przebieg: Double = 0.0
    var cena: Double = 0.0

    init(){
        print("Tworzenie obiektu klasy Samochod (bez parametrow)")
    }

    init(marka: String, model: String, rokProd: Int, przebieg: Double, cena: Double){
        print("Tworzenie obiektu klasy Samochod (z parametrami)")
        self.marka = marka
        self.model = model
        self.rokProd = rokProd
        self.przebieg = przebieg
        self.cena = cena
    }

    func show(){
        print("Marka: \(marka)")
        print("Model: \(model)")
        print("Rok produkcji: \(rokProd)")
        print("Przebieg: \(przebieg)")
        print("Cena: \(cena)")
    }
}
var s = Samochod()
s.marka = "Audi"
s.model = "A6"
s.rokProd = 2015
s.przebieg = 98000
s.cena = 120000
s.show()

var s2 = Samochod(marka: "BMW", model: "X5", rokProd: 2018, przebieg: 50000, cena: 150000)
s2.show()


// --> Zadanie 9.1. <--
class Punkt{
    private var x: Double
    private var y: Double

    init(){
        print("Tworzenie obiektu klasy Punkt (bez parametrow)")
        self.x = 0.0
        self.y = 0.0
    }

    init(p: Double){
        print("Tworzenie obiektu klasy Punkt (z parametrem)")
        self.x = p
        self.y = p
    }

    init(x: Double, y: Double){
        print("Tworzenie obiektu klasy Punkt (z parametrami)")
        self.x = x
        self.y = y
    }

    func getX() -> Double {
        return x
    }
    
    func getY() -> Double {
        return y
    }
    
    func odleglosc(punkt: Punkt) -> Double {
        let dx = punkt.x - self.x
        let dy = punkt.y - self.y
        return sqrt(dx * dx + dy * dy)
    }

    func numerCwiartki() -> Int {
        if x > 0 && y > 0 {
            return 1
        } else if x < 0 && y > 0 {
            return 2
        } else if x < 0 && y < 0 {
            return 3
        } else if x > 0 && y < 0 {
            return 4
        } else {
            return 0
        }
    }

    func show(){
        print("Punkt: (\(x), \(y))")
        numerCwiartki() == 0 ? print("Punkt leży na osi układu współrzędnych") : print("Punkt leży w \(numerCwiartki()) ćwiartce układu współrzędnych")
    }

    static func > (lhs: Punkt, rhs: Punkt) -> Int {
        let cwiartka1 = lhs.numerCwiartki()
        let cwiartka2 = rhs.numerCwiartki()
        
        if cwiartka1 > cwiartka2 {
            return 2
        } else if cwiartka1 == cwiartka2 {
            return 1
        } else {
            return 0
        }
    }
}

func PunktWzgledemKwadratu(P: Punkt, k: Double) ->  Int {
    let absX = abs(P.getX())
    let absY = abs(P.getY())
    let absK = abs(k)
    
    if absX > absK || absY > absK {
        return -1
    } else if (absX == absK && absY <= absK) || (absY == absK && absX <= absK) {
        return 0
    } else {
        return 1
    }
}

var p1 = Punkt()
var p2 = Punkt(p: 5)
var p3 = Punkt(x: 3, y: 4)

let odleglosc = p3.odleglosc(punkt: p2)
print("Odległość: \(odleglosc)")

p3.show()
let cwiartka = p3 > p2
print("Wynik porównania: \(cwiartka)")

let wynik = PunktWzgledemKwadratu(P: p3, k: 5)
print("Położenie względem kwadratu: \(wynik)")


// --> Zadanie 9.2. <--
class Osoba{
    private var imie: String
    private var nazwisko: String
    private var rok_urodzenia: Int

    init(imie: String, nazwisko: String, rok_urodzenia: Int){
        print("Tworzenie obiektu klasy Punkt (z parametrem)")
        self.imie = imie
        self.nazwisko = nazwisko
        self.rok_urodzenia = rok_urodzenia
    }

    func getImie() -> String {
        return imie
    }

    func getNazwisko() -> String {
        return nazwisko
    }

    func getRokUrodzenia() -> Int {
        return rok_urodzenia
    }

    func info(){
        print("Imie: \(imie)")
        print("Nazwisko: \(nazwisko)")
        print("Rok urodzenia: \(rok_urodzenia)")
    }
}

class Ksiazka{
    private var autor: Osoba
    private var tytul: String
    private var rok_wydania: Int
    private var liczba_stron: Int

    init(autor: Osoba, tytul: String, rok_wydania: Int, liczba_stron: Int){
        print("Tworzenie obiektu klasy Ksiazka (z parametrami)")
        self.autor = autor
        self.tytul = tytul
        self.rok_wydania = rok_wydania
        self.liczba_stron = liczba_stron
    }

    func getRokWydania() -> Int {
        return rok_wydania

    }

    func info(){
        print("Autor: \(autor.getImie()) \(autor.getNazwisko())")
        print("Tytul: \(tytul)")
        print("Rok wydania: \(rok_wydania)")
        print("Liczba stron: \(liczba_stron)")
    }
}

var osoba1 = Osoba(imie: "Henryk", nazwisko: "Sienkiewicz", rok_urodzenia: 1990)
var osoba2 = Osoba(imie: "Anna", nazwisko: "Nowak", rok_urodzenia: 1985)
osoba1.info()
osoba2.info()

var ksiazka1 = Ksiazka(autor: osoba1, tytul: "W pustyni i w puszczy", rok_wydania: 2000, liczba_stron: 300)
var ksiazka2 = Ksiazka(autor: osoba2, tytul: "Krzyżacy", rok_wydania: 1995, liczba_stron: 400)

var ksiazki: [Ksiazka] = [
    ksiazka1,
    ksiazka2,
    Ksiazka(autor: osoba2, tytul: "Pan Tadeusz", rok_wydania: 1834, liczba_stron: 376),
    Ksiazka(autor: osoba2, tytul: "Nad Niemnem", rok_wydania: 1888, liczba_stron: 580),
    Ksiazka(autor: osoba2, tytul: "Lalka", rok_wydania: 1890, liczba_stron: 928)
]

print("\nInformacje o wszystkich książkach:")
for i in 0..<ksiazki.count {
    print("\nKsiążka \(i + 1):")
    ksiazki[i].info()
}

var posortowane_ksiazki = ksiazki.sorted { $0.getRokWydania() < $1.getRokWydania() }
print("\nInformacje o książkach (posortowane według roku wydania):")
for i in 0..<posortowane_ksiazki.count {
    print("\nKsiążka \(i + 1):")
    posortowane_ksiazki[i].info()
}


// LABORATORIUM 10 - DZIEDZICZENIE KLAS
// --> Przykład 1 <--
class Kwadrat{
    var a: Double = 0.0

    init(a: Double){
        self.a = a
    }

    func pole() -> Double {
        return a * a
    }
}

class Szescian : Kwadrat{
    override func pole() -> Double {
        return 6 * a * a
    }
    func objetosc() -> Double {
        return a * a * a
    }
}

var kw = Kwadrat(a: 2.5)
print(kw.pole())
var sz = Szescian(a: 5.0)
print(sz.pole())
print(sz.objetosc())


// --> Zadanie 10.1. <--
class Osoba{
    private var imie: String
    private var nazwisko: String
    private var rok_urodzenia: Int

    init(imie: String, nazwisko: String, rok_urodzenia: Int){
        print("Tworzenie obiektu klasy Osoba (z parametrami)")
        self.imie = imie
        self.nazwisko = nazwisko
        self.rok_urodzenia = rok_urodzenia
    }

    func info(){
        print("Imie: \(imie)")
        print("Nazwisko: \(nazwisko)")
        print("Rok urodzenia: \(rok_urodzenia)")
    }

}

class Pracownik : Osoba{
    private var rok_zatrudnienia: Int
    private var stanowisko: String
    private var stawka_za_godzine: Double
    private var liczba_zrealizowanych_godzin: Int
    private var nazwa_firmy: String

    init(imie: String, nazwisko: String, rok_urodzenia: Int, rok_zatrudnienia: Int, stanowisko: String, stawka_za_godzine: Double, liczba_zrealizowanych_godzin: Int, nazwa_firmy: String){
        print("Tworzenie obiektu klasy Pracownik (z parametrami)")
        self.rok_zatrudnienia = rok_zatrudnienia
        self.stanowisko = stanowisko
        self.stawka_za_godzine = stawka_za_godzine
        self.liczba_zrealizowanych_godzin = liczba_zrealizowanych_godzin
        self.nazwa_firmy = nazwa_firmy
        super.init(imie: imie, nazwisko: nazwisko, rok_urodzenia: rok_urodzenia)
    }

    func ileLatWPracy() -> Int {
        return 2025 - rok_zatrudnienia 
    }

    func zarobki() -> Double {
        return Double(liczba_zrealizowanych_godzin) * stawka_za_godzine
    }

    override func info(){
        super.info()
        print("Rok zatrudnienia: \(rok_zatrudnienia)")
        print("Stanowisko: \(stanowisko)")
        print("Stawka za godzinę: \(stawka_za_godzine)")
        print("Liczba zrealizowanych godzin: \(liczba_zrealizowanych_godzin)")
        print("Nazwa firmy: \(nazwa_firmy)")
        print("Pracownik pracuje w firmie \(nazwa_firmy) od \(rok_zatrudnienia) roku")
        print("Pracownik zarobił \(zarobki()) zł")
    }
}

var pracownik1 = Pracownik(imie: "Jan", nazwisko: "Kowalski", rok_urodzenia: 1990, rok_zatrudnienia: 2015, stanowisko: "programista", stawka_za_godzine: 50.0, liczba_zrealizowanych_godzin: 160, nazwa_firmy: "Asseco")
var pracownik2 = Pracownik(imie: "Anna", nazwisko: "Nowak", rok_urodzenia: 1985, rok_zatrudnienia: 2010, stanowisko: "księgowa", stawka_za_godzine: 35.0, liczba_zrealizowanych_godzin: 130, nazwa_firmy: "Comarch")

pracownik1.info()
print("Pracownik pracuje w firmie od \(pracownik1.ileLatWPracy()) lat")

pracownik2.info()
print("Pracownik pracuje w firmie od \(pracownik2.ileLatWPracy()) lat")


// --> Zadanie 10.2. <--
class Osoba{
    private var imie: String
    private var nazwisko: String
    private var rok_urodzenia: Int

    init(imie: String, nazwisko: String, rok_urodzenia: Int){
        print("Tworzenie obiektu klasy Osoba (z parametrami)")
        self.imie = imie
        self.nazwisko = nazwisko
        self.rok_urodzenia = rok_urodzenia
    }

    func info(){
        print("Imie: \(imie)")
        print("Nazwisko: \(nazwisko)")
        print("Rok urodzenia: \(rok_urodzenia)")
    }

}

enum Kierunek: String{
    case Informatyka, Elektrotechnika, Mechanika, Medycyna, Prawo
}

class Student : Osoba{
    private var numer_indeksu: Int
    private var kierunek_studiow: Kierunek
    private var rok_studiow: Int
    private var oceny: [Double]

    init(imie: String, nazwisko: String, rok_urodzenia: Int, numer_indeksu: Int, kierunek_studiow: Kierunek, rok_studiow: Int, oceny: [Double]){
        guard oceny.count == 5 else {
            fatalError("Student musi mieć dokładnie 5 ocen")
        }
        print("Tworzenie obiektu klasy Student (z parametrami)")
        self.numer_indeksu = numer_indeksu
        self.kierunek_studiow = kierunek_studiow
        self.rok_studiow = rok_studiow
        self.oceny = oceny
        super.init(imie: imie, nazwisko: nazwisko, rok_urodzenia: rok_urodzenia)
    }

    func srednia() -> Double {
        return oceny.reduce(0, +) / Double(oceny.count)
    }

    func getOceny() -> [Double] {
        return oceny
    }

    override func info(){
        super.info()
        print("Numer indeksu: \(numer_indeksu)")
        print("Kierunek studiów: \(kierunek_studiow)")
        print("Rok studiów: \(rok_studiow)")
        print("Oceny: \(oceny)")
        print("Średnia ocen: \(srednia())")
    }
}

func wczytajDaneStudenta() -> Student? {
    print("Podaj imie: ")
    let imie = readLine()!

    print("Podaj nazwisko: ")
    let nazwisko = readLine()!

    print("Podaj rok urodzenia: ")
    guard let input = readLine(), let rok_urodzenia = Int(input) else {
        print("Nieprawidłowy rok urodzenia")
        return nil
    }

    print("Podaj numer indeksu: ")
    guard let input = readLine(), let numer_indeksu = Int(input) else {
        print("Nieprawidłowy indeks")
        return nil
    }

    print("Podaj kierunek studiow (1.Informatyka, 2.Elektrotechnika, 3.Mechanika, 4.Medycyna, 5.Prawo):")
    guard let input = readLine(), let wybor_kierunku = Int(input), wybor_kierunku >= 1 && wybor_kierunku <= 4 else {
        print("Błąd: Niepoprawny wybór kierunku studiów.")
        return nil
    }
    let kierunek_studiow: Kierunek
    switch wybor_kierunku {
        case 1:
            kierunek_studiow = .Informatyka
        case 2:
            kierunek_studiow = .Elektrotechnika
        case 3:
            kierunek_studiow = .Mechanika
        case 4:
            kierunek_studiow = .Medycyna
        case 5:
            kierunek_studiow = .Prawo
        default:
            print("Błąd: Niepoprawny wybór kierunku studiów.")
            return nil
    }

    print("Podaj rok studiow: ")
    guard let input = readLine(), let rok_studiow = Int(input) else {
        print("Nieprawidłowy rok studiów")
        return nil
    }

    var oceny: [Double] = []
    print("OCENY")
    for i in 0..<5 {
        print("Podaj \(i + 1). ocene: ")
        if let ocena = readLine(), let ocenaDouble = Double(ocena), ocenaDouble >= 2.0 && ocenaDouble <= 5.0 {
            oceny.append(ocenaDouble)
        }
    }

    return Student(imie: imie, 
                  nazwisko: nazwisko, 
                  rok_urodzenia: rok_urodzenia, 
                  numer_indeksu: numer_indeksu, 
                  kierunek_studiow: kierunek_studiow, 
                  rok_studiow: rok_studiow, 
                  oceny: oceny)
}

var studenci: [Student] = []
print("podaj liczbe studentow: ")
if let input = readLine(), let n = Int(input), n > 0{
    for _ in 0..<n {
        if let student = wczytajDaneStudenta() {
            studenci.append(student)
        }
    }

    for student in studenci {
        student.info()
    }
} else {
    print("Nieprawidlowa liczba studentow")
    exit(1)
}


// --> Zadanie 10.3. <--
class StudentNaErasmusie : Student{
    private var nazwa_uczelni_za_granica: String
    private var data_rozpoczecia: Date
    private var data_zakonczenia: Date
    private var nazwy_kursow: [String]

    init(imie: String, nazwisko: String, rok_urodzenia: Int, numer_indeksu: Int, kierunek_studiow: Kierunek, rok_studiow: Int, oceny: [Double], nazwa_uczelni_za_granica: String, data_rozpoczecia: Date, data_zakonczenia: Date, nazwy_kursow: [String]){
        guard nazwy_kursow.count == 5 else {
            fatalError("Student musi miec dokladnie 5 kursow")
        }
        print("Tworzenie obiektu klasy StudentNaErasmusie (z parametrami)")
        self.nazwa_uczelni_za_granica = nazwa_uczelni_za_granica
        self.data_rozpoczecia = data_rozpoczecia
        self.data_zakonczenia = data_zakonczenia
        self.nazwy_kursow = nazwy_kursow
        super.init(imie: imie, nazwisko: nazwisko, rok_urodzenia: rok_urodzenia, numer_indeksu: numer_indeksu, kierunek_studiow: kierunek_studiow, rok_studiow: rok_studiow, oceny: oceny)
    }

    override func info(){
        super.info()
        print("Nazwa uczelni za granicą: \(nazwa_uczelni_za_granica)")
        print("Data rozpoczęcia: \(data_rozpoczecia)")
        print("Data zakończenia: \(data_zakonczenia)")
        print("Nazwy kursów: \(nazwy_kursow)")
        print("Czas spędzony na Erasmusie: \(czasSpedzonyNaErasmusie()) dni")
        print("Zaliczył semestr: \(zaliczylSemestr() == 1 ? "Tak" : "Nie")")
    }

    func czasSpedzonyNaErasmusie() -> Int{
		let czas = data_zakonczenia.timeIntervalSince(data_rozpoczecia)
		let dni = Int(czas / (60 * 60 * 24))
		return dni
	}

    func zaliczylSemestr() -> Int {
        let oceny = getOceny()
		let srednia = oceny.reduce(0, +) / Double(oceny.count)
            if srednia >= 3.0 {
                return 1
            } else {
                return 0
            }
	}
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

if let dataRozpoczecia = dateFormatter.date(from: "2024-10-01"), let dataZakonczenia = dateFormatter.date(from: "2025-01-22") {
    let studentErasmus1 = StudentNaErasmusie(imie: "Mateusz", nazwisko: "Kierepka", rok_urodzenia: 2003, numer_indeksu: 99573, kierunek_studiow: .Informatyka, rok_studiow: 3, oceny: [4, 5, 4.5, 5, 4], nazwa_uczelni_za_granica: "Oxfordzik", data_rozpoczecia: dataRozpoczecia, data_zakonczenia: dataZakonczenia, nazwy_kursow: ["RedHat", "Java Spring", "AI", "TCP/IP", "AI"])
    let studentErasmus2 = StudentNaErasmusie(imie: "Michal", nazwisko: "Kierepka", rok_urodzenia: 2005, numer_indeksu: 99574, kierunek_studiow: .Medycyna, rok_studiow: 2, oceny: [4.5, 4, 4, 5, 4.5], nazwa_uczelni_za_granica: "Uczelnia wyzszego upojenia", data_rozpoczecia: dataRozpoczecia, data_zakonczenia: dataZakonczenia, nazwy_kursow: ["Anatomia", "Dermatologia", "Ginekologia", "Chirurgia", "Urologia"])

    studentErasmus1.info()
    studentErasmus2.info()
} else {
    print("Błąd konwersji daty")
}


// LABORATORIUM 12 - DZIEDZICZENIE KLAS
// --> Zadanie 12. <--
class Wykonawca{
    private var imie: String
    private var nazwisko: String

    init(imie: String, nazwisko: String){
        self.imie = imie
        self.nazwisko = nazwisko
    }

    func getImie() -> String {
        return imie
    }

    func getNazwisko() -> String {
        return nazwisko
    }

    func info(){
        print("Imie: \(imie)")
        print("Nazwisko: \(nazwisko)")
    }
}

class Utwor{
    private var tytul: String
    private var czas_trwania: Double

    init(tytul: String, czas_trwania: Double){
        self.tytul = tytul
        self.czas_trwania = czas_trwania
    }

    func getTytul() -> String {
        return tytul
    }

    func getCzasTrwania() -> Double {
        return czas_trwania
    }

    func info(){
        print("Tytul: \(tytul)")
        print("Czas trwania: \(czas_trwania) minut")
    }
}

class Album : Wykonawca{
    private var rok_wydania: Int
    private var utwory: [Utwor]

    init(imie: String, nazwisko: String, rok_wydania: Int, utwory: [Utwor]){
        self.rok_wydania = rok_wydania
        self.utwory = utwory
        super.init(imie: imie, nazwisko: nazwisko)
    }

    func getRokWydania() -> Int {
        return rok_wydania
    }

    func getUtwory() -> [Utwor] {
        return utwory
    }

    override func info(){
        super.info()
        print("Rok wydania: \(rok_wydania)")
        print("\nUtwory:")
        for utwor in utwory {
            utwor.info()
        }
    }

    func dodajUtwor(utwor: Utwor){
        utwory.append(utwor)
    }
}

func sredniCzas(album: Album, sredni: inout Double) {
	let utwory = album.getUtwory()
	let sumaCzasow = utwory.reduce(0.0) { $0 + $1.getCzasTrwania() }
	sredni = utwory.isEmpty ? 0.0 : sumaCzasow / Double(utwory.count)
}

func czasy(album: Album, najkrotszy: inout Double, najdluzszy: inout Double) {
	let utwory = album.getUtwory()
	guard let utworNajkrotszy = utwory.min(by: { $0.getCzasTrwania() < $1.getCzasTrwania() }),
		  let utworNajdluzszy = utwory.max(by: { $0.getCzasTrwania() < $1.getCzasTrwania() }) else {
		najkrotszy = 0.0
		najdluzszy = 0.0
		return
	}
	najkrotszy = utworNajkrotszy.getCzasTrwania()
	najdluzszy = utworNajdluzszy.getCzasTrwania()
}

let utwor1 = Utwor(tytul: "Trojkaty", czas_trwania: 3.5)
let utwor2 = Utwor(tytul: "Nie ma fal", czas_trwania: 4.2)
let utwor3 = Utwor(tytul: "Malomiasteczkowy", czas_trwania: 5.0)
let utwor4 = Utwor(tytul: "Wszystko w porzadku", czas_trwania: 3.9)
let utwor5 = Utwor(tytul: "Rzeka", czas_trwania: 4.1)
let utwor6 = Utwor(tytul: "Skrzydlate ręce", czas_trwania: 5.3)
let utwor7 = Utwor(tytul: "Pięć minut", czas_trwania: 4.4)
let utwor8 = Utwor(tytul: "Na zawsze", czas_trwania: 4.8)

let album = Album(imie: "Dawid", nazwisko: "Podsiadlo", rok_wydania: 2020, utwory: [])
album.dodajUtwor(utwor: utwor1)
album.dodajUtwor(utwor: utwor2)
album.dodajUtwor(utwor: utwor3)
album.dodajUtwor(utwor: utwor4)
album.dodajUtwor(utwor: utwor5)
album.dodajUtwor(utwor: utwor6)
album.dodajUtwor(utwor: utwor7)
album.dodajUtwor(utwor: utwor8)

album.info()

var sredni: Double = 0.0
sredniCzas(album: album, sredni: &sredni)
print("Średni czas trwania utworów na albumie: \(String(format: "%.2f", sredni)) minut")

var najkrotszy: Double = 0.0
var najdluzszy: Double = 0.0

czasy(album: album, najkrotszy: &najkrotszy, najdluzszy: &najdluzszy)
print("Czas najkrótszego utworu: \(String(format: "%.2f", najkrotszy)) minut")
print("Czas najdłuższego utworu: \(String(format: "%.2f", najdluzszy)) minut")


// 1. map
// Transformuje każdy element tablicy według podanej funkcji
let numbers = [1, 2, 3, 4, 5]
let squaredNumbers = numbers.map { $0 * $0 } // [1, 4, 9, 16, 25]

// 2. filter
// Zwraca elementy tablicy, które spełniają podany warunek
let numbers = [1, 2, 3, 4, 5]
let evenNumbers = numbers.filter { $0 % 2 == 0 } // [2, 4]

// 3. reduce
// Redukuje tablicę do pojedynczej wartosci, laczac elementy za pomoca operacji
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.reduce(0) { $0 + $1 } // 15

// 4. sorted
// Sortuje tablice w porzadku rosnacym lub wedlug podanego kryterium
let numbers = [5, 3, 1, 4, 2]
let sortedNumbers = numbers.sorted() // [1, 2, 3, 4, 5]
let descendingNumbers = numbers.sorted(by: >) // [5, 4, 3, 2, 1]

// 5. compactMap
// Zwraca nowa tablice, usuwajac nil i przeksztalcajac elementy
let values = ["1", "2", "three", "4", "five"]
let numbers = values.compactMap { Int($0 ?? "") } // [1, 2, 4]

// 6. forEach
// Wykonuje podany blok kodu dla kazdego elementu tablicy (nie zwraca nowej tablicy)
let numbers = [1, 2, 3, 4, 5]
numbers.forEach { print($0) } // 1 2 3 4 5

// 7. contains
// Sprawdza, czy tablica zawiera podany element
let fruits = ["apple", "banana", "orange"]
let hasBanana = fruits.contains("banana") // true

// 8. first(where:)
// Zwraca pierwszy element spelniajacy warunek
let numbers = [1, 2, 3, 4, 5]
let firstEvenNumber = numbers.first(where: { $0 % 2 == 0 }) // 2

// 9. dropFirst / dropLast
// Usuwa pierwsze / ostatnie elementy tablicy (bez modyfikacji oryginału)
let numbers = [1, 2, 3, 4, 5]
let droppedFirst = numbers.dropFirst(2) // [3, 4, 5]
let droppedLast = numbers.dropLast(2) // [1, 2, 3] 

// 10. prefix / suffix
// Zwraca pierwsze / ostatnie n elementow tablicy
let numbers = [1, 2, 3, 4, 5]
let firstThree = numbers.prefix(2) // [1, 2]
let lastThree = numbers.suffix(2) // [4, 5]

// 11. joined
// Łączy elementy tablicy w jeden ciąg znaków
let words = ["Hello", "world"]
let sentence = words.joined(separator: " ") // "Hello world"

// 12. flatMap
// Spłaszcza zagnieżdżone tablice do jednej tablicy
let nestedArray = [[1, 2], [3, 4], [5, 6]]
let flatArray = nestedArray.flatMap { $0 } // [1, 2, 3, 4, 5, 6]

// 13. reversed
// Zwraca odwrocona tablice
let numbers = [1, 2, 3, 4, 5]
let reversedNumbers = numbers.reversed() // [5, 4, 3, 2, 1]

// 14. count
// Zwraca liczbe elementow tablicy
let numbers = [1, 2, 3, 4, 5]
let count = numbers.count // 5

// 15. isEmpty
// Sprawdza, czy tablica jest pusta
let numbers: [Int] = []
let isEmpty = numbers.isEmpty // true
