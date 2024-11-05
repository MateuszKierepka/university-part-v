import Foundation

// Zadanie 5.1.

var tab: [Int] = Array(repeating: 1, count: 12)
for i in tab {
print(i)
}

// Zadanie 5.2.

var tab2: [Int] = Array(repeating: 0, count: 10)

for i in 0..<tab2.count{
    tab2[i] = Int.random(in: 1...100)
}

print("Wygenerowana tablica: ", tab2)

print("podaj liczbe:")
if let number = Int(readLine() ?? "") {
    tab2[0] = number
}

print("Otrzymana tablica: ", tab2)


let rnd = Int.random(in: 1..<tab2.count)
print("podaj liczbe:")
if let number = Int(readLine() ?? "") {
    tab2[rnd] = number
}

print("Otrzymana tablica: ", tab2)

// Zadanie 5.3.

var tab3: [Int] = []
print("podaj liczbe elementow:")
if let number = Int(readLine() ?? ""), number > 0{
    for i in 1...number{
        print("podaj \(i). element tablicy:")
        if let element3 = Int(readLine() ?? ""){
            tab3.append(element3)
        }
    }
    print("Tablica: \(tab3)")
    print("podaj liczbe calkowita:")
    if let intVal = Int(readLine() ?? ""){
        if intVal == tab3.first{
            print("Liczba \(intVal) jest pierwszym elementem tablicy.")
        }
        if intVal == tab3.last{
            print("Liczba \(intVal) jest ostatnim elementem tablicy.")
        }
    }
}

// Zadanie 5.4.

let rnd = Int.random(in: 3...100)
var tab4: [Int] = Array(repeating: 0, count: rnd)
for i in 0..<tab4.count{
    let element4 = Int.random(in: 3...100)
    tab4[i] = element4
}
print("Wygenerowana tablica \(rnd) elementow: \(tab3)")

var suma = 0
for i in 0..<tab4.count{
    suma += tab4[i]
}
let sredniaArytmetyczna = Double(suma) / Double(tab4.count)
print("Srednia arytmetyczna: \(sredniaArytmetyczna)")

var parzyste: [Int] = []
suma = 0;
for i in 0..<tab4.count{
    if tab4[i] % 2 == 0{
        parzyste.append(tab4[i])
        suma += tab4[i]
    }
}
if !parzyste.isEmpty{
    var iloczyn: Double = 1
    for i in parzyste{
        iloczyn *= Double(i)
    }
    let n = Double(parzyste.count)
    let sredniaGeometryczna = pow(iloczyn, 1.0 / n)
    print("Srednia geometryczna: \(sredniaGeometryczna)")
} else{
    print("Brak elementow parzystych w tablicy.")
}

var sumaOdwrotnosci: Double = 0
for i in tab4{
    sumaOdwrotnosci += 1.0 / Double(i)
}
let n = Double(tab4.count)
let sredniaHarmoniczna = n / sumaOdwrotnosci
print("Srednia harmoniczna: \(sredniaHarmoniczna)")

// Zadanie 5.5.

print("podaj liczbe elementow:")
if let number = Int(readLine() ?? ""), number > 0{
    var tab5_1: [Int] = Array(repeating: 0, count: number)
    var tab5_2: [Int] = Array(repeating: 0, count: number)
    for i in 0..<tab5_1.count{
        let element5 = Int.random(in: 1...20)
        tab5_1[i] = element5
    }
    for i in 0..<tab5_2.count{
        let element5 = Int.random(in: 1...20)
        tab5_2[i] = element5
    }
    print("Tablica 1: \(tab5_1)")
    print("Tablica 2: \(tab5_2)")
    var identical = true
    var tempTab5_2 = tab5_2
    for i in tab5_1{
        if let index = tempTab5_2.firstIndex(of: i){
            tempTab5_2.remove(at: index)
        } else{
            identical = false
            break
        }
    }
    if identical && tempTab5_2.isEmpty{
        print("Obie tablice zawieraja identyczne elementy.")
    } else{
        print("Tablice zawieraja rozne elementy...")
    }
} else{
    print("podales liczbe ujemna...")
}

// Zadanie 5.6.

var tab6: [Int] = []
print("podaj liczbe elementow:")
if let number = Int(readLine() ?? ""), number > 0{
    for i in 1...number{
        print("podaj \(i). element tablicy:")
        if let element6 = Int(readLine() ?? ""){
            tab6.append(element6)
        }
    }
    var najdluzszy: [Int] = []
    var aktualny: [Int] = []
    for i in 0..<tab6.count{
        if aktualny.isEmpty || tab6[i] > aktualny.last!{
            aktualny.append(tab6[i])
        } else{
            if aktualny.count > najdluzszy.count{
                najdluzszy = aktualny
            }
            aktualny = [tab6[i]]
        }
    }
    if aktualny.count > najdluzszy.count{
        najdluzszy = aktualny
    }
    if najdluzszy.isEmpty || najdluzszy.count == 1{
        print("brak rosnacego podciagu")
    } else{
        print("najdluzszy podciag rosnacy: \(najdluzszy)")
    }
}else{
    print("podano niepoprawna liczbe elementow...")
}
