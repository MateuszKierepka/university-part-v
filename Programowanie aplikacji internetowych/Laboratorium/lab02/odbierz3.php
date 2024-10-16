<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odebrane</title>
</head>
<body>

    <div>
        <h3>Dane odebrane z formularza</h3>

        <?php

        $jezyki = ["C", "CPP", "Java", "C#", "HTML", "CSS", "XML", "PHP", "JavaScript"];

        if(isset($_REQUEST['jezyki']) && is_array($_REQUEST['jezyki'])) {

            echo "<p>Wybrano tutoriale:</p>";
            echo "<ul>";

            foreach ($_REQUEST['jezyki'] as $jezyk) {
                echo "<li><b>" . htmlspecialchars($jezyk) . "</b></li>";
            }

            echo "</ul>";

            echo "<p>Wybrane tutoriale (jako string): </br>" . implode(", ", $_REQUEST['jezyki']) . "</p>"; // łączy elementy tablicy w jeden string, przyjmuje dwa argumenty: separator (string) i tablicę, zwraca string, w którym wszystkie elementy tablicy są połączone separatorem.
            // join ma taka sama funkcjonalnosc jak implode(), wprowadzona dla kompatybilnosci z innymi jezykami
        } else {
            echo "<p>Nie wybrano żadnego tutorialu.</p>";
        }

        if(isset($_REQUEST['platnosc'])) {
            echo "<p>Wybrany sposób płatności: <b>" . htmlspecialchars($_REQUEST['platnosc']) . "</b></p>";
        } else {
            echo "<p>Nie wybrano sposobu płatności.</p>";
        }

        echo "<h3>Zawartość \$_REQUEST:</h3>";
        echo "<pre>";
        var_dump($_REQUEST);
        echo "</pre>";


        echo "<h3>Wszystkie parametry \$_REQUEST:</h3>";
        foreach ($_REQUEST as $key => $value) {
            echo "<b>" . htmlspecialchars($key) . ":</b> ";
            if (is_array($value)) {
                foreach ($value as $item) {
                    echo "<br>- " . htmlspecialchars($item);
                }
            } else {
                echo htmlspecialchars($value);
            }
            echo "<br><br>";
        }

        ?>
        <a href="formularz.php">Powrót do formularza</a>
    </div>

</body>
</html>