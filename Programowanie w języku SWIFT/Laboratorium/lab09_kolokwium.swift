import Foundation


// Funkcje do zadania 1.
func pierwszaWartosc(p: Int, tab: [Int]) -> (Int, Int){
	guard !tab.isEmpty else{
		print("blad danych...")
		exit(1)
	}
	var wartosc = abs(tab[0] - p)
	var najblizsza_wartosc = tab[0]
	var index = 0
	for i in 1..<tab.count{
		if abs(tab[i] - p) < wartosc{
			wartosc = abs(tab[i] - p)
			najblizsza_wartosc = tab[i]
			index = i
		}
	}
	return (najblizsza_wartosc, index)
}

func sorted(tab: [Int]) -> [Int]{
	var sorted_tab: [Int] = []
	for i in 0..<tab.count{
		sorted_tab.append(tab[i])
	}
	sorted_tab.sort()
	return sorted_tab
}

func parzyste(tab: [Int]) -> Double{
	var parzyste: [Int] = []
	var suma = 0;
	for i in 0..<tab.count{
		if tab[i] % 2 == 0{
			parzyste.append(tab[i])
			suma += tab[i]
		}
	}
	if !parzyste.isEmpty{
		let sredniaArytmetyczna = Double(suma) / Double(parzyste.count)
		return sredniaArytmetyczna
	} else{
		print("brak elementow parzystych w tablicy.")
		return 0
	}
}

func czyPierwszy(id: Int, tab: [Int]) -> Bool{
	guard id <= tab.count-1 else{
		print("blad danych...")
		exit(1)
	}
	let liczba = tab[id]
	if liczba < 2{
		return false
	} else{
		var czyPierwsza = true
		for i in 2 ..< Int(sqrt(Double(liczba))) + 1{
			if liczba % i == 0{
				czyPierwsza = false
				break
			}
		}
		if czyPierwsza{
			return true
		} else{
			return false
		}
	}
}

func tablicaLiczbPierwszych(tab: [Int]) -> [Int]{
	var tab_pierwszych: [Int] = []
	for i in 0..<tab.count{
		if czyPierwszy(id: i, tab: tab){
			tab_pierwszych.append(tab[i])
		}
	}
	return tab_pierwszych
}

// Funkcje do zadania 2.
func wygenerujMacierz(rows: Int, cols: Int) -> [[Int]]{
	var matrix: [[Int]] = []
	for _ in 0..<rows{
		var row: [Int] = []
		for _ in 0..<cols{
			let rand = Int.random(in: 5800...6900)
			row.append(rand)
		}
		matrix.append(row)
	}
	return matrix;
}

func wyswietlMacierz(matrix: [[Int]]){
	for row in matrix{
		for col in row{
			print(col, terminator: " ")
		}
		print()
	}
}

// zrozumialem tak polecenie, ze w kazdym wierszu znajduje minimalna pensje, i z tych najmniejszych w kazdym wierszu znajduje najwieksza pensje, to jest pensja ktora zadowolilaby innych co maja mniejsza pensje
func minimalna(matrix: [[Int]]) -> Int{
	var minimalne: [Int] = []
	for i in 0..<matrix.count{
		var minimalna = matrix[i][0]
		for j in 1..<matrix[0].count{
			if matrix[i][j] < minimalna{
				minimalna = matrix[i][j]
			}
		}
		minimalne.append(minimalna)
	}
	var max = minimalne[0]
	for i in 1..<minimalne.count{
		if minimalne[i] > max{
			max = minimalne[i]
		}
	}
	return max
}

func sumaPensji(matrix: [[Int]]) -> Int{
	var suma = 0
	for i in 0..<matrix.count{
		for j in 0..<matrix[0].count{
			suma += matrix[i][j]
		}
	}
	return suma
}

func sredniaKazdegoOddzialu(matrix: [[Int]]) -> [Double]{
	var row: [Double] = []
	for i in 0..<matrix.count{
		var srednia: Double = 0
		for j in 0..<matrix[0].count{
			srednia += Double(matrix[i][j])
		}
		row.append(srednia / Double(matrix[0].count))
	}
	return row
}

// Zadanie 1.
print("podaj liczbe calkowita p:")
guard let input = readLine(), let p = Int(input) else{
	print("blad danych...")
	exit(1)
}

print("podaj liczbe calkowita n:")
guard let input = readLine(), let n = Int(input), n>3 else{
	print("blad danych...(n<3)")
	exit(1)
}

var tab: [Int] = []
for _ in 0..<n{
	let rand = Int.random(in: 20...200)
	tab.append(rand)
}

print(tab)

var pierwsza_wartosc = pierwszaWartosc(p: p, tab: tab)

print("najblizsza: \(pierwsza_wartosc.0), id: \(pierwsza_wartosc.1)")

print("posortowana tablica: \(sorted(tab: tab))")

print("wartosc arytmetyczna: \(parzyste(tab: tab))")

print("podaj id:")
if let input = readLine(), let id = Int(input){
	let czy_pierwsza = czyPierwszy(id: id, tab: tab)
	if czy_pierwsza{
		print("element jest liczba pierwsza")
	} else{
		print("element nie jest liczba pierwsza")
	}
}

print("tablica liczb pierwszych: \(tablicaLiczbPierwszych(tab: tab))")

// Zadanie 2.

print("podaj M:")
guard let input = readLine(), let M = Int(input), M > 0 else{
	print("blad danych...")
	exit(1)
}
print("podaj P:")
guard let input = readLine(), let P = Int(input), P > 0 else{
	print("blad danych...")
	exit(1)
}

print("wygenerowana macierz:")
var matrix = wygenerujMacierz(rows: M, cols: P)
wyswietlMacierz(matrix: matrix)

print("wartosc ktora zadowoli przynajmniej jednego pracownika w kazdym oddziale: \(minimalna(matrix: matrix))")
print("suma ktora firma przeznacza na pensje: \(sumaPensji(matrix: matrix))")
print("Srednia pensji w kazdym oddziale: \(sredniaKazdegoOddzialu(matrix: matrix))")
