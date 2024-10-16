<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

    <h4>Poniżej znajdują się dane odebrane z formularza:</h4>

    <?php
    $nazw = $_GET['nazw'];
    print("Nazwisko: $nazw ");
    print("<br />Imię: " . $_GET['imie']);
    print("<br />Adres e-mail:" . $_GET['email']);
    ?>

    <h4>Zamawiane produkty:</h4>

    <?php

    if (isset($_GET['php']))
        print("- PHP<br />");
    if (isset($_GET['cpp']))
        print("- C++<br />");
    if (isset($_GET['java']))
        print("- Java<br />");

    ?>

</body>
</html>