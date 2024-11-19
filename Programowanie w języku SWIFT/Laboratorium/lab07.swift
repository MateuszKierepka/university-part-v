import Foundation

// Zadanie 6.1.

print("podaj liczbe wierszy")
guard let input = readLine(), let x = Int(input), x > 0 else {
    print("blad danych...")
    exit(1)
}
print("podaj liczbe kolumn")
guard let input = readLine(), let y = Int(input), y > 0 else {
    print("blad danych...")
    exit(1)
}

var mac: [[Double]] = []
for _ in 0..<x{
    var row: [Double] = []
    for _ in 0..<y{
        let rand = Double.random(in: -100...100)
        row.append(rand)
    }
    mac.append(row)
}

print("Wygenerowana macierz:")
for i in 0..<x{
    for j in 0..<y{
        print(mac[i][j], terminator: " ")
    }
    print()
}

var maxElement = mac[0][0]
var maxRow = 0
var maxCol = 0

for i in 0..<x {
    for j in 0..<y {
        if mac[i][j] > maxElement {
            maxElement = mac[i][j]
            maxRow = i
            maxCol = j
        }
    }
}

print("najwiekszy element w macierzy to: \(maxElement)")
print("pozycja najwiekszego elementu: wiersz: \(maxRow + 1), kolumna: \(maxCol + 1)")

var minElement = mac[0][0]
var minRow = 0
var minCol = 0

for i in 0..<x {
    for j in 0..<y {
        if mac[i][j] < minElement {
            minElement = mac[i][j]
            minRow = i
            minCol = j
        }
    }
}

print("najmniejszy element w macierzy to: \(minElement)")
print("pozycja najmniejszego elementu: wiersz: \(minRow + 1), kolumna: \(minCol + 1)")

print("podaj wartosc:")
guard let input = readLine(), let wartosc = Double(input) else{
    print("blad danych...")
    exit(1)
}
var liczba_elementow = 0
for i in 0..<x {
    for j in 0..<y {
        if mac[i][j] == wartosc{
            liczba_elementow += 1
        }
    }
}

print("\(wartosc) wystepuje \(liczba_elementow). razy w macierzy.")

// Zadanie 6.2.

print("podaj liczbe wierszy")
guard let input = readLine(), let x = Int(input), x > 0 else {
    print("blad danych...")
    exit(1)
}
print("podaj liczbe kolumn")
guard let input = readLine(), let y = Int(input), y > 0 else {
    print("blad danych...")
    exit(1)
}

var mac: [[Double]] = []
for _ in 0..<x{
    var row: [Double] = []
    for _ in 0..<y{
        print("podaj element:")
        guard let input = readLine(), let element = Double(input) else{
            print("blad danych...")
            exit(1)
        }
        row.append(element)
    }
    mac.append(row)
}

print("Wygenerowana macierz:")
for i in 0..<x{
    for j in 0..<y{
        print(mac[i][j], terminator: " ")
    }
    print()
}

// polecenie 1
func isSymmetric(matrix: [[Double]]) -> Bool {
    let rowCount = matrix.count
    let columnCount = matrix[0].count
    
    if rowCount != columnCount {
        return false
    }
    
    for i in 0..<rowCount {
        for j in 0..<columnCount {
            if matrix[i][j] != matrix[j][i] {
                return false
            }
        }
    }
    
    return true
}

if isSymmetric(matrix: mac){
    print("Macierz jest symetryczna.")
} else{
    print("Macierz nie jest symetryczna.")
}

// polecenie 2
func rowSums(matrix: [[Double]]) -> [Double] {
    var sums: [Double] = []
    
    for row in matrix {
        var sum: Double = 0
        
        for element in row {
            sum += element
        }

        sums.append(sum)
    }
    
    return sums
}

let wektor = rowSums(matrix: mac)
print("Wektor sum wierszy: \(wektor)")

// polecenie 3
func matrixNorm(matrix: [[Double]]) -> Double {
    var sumOfSquares: Double = 0
    
    for row in matrix {
        for element in row {
            sumOfSquares += element * element
        }
    }
    
    return sqrt(sumOfSquares)
}

let norm = matrixNorm(matrix: mac)
print("Norma macierzy: \(norm)")

// polecenie 4
func maxInColumns(matrix: [[Double]]) -> [Double] {
    var maxValues: [Double] = []
    
    let rowCount = matrix.count
    let columnCount = matrix[0].count
    
    for j in 0..<columnCount {
        var maxElement = matrix[0][j]
        
        for i in 1..<rowCount {
            if matrix[i][j] > maxElement {
                maxElement = matrix[i][j]
            }
        }
        
        maxValues.append(maxElement)
    }
    
    return maxValues
}

let maxVector = maxInColumns(matrix: mac)
print("Wektor maksymalnych elementow kolumn: \(maxVector)")

// polecenie 5
func isDiagonal(matrix: [[Double]]) -> Bool {
    let rowCount = matrix.count
    let columnCount = matrix[0].count
    
    if rowCount != columnCount {
        return false
    }
    
    for i in 0..<rowCount {
        for j in 0..<columnCount {
            if i != j && matrix[i][j] != 0 {
                return false
            }
        }
    }
    
    return true
}

if isDiagonal(matrix: mac) {
    print("Macierz jest diagonalna.")
} else {
    print("Macierz nie jest diagonalna.")
}

// polecenie 6
func hasDiagonalDominance(matrix: [[Double]]) -> Bool {
    let rowCount = matrix.count
    let columnCount = matrix[0].count
    
    if rowCount != columnCount {
        return false
    }
    
    for i in 0..<rowCount {
        var sumOfRow = 0.0
        
        for j in 0..<columnCount {
            if i != j {
                sumOfRow += abs(matrix[i][j])
            }
        }
        
        if abs(matrix[i][i]) <= sumOfRow {
            return false
        }
    }
    
    return true
}

if hasDiagonalDominance(matrix: mac) {
    print("Macierz ma dominującą główną przekątną.")
} else {
    print("Macierz nie ma dominującej głównej przekątnej.")
}