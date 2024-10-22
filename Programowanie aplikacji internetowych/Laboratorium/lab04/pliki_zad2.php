<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

    <link rel="stylesheet" href="formularz.css" type="text/css">

</head>
<body>

<h2>
    Formularz zamówienia
</h2>

<form action="pliki_zad2.php" method="post">

    <label for="nazwisko">Nazwisko: </label><input type="text" id="nazwisko" name="nazwisko"><br>
    <label for="wiek">Wiek: </label><input id="wiek" type="number" name="wiek"><br>
    <label for="państwo">Państwo: </label>
    <select id="państwo" size="1" name="państwo">
        <option value="Polska">Polska</option>
        <option value="Stany Zjednoczone">Stany Zjednoczone</option>
        <option value="Wielka Brytania">Wielka Brytania</option>
    </select><br>
    <label for="email">Adres e-mail: </label><input id="email" type="email" name="e-mail"><br>

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
    <input type="submit" value="Zapisz" name="submit">
    <input type="submit" value="Pokaż" name="submit">
    <input type="submit" value="PHP" name="submit">
    <input type="submit" value="CPP" name="submit">
    <input type="submit" value="Java" name="submit">
    <input type="submit" value="Statystyki" name="submit">

</form>

<?php
include_once "funkcje_zad2.php";
if (filter_input(INPUT_POST, "submit")) {
    $akcja = filter_input(INPUT_POST, "submit");
    switch ($akcja) {
        case "Wyczyść":
            wyczysc();
            break;
        case "Zapisz":
            dodaj();
            break;
        case "Pokaż":
            pokaz();
            break;
        case "PHP":
            pokaz_zamowienie("PHP");
            break;
        case "CPP":
            pokaz_zamowienie("CPP");
            break;
        case "Java":
            pokaz_zamowienie("Java");
            break;
        case "Statystyki":
            pokaz_statystyki();
            break;
    }
}
?>

</body>
</html>