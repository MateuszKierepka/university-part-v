<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

</head>
<body>

<form action="pliki.php" method="post">
    <h3>Zamawiam tutorial z języka:</h3>

    <?php
    $jezyki = ["C", "CPP", "Java", "C#", "HTML", "CSS", "XML", "PHP", "JavaScript"];
    foreach ($jezyki as $jezyk) {
        echo "<label><input type='checkbox' name='jezyki[]' value='$jezyk'>$jezyk </label>";
    }
    ?>

    <h3>Sposób zapłaty:</h3>
    <label><input type="radio" name="platnosc" value="eurocard" checked> eurocard</label>
    <label><input type="radio" name="platnosc" value="visa"> visa</label>
    <label><input type="radio" name="platnosc" value="przelew_bankowy"> przelew bankowy</label>

    <br><br>

    <input type="submit" value="Wyczyść" name="submit">
    <input type="reset" value="Zapisz" name="submit">
    <input type="submit" value="Pokaż" name="submit">
    <input type="submit" value="PHP" name="submit">
    <input type="submit" value="CPP" name="submit">
    <input type="submit" value="Java" name="submit">

</form>

    <?php
    function dodaj() {
        $dane = "";
        if (isset($_REQUEST["nazw"])) {
            $dane .= htmlspecialchars($_REQUEST['nazw'])." ";
        }
    //zbierz pozostałe dane z formularza – dodając je do łańcucha $dane
    //zapisz łańcuch z danymi do pliku dane.txt w postaci wiersza np.:
    }
    function pokaz() {
    //odczytaj wszystkie dane z pliku i wyświetl wierszami...
    }
    function pokaz_zamowienie($tut) {
    //odczytaj dane z pliku i wyświetl tylko te wiersze,
    //w których zamówiono tutorial $tut (np. $tut="Java")
    }
    //Skrypt właściwy do obsługi akcji (żądań):
    if (isset($_REQUEST["submit"])) { //jeśli kliknięto przycisk o name=submit
        $akcja = $_REQUEST["submit"]; //odczytaj jego value
        switch ($akcja) {
            case "Zapisz":dodaj();break;
            case "Pokaż":pokaz();break;
            case "Java":pokaz_zamowienie("Java");break;
            //pozostałe przypadki
        }
    }
    ?>

</body>
</html>
