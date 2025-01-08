import Foundation

class Wykonawca{
    private var imie: String
    private var nazwisko: String
    
    init(imie: String, nazwisko: String) {
        self.imie = imie
        self.nazwisko = nazwisko
    }
    
    func info(){
        print("Imie: \(imie)\nNazwisko:\(nazwisko)")
    }
}

class Utwor{
    private var tytul: String
    private(set) var czas_trwania: Double
    
    init(tytul: String, czas_trwania: Double) {
        self.tytul = tytul
        self.czas_trwania = czas_trwania
    }
    
    func info(){
        print("Tytul utworu: \(tytul)\nCzas trwania: \(czas_trwania)")
    }
}

class Album: Wykonawca{
    private var rok_wydania: Int
    private(set) var tablica_utworow: [Utwor]
    
    init(imie: String, nazwisko: String, rok_wydania: Int, tablica_utworow: [Utwor]) {
        self.rok_wydania = rok_wydania
        self.tablica_utworow = tablica_utworow
        super.init(imie: imie, nazwisko: nazwisko)
    }
    
    override func info() {
        super.info()
        print("Rok wydania albumu: \(rok_wydania)")
        print("Lista utworów:")
        for utwor in tablica_utworow {
            utwor.info()
        }
    }
    
    func dodajUtwor(_ utwor: Utwor) {
        tablica_utworow.append(utwor)
    }
}

func sredniCzas(album: Album) -> Double{
    let utwory = album.tablica_utworow
    let sumaCzasow = utwory.reduce(0.0) { $0 + $1.czas_trwania }
    return utwory.isEmpty ? 0.0 : sumaCzasow / Double(utwory.count)
}

func czasy(album: Album) -> (Double, Double){
    let utwory = album.tablica_utworow
    guard let najkrotszy = utwory.min(by: { $0.czas_trwania < $1.czas_trwania }),
          let najdluzszy = utwory.max(by: { $0.czas_trwania < $1.czas_trwania }) else {
        return (0.0, 0.0)
    }
    return (najkrotszy.czas_trwania, najdluzszy.czas_trwania)
}

let utwor1 = Utwor(tytul: "Trojkaty", czas_trwania: 3.5)
let utwor2 = Utwor(tytul: "Nie ma fal", czas_trwania: 4.2)
let utwor3 = Utwor(tytul: "Malomiasteczkowy", czas_trwania: 5.0)
let utwor4 = Utwor(tytul: "Wszystko w porzadku", czas_trwania: 3.9)
let utwor5 = Utwor(tytul: "Rzeka", czas_trwania: 4.1)
let utwor6 = Utwor(tytul: "Skrzydlate ręce", czas_trwania: 5.3)
let utwor7 = Utwor(tytul: "Pięć minut", czas_trwania: 4.4)
let utwor8 = Utwor(tytul: "Na zawsze", czas_trwania: 4.8)

let album = Album(imie: "Dawid", nazwisko: "Podsiadlo", rok_wydania: 2020, tablica_utworow: [utwor1, utwor2, utwor3])

album.dodajUtwor(utwor4)
album.dodajUtwor(utwor5)
album.dodajUtwor(utwor6)
album.dodajUtwor(utwor7)
album.dodajUtwor(utwor8)

let sredni = sredniCzas(album: album)
print("Średni czas trwania utworów na albumie: \(String(format: "%.2f", sredni)) minut")

let (najkrotszy, najdluzszy) = czasy(album: album)
print("Czas najkrótszego utworu: \(String(format: "%.2f", najkrotszy)) minut")
print("Czas najdłuższego utworu: \(String(format: "%.2f", najdluzszy)) minut")
