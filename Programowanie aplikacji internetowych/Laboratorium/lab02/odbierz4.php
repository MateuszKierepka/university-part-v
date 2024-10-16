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

        if(isset($_REQUEST['C']) || isset($_REQUEST['CPP']) || isset($_REQUEST['Java']) || isset($_REQUEST['C#']) || isset($_REQUEST['HTML']) || isset($_REQUEST['CSS']) || isset($_REQUEST['XML']) || isset($_REQUEST['PHP']) || isset($_REQUEST['JavaScript'])) {

            echo "Wybrano tutoriale: ";

            if (isset($_REQUEST['C'])) {
                echo " " . htmlspecialchars($_REQUEST['C']) . " ";
            }

            if (isset($_REQUEST['CPP'])) {
                echo " " . htmlspecialchars($_REQUEST['CPP']) . " ";
            }

            if (isset($_REQUEST['Java'])) {
                echo " " . htmlspecialchars($_REQUEST['Java']);
            }

            if (isset($_REQUEST['C#'])) {
                echo " " . htmlspecialchars($_REQUEST['C#']) . " ";
            }

            if (isset($_REQUEST['HTML'])) {
                echo " " . htmlspecialchars($_REQUEST['HTML']) . " ";
            }

            if (isset($_REQUEST['CSS'])) {
                echo " " . htmlspecialchars($_REQUEST['CSS']) . " ";
            }

            if (isset($_REQUEST['XML'])) {
                echo " " . htmlspecialchars($_REQUEST['XML']) . " ";
            }

            if (isset($_REQUEST['PHP'])) {
                echo " " . htmlspecialchars($_REQUEST['PHP']) . " ";
            }

            if (isset($_REQUEST['JavaScript'])) {
                echo " " . htmlspecialchars($_REQUEST['JavaScript']) . " ";
            }

        } else{
            echo "Nie wybrano tutorialu.";
        }

        echo "</br>";

        if(isset($_REQUEST['platnosc'])) {
            echo "Sposób zapłaty: " . htmlspecialchars($_REQUEST['platnosc']) . "</br>";
        } else {
            echo "<p>Nie wybrano sposobu zapłaty.</p>";
        }

        $nazwisko = isset($_POST['nazwisko']) ? $_POST['nazwisko'] : '';
        $wiek = isset($_POST['wiek']) ? $_POST['wiek'] : '';
        $panstwo = isset($_POST['państwo']) ? $_POST['państwo'] : '';
        $email = isset($_POST['e-mail']) ? $_POST['e-mail'] : '';

        if (!empty($nazwisko) && !empty($wiek) && !empty($panstwo) && !empty($email)) {
            print("<p><a href='klient.php?nazwisko=$nazwisko&wiek=$wiek&panstwo=$panstwo&email=$email'>");
            print("<b>Dane klienta</b></a>");
        } else {
            print("<br>Brak wystarczających danych klienta do wyświetlenia.");
        }

        ?>

        <br><br>

        <a href="formularz.html">Powrót do formularza</a>
    </div>
</body>
</html>