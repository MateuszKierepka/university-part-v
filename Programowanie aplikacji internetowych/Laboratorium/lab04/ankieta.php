<?php

$tech = ["C", "CPP", "Java", "C#", "Html", "CSS", "XML", "PHP", "JavaScript"];

function wczytajWyniki($tech) {
    $wyniki = [];
    if (file_exists('ankieta.txt')) {
        $lines = file('ankieta.txt', FILE_IGNORE_NEW_LINES);
        foreach ($lines as $line) {
            $parts = explode(':', $line);
            if (count($parts) == 2) {
                $wyniki[$parts[0]] = intval($parts[1]);
            }
        }
    }
    foreach ($tech as $t) {
        if (!isset($wyniki[$t])) {
            $wyniki[$t] = 0;
        }
    }
    return $wyniki;
}

function zapiszWyniki($wyniki) {
    $content = '';
    foreach ($wyniki as $tech => $glosy) {
        $content .= "$tech:$glosy\n";
    }
    file_put_contents('ankieta.txt', $content);
}

function czyZaznaczonoCheckbox($tech) {
    foreach ($tech as $t) {
        if (isset($_POST[$t])) {
            return true;
        }
    }
    return false;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (czyZaznaczonoCheckbox($tech)) {
        $wyniki = wczytajWyniki($tech);

        foreach ($tech as $t) {
            if (isset($_POST[$t])) {
                $wyniki[$t]++;
            }
        }

        zapiszWyniki($wyniki);

        echo "<h2>Wyniki ankiety:</h2>";
        echo "<ul>";
        foreach ($wyniki as $technologia => $glosy) {
            echo "<li>$technologia - $glosy</li>";
        }
        echo "</ul>";
        echo "<p><a href='ankieta.php'>Powrót do ankiety</a></p>";
    } else {
        echo "<h2>Musisz zaznaczyć przynajmniej jedną technologię!</h2>";
        echo "<p><a href='ankieta.php'>Powrót do ankiety</a></p>";
    }
} else {
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <title>Ankieta</title>
        <meta charset="UTF-8">
    </head>
    <body>
    <h2>Wybierz technologie, które znasz:</h2>
    <form method="POST">
        <?php
        foreach ($tech as $t) {
            echo "<div>";
            echo "<input type='checkbox' name='$t' id='$t'>";
            echo "<label for='$t'>$t</label>";
            echo "</div>";
        }
        ?>
        <input type="submit" value="Wyślij">
    </form>
    </body>
    </html>
    <?php
}
?>