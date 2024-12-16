<?php
use klasy\Baza;

function drukuj_form() {
    $jezyki = ["PHP", "C/C++", "Java"];
    $zawartosc = '<div id="tresc">
         <form action="?strona=formularz" method="POST">
         <table>
            <tr><td><label for="nazwisko">Nazwisko: </label><input type="text" id="nazwisko" name="nazwisko"></td></tr>
            <tr><td><label for="wiek">Wiek: </label><input id="wiek" type="number" name="wiek"></td></tr>
            <tr><td><label for="państwo">Państwo: </label>
            <select id="państwo" size="1" name="państwo">
                <option value="Polska">Polska</option>
                <option value="Stany Zjednoczone">Stany Zjednoczone</option>
                <option value="Wielka Brytania">Wielka Brytania</option>
            </select></td></tr>
            <tr><td><label for="email">Adres e-mail: (wymagane) </label><input id="email" type="email" name="email"></td></tr>

            <tr><td><h3>Zamawiam tutorial z języka:</h3>';
    foreach ($jezyki as $jezyk) {
        $zawartosc .= "<label><input type='checkbox' name='jezyki[]' value='$jezyk'>$jezyk </label>";
    }
    $zawartosc .= '</td></tr>
            <tr><td><h3>Sposób zapłaty:</h3>
            <label><input type="radio" name="platnosc" value="Master Card" checked> Master Card</label>
            <label><input type="radio" name="platnosc" value="visa"> visa</label>
            <label><input type="radio" name="platnosc" value="przelew_bankowy"> przelew bankowy</label>
            </td></tr>
            <tr><td>
            <input type="submit" value="Dodaj" name="submit">
            <input type="submit" value="Pokaż" name="submit">
            <input type="reset" value="Anuluj" name="reset">
            </td></tr>
         </table> 
         </form>
         </div>';
    return $zawartosc;
}

function walidacja($nazwisko, $wiek, $państwo, $email, $jezyki, $platnosc) {
    if (!empty($nazwisko) && $wiek > 0 && !empty($państwo) &&
        filter_var($email, FILTER_VALIDATE_EMAIL) && !empty($jezyki) && !empty($platnosc)) {
        return true;
    }
    return false;
}

function dodajdoBD($db) {
    $nazwisko = $db->getMySqli()->real_escape_string(filter_input(INPUT_POST, 'nazwisko'));
    $wiek = intval(filter_input(INPUT_POST, 'wiek'));
    $państwo = $db->getMySqli()->real_escape_string(filter_input(INPUT_POST, 'państwo'));
    $email = $db->getMySqli()->real_escape_string(filter_input(INPUT_POST, 'email'));
    $jezyki = filter_input(INPUT_POST, 'jezyki', FILTER_DEFAULT, FILTER_REQUIRE_ARRAY);
    $platnosc = $db->getMySqli()->real_escape_string(filter_input(INPUT_POST, 'platnosc'));

    if (!walidacja($nazwisko, $wiek, $państwo, $email, $jezyki, $platnosc)) {
        return "<p>Niepoprawne dane w formularzu!</p>";
    }

    $jezyki_serialized = $db->getMySqli()->real_escape_string(implode(', ', $jezyki));

    $sql = "INSERT INTO klienci (Nazwisko, Wiek, Panstwo, Email, Zamowienie, Platnosc)
            VALUES ('$nazwisko', $wiek, '$państwo', '$email', '$jezyki_serialized', '$platnosc')";

    if ($db->insert($sql)) {
        return "<p>Dane zostały dodane do bazy danych</p>";
    } else {
        return "<p>Błąd przy dodawaniu danych do bazy</p>";
    }
}

include_once "klasy/Baza.php";
$tytul = "Formularz zamowienia";
$zawartosc = drukuj_form();
$bd = new Baza("localhost", "root", "", "klienci");
if (filter_input(INPUT_POST, "submit")) {
    $akcja = filter_input(INPUT_POST, "submit");
    switch ($akcja) {
        case "Dodaj" :
            $zawartosc .= dodajdoBD($bd);
            break;
        case "Pokaż" :
            $zawartosc .= $bd->select(
                "SELECT Nazwisko, Wiek, Panstwo, Email, Zamowienie, Platnosc FROM klienci",
                ["Nazwisko", "Wiek", "Panstwo", "Email", "Zamowienie", "Platnosc"]
            );
            break;
    }
}
