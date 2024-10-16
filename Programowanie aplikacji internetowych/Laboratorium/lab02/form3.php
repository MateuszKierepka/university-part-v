<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
</head>
<body>
<!--    --><?php
//    //skrypt generuje formularz i jednoczesnie odbiera dane z niego wysłane
//    if (isset($_POST['tekst'])){ //przesłano żądanie z parametrem 'tekst'
//        $tekst=$_POST['tekst'];
//        print "Wpisano: $tekst <br/>";
//        print "<a href='form3.php'>Powrót do formularza</a>";
//    } else{ //nie przesłano danych z formularza - w żądaniu nie ma parametru o kluczu 'tekst' - wyswietl formularz
//        print "Podaj tekst :<form action='form3.php' method='post'>";
//        print "<input type='text' name='tekst' size='30' />";
//        print "<input type='submit' value='Wyślij' />";
//        print "</form>";
//    }
//    ?>

    <?php
    //skrypt generuje formularz i jednoczesnie odbiera dane z niego wysłane
    if (isset($_POST['tekst'])){ //przesłano żądanie z parametrem 'tekst'
        $tekst = htmlspecialchars($_POST['tekst']);
        print "Wpisano: $tekst <br/>";
        print "<a href='form3.php'>Powrót do formularza</a>";
    } else{ //nie przesłano danych z formularza - w żądaniu nie ma parametru o kluczu 'tekst' - wyswietl formularz
        print "Podaj tekst :<form action='form3.php' method='post'>";
        print "<input type='text' name='tekst' size='30' />";
        print "<input type='submit' value='Wyślij' />";
        print "</form>";
    }
    ?>
</body>
</html>