<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

    <h4>Łącza utworzone na podstawie danych użytkownika:</h4>
    <?php

    $nazw = $_POST['nazw']; $imie = $_POST['imie'];
    $telp = $_POST['telp']; $firma = $_POST['firma'];
    $tels = $_POST['tels']; $hobby = $_POST['hobby'];

    /* utworzenie łącza do form2_kon.php z równoczesnym
    * przekazaniem wartości zmiennych nazw, imie, telp
    * pobranych z formularza form2.html i dołączonych
    * jako parametry do adresu URL w hiperłączu */
    print("<p><a href='form2_kontakt.php?nazw=$nazw&imie=$imie&telp=$telp'>");
    print("Informacje kontaktowe</a>");

    print("<p><a href='form2_firma.php?firma=$firma&tels=$tels'>");
    print("Informacje służbowe</a>");

    print("<p><a href='form2_hobby.php?hobby=$hobby'>");
    print("Ulubione hobby</a>");

    ?>

</body>
</html>