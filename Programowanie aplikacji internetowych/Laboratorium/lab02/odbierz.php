<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odebrane</title>

</head>
<body>

<div>
    <h2>Dane odebrane z formularza</h2>
    <?php
    if (isset($_REQUEST['nazwisko'])&&($_REQUEST['nazwisko']!="")) { // isset() - sprawdza czy zmienna została zadeklarowana i czy jej wartość nie jest null
        $nazwisko = htmlspecialchars(trim($_REQUEST['nazwisko'])); // trim - usuwa białe znaki
        echo "Nazwisko: $nazwisko <br/>"; // htmlspecialchars - konwertuje specjalne znaki HTML na ich bezpieczne odpowiedniki (encje HTML)
    } else
        echo "Nie wpisano nazwiska <br/>";

    if (isset($_REQUEST['wiek'])&&($_REQUEST['wiek']!="")) {
        $wiek = htmlspecialchars(trim($_REQUEST['wiek']));
        echo "Wiek: $wiek <br/>";
    } else
        echo "Nie wpisano wieku <br/>";

    if (isset($_REQUEST['państwo'])&&($_REQUEST['państwo']!="")) {
        $kraj = htmlspecialchars(trim($_REQUEST['państwo']));
        echo "Kraj: $kraj <br/>";
    } else
        echo "Nie wpisano kraju <br/>";

    if (isset($_REQUEST['e-mail'])&&($_REQUEST['e-mail']!="")) {
        $email = htmlspecialchars(trim($_REQUEST['e-mail']));
        echo "Email: $email <br/>";
    } else
        echo "Nie wpisano email'a <br/>";

    echo "Wybrano tutoriale: ";

    if (isset($_REQUEST['PHP'])) {
        echo htmlspecialchars($_REQUEST['PHP']) . " ";
    }

    if (isset($_REQUEST['C/C++'])) {
        echo htmlspecialchars($_REQUEST['C/C++']) . " ";
    }

    if (isset($_REQUEST['Java'])) {
        echo htmlspecialchars($_REQUEST['Java']);
    }

    echo "</br>";

    if (isset($_REQUEST['platnosc']) && ($_REQUEST['platnosc'] != "")) {
        $platnosc = htmlspecialchars(trim($_REQUEST['platnosc']));
        echo "Sposób płatności: $platnosc <br/>";
    } else {
        echo "Nie wybrano sposobu płatności <br/>";
    }

    ?>
    <a href="formularz.html">Powrót do formularza</a>
</div>

</body>
</html>