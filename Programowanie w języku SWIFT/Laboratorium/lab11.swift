import Foundation

enum Ozdoba: String{
    case bombka = "O"
    case cukierek = "|"
    case pierniczek = "o"
    case zabawka = "T"
}

enum RodzajDrzewa: String{
    case lisciaste = "Lisciaste"
    case iglaste = "Iglaste"
}

class Drzewo{
    private var wysokosc: Double
    private var type_of_tree: String
    private var rok_zasadzenia: Int

    init(wysokosc: Double, type_of_tree: RodzajDrzewa, rok_zasadzenia: Int) {
        self.wysokosc = wysokosc
        self.type_of_tree = type_of_tree.rawValue
        self.rok_zasadzenia = rok_zasadzenia
    }

    func show(){
        print("Wysokosc drzewa: \(wysokosc)m\nTyp drzewa: \(type_of_tree)\nRok zasadzenia: \(rok_zasadzenia)")
    }
}

class Choinka: Drzewo {
    private var liczba_poziomow: Int
    private var wysokosc_pnia: Double
    private var liczba_ozdob: Int
    private var rodzaje_ozdob: [Ozdoba]

    init(wysokosc: Double, type_of_tree: RodzajDrzewa, rok_zasadzenia: Int,
         liczba_poziomow: Int, wysokosc_pnia: Double, liczba_ozdob: Int, rodzaje_ozdob: [Ozdoba]) {
        self.liczba_poziomow = liczba_poziomow
        self.wysokosc_pnia = wysokosc_pnia
        self.liczba_ozdob = liczba_ozdob
        self.rodzaje_ozdob = rodzaje_ozdob
        super.init(wysokosc: wysokosc, type_of_tree: type_of_tree, rok_zasadzenia: rok_zasadzenia)
    }

    override func show() {
        super.show()
        print("Liczba poziomów: \(liczba_poziomow)\nWysokość pnia: \(wysokosc_pnia)m\nLiczba ozdób: \(liczba_ozdob)")
    }

    func getLiczbaPoziomow() -> Int{
        return liczba_poziomow
    }

    func rysujChoinke(layercount: Int, levelcount: Int){
        let length = layercount * levelcount
        var starcount = 1
        var spacecount = length
        for _ in 1...layercount{
            for _ in 1...levelcount{
                for _ in 1...spacecount{
                    print(" ", terminator: "")
                }
                for _ in 1...starcount{
                    print("*", terminator: "")
                }
                print()
                starcount += 2
                spacecount -= 1
            }
            starcount = starcount - 2
            spacecount = spacecount + 1
            if levelcount <= 3{
                starcount -= 2
                spacecount += 1
            } else{
                starcount -= 4
                spacecount += 2
            }
        }
        spacecount = length
        for _ in 1...spacecount-1{
            print(" ", terminator: "")
        }
        for _ in 1...3{
            print("#", terminator: "")
        }
    }

    func rysujOzdobionaChoinke() {
    let layercount = liczba_poziomow
    let levelcount = 3
    let length = layercount * levelcount
    var starcount = 1
    var spacecount = length
    var ozdobyRozmieszczone = 0

    for _ in 1...layercount {
        for _ in 1...levelcount {
            for _ in 1...spacecount {
                print(" ", terminator: "")
            }
            for starIndex in 1...starcount {
                if ozdobyRozmieszczone < liczba_ozdob, 
                   Bool.random(), 
                   !rodzaje_ozdob.isEmpty,
                   starIndex % 2 == 0 {
                    let ozdoba = rodzaje_ozdob.randomElement()!.rawValue
                    print(ozdoba, terminator: "")
                    ozdobyRozmieszczone += 1
                } else {
                    print("*", terminator: "")
                }
            }
            print()
            starcount += 2
            spacecount -= 1
        }
        starcount -= 2
        spacecount += 1
        if levelcount <= 3 {
            starcount -= 2
            spacecount += 1
        } else {
            starcount -= 4
            spacecount += 2
        }
    }

    spacecount = length
    for _ in 1...spacecount - 1 {
        print(" ", terminator: "")
    }
    for _ in 1...3 {
        print("#", terminator: "")
    }
    print()
    }
    func ozdobyDoKupienia() -> Int {
        let layercount = liczba_poziomow
        let levelcount = 3
        let length = layercount * levelcount
        var starcount = 1
        var spacecount = length
        var potentialSpots = 0

        for layer in 1...layercount {
            for _ in 1...levelcount {
                for _ in 1...spacecount {
                    
                }
                for _ in 1...starcount {
                    potentialSpots += 1
                }
                starcount += 2
                spacecount -= 1
            }
            starcount -= 2
            spacecount += 1
            if levelcount <= 3 {
                starcount -= 2
                spacecount += 1
            } else {
                starcount -= 4
                spacecount += 2
            }
        }
        let requiredOzdoby = max(0, potentialSpots - liczba_ozdob)
        return requiredOzdoby
    }
}

let choinka = Choinka(
    wysokosc: 2.5,
    type_of_tree: .iglaste,
    rok_zasadzenia: 2020,
    liczba_poziomow: 4,
    wysokosc_pnia: 0.5,
    liczba_ozdob: 10,
    rodzaje_ozdob: [.bombka, .cukierek, .zabawka]
)

choinka.show()
print("\nRysowanie choinki:")
choinka.rysujChoinke(layercount: choinka.getLiczbaPoziomow(),levelcount: 3)

print("\nRysowanie ozdobionej choinki:")
choinka.rysujOzdobionaChoinke()

print("\nLiczba ozdób do kupienia: \(choinka.ozdobyDoKupienia())")