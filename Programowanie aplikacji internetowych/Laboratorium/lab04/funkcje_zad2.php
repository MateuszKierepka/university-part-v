<?php
function walidacja()
{
    $args = [
        'nazwisko' => [
            'filter' => FILTER_VALIDATE_REGEXP,
            'options' => ['regexp' => '/^[A-Z]{1}[a-ząęłńśćźżó-]{1,25}$/']
        ],
        'państwo' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
        'jezyki' => [
            'filter' => FILTER_SANITIZE_FULL_SPECIAL_CHARS,
            'flags' => FILTER_REQUIRE_ARRAY],
        'wiek' => [
            'filter' => FILTER_VALIDATE_INT,
            'options' => ['min_range' => 13, 'max_range' => 120]
        ],
        'e-mail' => FILTER_VALIDATE_EMAIL,
        'platnosc' => FILTER_SANITIZE_FULL_SPECIAL_CHARS
    ];

    $dane = filter_input_array(INPUT_POST, $args);

    var_dump($dane);

    $errors = "";
    foreach ($dane as $key => $val) {
        if ($val === false or $val === null) {
            $errors .= $key . " ";
        }
    }

    if ($errors === ""){
        dopliku("dane.txt", $dane);
    } else{
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
    if(file_exists($file)) {
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
    if(file_exists($file)) {
        $zawartosc = file($file);
        foreach ($zawartosc as $linia) {
            if (strpos($linia, $tut) !== false) {
                echo "<br>" . htmlspecialchars($linia);
            }
        }
    } else{
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}
function wyczysc(){
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
function pokaz_statystyki(){
    $file = "dane.txt";
    if (!file_exists($file)) {
        echo "<br><b>Plik z danymi nie istnieje.</b>";
        return;
    }

    $zawartosc = file($file);

    $liczba_wszystkich = 0;
    $liczba_ponizej_18 = 0;
    $liczba_powyzej_49 = 0;

    foreach ($zawartosc as $linia) {

        $linia = trim($linia);

        $dane = explode(" ", $linia);

        if (count($dane) >= 2) {
            foreach ($dane as $i => $wartosc) {
                if (is_numeric($wartosc)) {
                    $wiek = intval($wartosc);

                    $liczba_wszystkich++;

                    if ($wiek < 18) {
                        $liczba_ponizej_18++;
                    }
                    if ($wiek >= 50) {
                        $liczba_powyzej_49++;
                    }

                    break;
                }
            }
        }
    }

    echo "<p>Liczba wszystkich zamówień: " . $liczba_wszystkich . "</p>";
    echo "<p>Liczba zamówień od osób w wieku < 18 lat: " . $liczba_ponizej_18 . "</p>";
    echo "<p>Liczba zamówień od osób w wieku >=50 lat: " . $liczba_powyzej_49 . "</p>";
}