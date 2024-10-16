import Foundation

var a, s : Int
s = 0

for _ in 1...5 {
    a = Int.random(in: 1..<100)
    s += a
    print("Wygenerowana liczba : ", a)
    print("Aktualna suma : ", s)
}

print("Suma elementow : ", s)


//zad.1
var var1, var2, var3, sum : Int

var1 = Int.random(in: 1..<100)
var2 = Int.random(in: 1..<100)
var3 = Int.random(in: 1..<100)

sum = var1 + var2 + var3

print("Wylosowane liczby : \(var1), \(var2), \(var3)")
print("Suma liczb wynosi : ", sum)
print("Suma arytmetyczna wynosi : ", sum/3)


//zad2
var rokUrodzenia : Int
let rokBiezacy = 2024

print("Podaj rok urodzenia : ")
rokUrodzenia = Int(readLine()!)!

let wiek = rokBiezacy - rokUrodzenia

print("Masz \(wiek) lat")


//zad3

let pi = 3.141592
var r : Double?
var p, o : Double

print("Podaj promien kola : ")

if let input = readLine(), let rad = Double(input){
r = rad

if(r! < 0){
print("Promien mniejszy od 0")
}
else{
p = pi * r! * r!
o = 2 * pi * r!

print("Promien : \(r!), pole : \(String(format: "%.2f", p)), obwod : \(String(format: "%.2f", o))")
}
}
else{
print("Podano niepoprawny format")
}