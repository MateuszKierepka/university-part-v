<!DOCTYPE html>

<html lang="">
<head>
    <meta charset="utf-8">
    <title>Pierwszy skrypt w PHP</title>
</head>
<body>

    <?php

    //$nazwa = 'obraz1';
    //print("<img src='obrazki/$nazwa.jpg' alt='$nazwa'>");

    function galeria($rows, $cols){
        echo "<table>";
        for ($i = 0; $i < $rows; $i++) {
            echo "<tr>";
            for ($j = 0; $j < $cols; $j++) {
                $obraz = $i * $cols + $j + 1;
                echo "<td><img src='./obrazki/obraz$obraz.jpg' alt='obraz $obraz'></td>";
            }
            echo "</tr>";
        }
        echo "</table>";
    }

    echo "<h1>Galeria 3x3:</h1>";
    galeria(3, 3);

    echo "<h1>Galeria 4x2:</h1>";
    galeria(4, 2);

    echo "<h1>Galeria 2x4:</h1>";
    galeria(2, 4);

    ?>

</body>
</html>