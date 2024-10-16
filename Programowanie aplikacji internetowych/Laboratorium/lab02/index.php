<!DOCTYPE html>

<html lang="">
<head>
    <meta charset="utf-8">
    <title>Pierwszy skrypt w PHP</title>
</head>
<body>
    <?php

    echo "<h2>Pierwszy skrypt PHP</h2>";

    $n = 5678;
    $x = 10.123456789;

    //zadanie 1.2
    // a)
    //            echo "Domyślny format: n=" . $n . ", x=" . $x . "<br>Zaokrąglenie do liczby całkowitej x=" . round($x) . "<br>z trzema cyframi po kropce x= " . round($x, 3)

    // b)
    //            echo "Domyślny format: n=", $n, ", x=", $x, "<br>Zaokrąglenie do liczby całkowitej x=", round($x), "<br>z trzema cyframi po kropce x= ", round($x, 3);

    // c)
    //            echo 'Domyślny format: n=', $n, ', x=', $x, '<br>Zaokrąglenie do liczby całkowitej x=', round($x), '<br>z trzema cyframi po kropce x= ', round($x, 3);

    // d)
    //            printf("Domyślny format: n=%d, x=%f<br>Zaokrąglenie do liczby całkowitej x=%d,<br>z trzema cyframi po kropce x= %.3f", $n, $x, $x, $x);

    ?>
</body>
</html>