import Foundation

// 1) Napisz funkcje generujaca macierz
func wygenerujMacierz(rows: Int, cols: Int) -> [[Int]]{
    var matrix: [[Int]] = []
    for _ in 0..<rows{
        var row: [Int] = []
        for _ in 0..<cols{
            let rand = Int.random(in: 0...255)
            row.append(rand)
        }
        matrix.append(row)
    }
    return matrix;
}

// 2) Napisz funkcje wyswietlajaca macierz
func wyswietlMacierz(matrix: [[Int]]){
    for row in matrix{
        for col in row{
            print(col, terminator: " ")
        }
        print()
    }
}

// 3) Napisz funkcje generujaca macierz 3x3 na podstawie poprzedniej
func wygenerujMacierz01(matrix: [[Int]], row_id: Int, col_id: Int) -> [[Int]]{
    guard row_id+3 <= matrix.count, col_id+3 <= matrix[0].count else{
        fatalError("nie mozna utworzyc macierzy")
    }
    var temp_matrix: [[Int]] = []
    for i in row_id...row_id+2{
        var row: [Int] = []
        for j in col_id...col_id+2{
            row.append(matrix[i][j])
        }
        temp_matrix.append(row)
    }
    let wartosc_srodkowa = temp_matrix[1][1]
    var macierz: [[Int]] = []
    for i in 0...2{
        var row: [Int] = []
        for j in 0...2{
            if i==1 && j==1 {
                row.append(temp_matrix[i][j])
            } else{
                if(temp_matrix[i][j] > wartosc_srodkowa){
                    row.append(1)
                } else{
                    row.append(0)
                }
            }
        }
        macierz.append(row)
    }
    return macierz
}

// 4) Utworz ciag z macierzy utworzonej przez funkcje wygenerujMacierz01
func ciag01(matrix: [[Int]]) -> String{
    var ciag = ""
    ciag += String(matrix[1][0])
    ciag += String(matrix[2][0])
    ciag += String(matrix[2][1])
    ciag += String(matrix[2][2])
    ciag += String(matrix[1][2])
    ciag += String(matrix[0][2])
    ciag += String(matrix[0][1])
    ciag += String(matrix[0][0])
    return ciag
}

// 5) Oblicz i zwroc wartosc z ciagu binarnego
func obliczWartosc(ciag: String){
    var wartosc_dziesietna = 0
    for (index, char) in ciag.enumerated() {
        if let cyfra = char.wholeNumberValue, cyfra == 0 || cyfra == 1 {
            let potega = ciag.count - index - 1
            wartosc_dziesietna += cyfra * Int(pow(2.0, Double(potega)))
        } else {
            fatalError("Nieprawidłowy znak w ciągu binarnym")
        }
    }
    return wartosc_dziesietna
}

// 6) Obliczanie nowych wartosci macierzy

func obliczNowaWartoscMacierzy(matrix: [[Int]]) -> [[Int]]{
    var matrix1 = wygenerujMacierz(row_id: 3, col_id: 3)
    
}

print("poczatkowa macierz")
var matrix = wygenerujMacierz(rows: 4, cols: 4)
wyswietlMacierz(matrix: matrix)

print("wygenerowana macierz na podstawie poprzedniej:")
var macierz = wygenerujMacierz01(matrix: matrix, row_id: 1, col_id: 1)
wyswietlMacierz(matrix: macierz)

var ciag = ciag01(matrix: macierz)
print("ciag utworzony z macierzy: \(ciag)")

var wartosc_dziesietna = obliczWartosc(ciag)
print("wartosc z ciagu binarnego: \(wartosc_dziesietna)")

