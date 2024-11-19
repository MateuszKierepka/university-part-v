<?php
function walidacja() {
    $args = [
        'nazwisko' => [
            'filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '/^[A-Z]{1}[a-ząęłńśćźżó-]{1,25}$/']
        ],
        'państwo' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
        'jezyki' => [
            'filter' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
            'flags' => FILTER_REQUIRE_ARRAY
        ],
        'wiek' => [
            'filter' => FILTER_VALIDATE_INT,
            'options' => ['min_range' => 13, 'max_range' => 120]
        ],
        'e-mail' => FILTER_VALIDATE_EMAIL,
        'platnosc' => FILTER_SANITIZE_FULL_SPECIAL_CHARS
    ];

    $dane = filter_input_array(INPUT_POST, $args);

    $errors = "";
    foreach ($dane as $key => $val) {
        if ($val === false or $val === null) {
            $errors .= $key . " ";
        }
    }

    if ($errors === "") {
        dopliku("dane.txt", $dane);
    } else {
        echo "<br/>Niepoprawne dane: " . $errors;
    }
}

function dodaj() {
    echo "<h3>Dodawanie do pliku:</h3>";
    walidacja();
}

function dopliku($nazwaPliku, $tablicaDanych) {
    $dane = "";
    foreach ($tablicaDanych as $key => $val) {
        if ($key == 'jezyki' && is_array($val)) {
            $dane .= implode(",", $val) . " ";
        } elseif ($key != 'jezyki') {
            $dane .= $val . " ";
        }
    }
    $dane .= PHP_EOL;
    file_put_contents($nazwaPliku, $dane, FILE_APPEND | LOCK_EX);
    echo "<p>Zapisano: <br /> $dane</p>";
}

function pokaz() {
    $file = "dane.txt";
    if (file_exists($file)) {
        $zawartosc = file($file);
        foreach ($zawartosc as $linia) {
            echo "<br>" . htmlspecialchars($linia);
        }
    } else {
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}

function pokaz_zamowienie($tut) {
    $file = "dane.txt";
    if (file_exists($file)) {
        $zawartosc = file($file);
        foreach ($zawartosc as $linia) {
            if (strpos($linia, $tut) !== false) {
                echo "<br>" . htmlspecialchars($linia);
            }
        }
    } else {
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}

function wyczysc() {
    $plik = "dane.txt";
    if (file_exists($plik)) {
        $file = fopen($plik, "w");
        if ($file) {
            fclose($file);
        } else {
            echo "<br><b>Nie udało się otworzyć pliku do czyszczenia.</b>";
        }
    } else {
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}

function pokaz_statystyki($bd) {
    try {
        $sql_total = "SELECT COUNT(*) as total FROM klienci";
        $sql_below_18 = "SELECT COUNT(*) as below_18 FROM klienci WHERE Wiek < 18";
        $sql_above_50 = "SELECT COUNT(*) as above_50 FROM klienci WHERE Wiek >= 50";

        $stmt_total = $bd->getMySqli()->query($sql_total);
        $stmt_below_18 = $bd->getMySqli()->query($sql_below_18);
        $stmt_above_50 = $bd->getMySqli()->query($sql_above_50);

        $total = $stmt_total->fetch(PDO::FETCH_ASSOC)['total'];
        $below_18 = $stmt_below_18->fetch(PDO::FETCH_ASSOC)['below_18'];
        $above_50 = $stmt_above_50->fetch(PDO::FETCH_ASSOC)['above_50'];

        echo "<p>Liczba wszystkich zamówień: " . $total . "</p>";
        echo "<p>Liczba zamówień od osób w wieku < 18 lat: " . $below_18 . "</p>";
        echo "<p>Liczba zamówień od osób w wieku >=50 lat: " . $above_50 . "</p>";
    } catch (PDOException $e) {
        echo "<p>Błąd podczas pobierania statystyk: " . $e->getMessage() . "</p>";
    }
}

function dodajdoBD($bd) {
    $args = [
        'nazwisko' => [
            'filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '/^[A-Z]{1}[a-ząęłńśćźżó-]{1,25}$/']
        ],
        'państwo' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
        'jezyki' => [
            'filter' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
            'flags' => FILTER_REQUIRE_ARRAY
        ],
        'wiek' => [
            'filter' => FILTER_VALIDATE_INT,
            'options' => ['min_range' => 13, 'max_range' => 120]
        ],
        'e-mail' => FILTER_VALIDATE_EMAIL,
        'platnosc' => FILTER_SANITIZE_FULL_SPECIAL_CHARS
    ];

    $dane = filter_input_array(INPUT_POST, $args);

    $errors = "";
    foreach ($dane as $key => $val) {
        if ($val === false or $val === null) {
            $errors .= $key . " ";
        }
    }

    if ($errors === "") {
        try {
            $nazwisko = $dane['nazwisko'];
            $wiek = $dane['wiek'];
            $panstwo = $dane['państwo'];
            $email = $dane['e-mail'];
            $zamowienie = implode(',', $dane['jezyki']);
            $platnosc = $dane['platnosc'];

            $sql = "INSERT INTO klienci (Nazwisko, Wiek, Panstwo, Email, Zamowienie, Platnosc) 
                   VALUES (:nazwisko, :wiek, :panstwo, :email, :zamowienie, :platnosc)";

            $stmt = $bd->getMySqli()->prepare($sql);

            // Bindowanie parametrów
            $stmt->bindParam(':nazwisko', $nazwisko, PDO::PARAM_STR);
            $stmt->bindParam(':wiek', $wiek, PDO::PARAM_INT);
            $stmt->bindParam(':panstwo', $panstwo, PDO::PARAM_STR);
            $stmt->bindParam(':email', $email, PDO::PARAM_STR);
            $stmt->bindParam(':zamowienie', $zamowienie, PDO::PARAM_STR);
            $stmt->bindParam(':platnosc', $platnosc, PDO::PARAM_STR);

            if ($stmt->execute()) {
                echo "<p>Pomyślnie dodano zamówienie do bazy.</p>";
            } else {
                echo "<p>Błąd podczas dodawania zamówienia do bazy.</p>";
            }
        } catch (PDOException $e) {
            echo "<p>Błąd bazy danych: " . $e->getMessage() . "</p>";
        }
    } else {
        echo "<br/>Niepoprawne dane: " . $errors;
    }
}

function pokaz_zamowienia($bd, $jezyk = null) {
    try {
        if ($jezyk) {
            $sql = "SELECT Nazwisko, Zamowienie FROM klienci WHERE Zamowienie REGEXP :jezyk";
            $stmt = $bd->getMySqli()->prepare($sql);
            $stmt->bindParam(':jezyk', $jezyk, PDO::PARAM_STR);
            $stmt->execute();
        } else {
            $sql = "SELECT Nazwisko, Zamowienie FROM klienci";
            $stmt = $bd->getMySqli()->query($sql);
        }

        echo "<table><tbody>";
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['Nazwisko']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Zamowienie']) . "</td>";
            echo "</tr>";
        }
        echo "</tbody></table>";
    } catch (PDOException $e) {
        echo "<p>Błąd podczas wyświetlania zamówień: " . $e->getMessage() . "</p>";
    }
}