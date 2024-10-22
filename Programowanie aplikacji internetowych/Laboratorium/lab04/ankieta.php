<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ankieta</title>
    <link rel="stylesheet" href="formularz.css" type="text/css">
</head>
<body>
<h3>Wybierz technologie, które znasz:</h3>
<form method="post" action="ankieta.php">

    <?php
    $tech = ["C", "CPP", "Java", "C#", "Html", "CSS", "XML", "PHP", "JavaScript"];
    foreach ($tech as $t) {
        echo "<input type='checkbox' name='$t' id='$t'>";
        echo "<label for='$t'>$t</label><br>";
    }
    ?>

    <input type="submit" value="Wyślij">
</form>
</body>
</html>

<?php
    if (!(file_exists("ankieta.txt"))) {
        $plik = fopen("ankieta.txt", "w+");
        // uzupełnić
        fclose($plik, "r+");
    }
?>