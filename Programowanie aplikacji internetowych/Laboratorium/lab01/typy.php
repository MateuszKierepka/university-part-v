<!DOCTYPE html>

<html lang="">
<head>
    <meta charset="utf-8">
    <title>Pierwszy skrypt w PHP</title>
</head>
<body>

    <?php

    $int = 1234;
    $float = 567.789;
    $intTrue = 1;
    $intFalse = 0;
    $boolTrue = true;
    $stringZero = "0";
    $array = [1, 2, 3, 4];
    $emptyArray = [];
    $colorsArray = ["zielony", "czerwony", "niebieski"];
    $diffArray = ["Agata", "Agatowska", 4.67, true];
    $data = new DateTime();

    // podpunkt a)
    echo "<h2>Wartości zmiennych:</h2>";
    echo "<ul>";
    echo "<li>\$int : $int</li>";
    echo "<li>\$float : $float</li>";
    echo "<li>\$intTrue : $intTrue</li>";
    echo "<li>\$intFalse : $intFalse</li>";
    echo "<li>\$boolTrue : " . ($boolTrue ? 'true' : 'false') . "</li>";
    echo "<li>\$stringZero : '$stringZero'</li>";
    echo "<li>\$array : Tablica z " . count($array) . " elementami . </li>";
    $str = " ";
    foreach ($array as $value){
        $str .= $value . " ";
    }
    echo "<li>\$array : [" . $str . "]</li>";
    echo "<li>\$emptyArray : Pusta tablica z " . count($emptyArray) . " elementami</li>";
    $str = " ";
    foreach ($emptyArray as $value){
        $str .= $value . " ";
    }
    echo "<li>\$emptyArray : [" . $str . "]</li>";
    echo "<li>\$colorsArray : Tablica z " . count($colorsArray) . " elementami</li>";
    $str = " ";
    foreach ($colorsArray as $value){
        $str .= $value . " ";
    }
    echo "<li>\$emptyArray : [" . $str . "]</li>";
    echo "<li>\$diffArray : Tablica z " . count($diffArray) . " elementami</li>";
    $str = " ";
    foreach ($diffArray as $value){
        $str .= $value . " ";
    }
    echo "<li>\$emptyArray : [" . $str . "]</li>";
    echo "<li>\$data : " . $data->format('Y-m-d H:i:s') . "</li>";
    echo "</ul>";

    // podpunkt b)
    echo "<h2>Sprawdzenie typów zmiennych:</h2>";
    echo "<ul>";
    echo "<li>\$int - is_int() : " . (is_int($int) ? 'true' : 'false') . ", is_numeric(): " . (is_numeric($int) ? 'true' : 'false') . "</li>";
    echo "<li>\$float - is_int() : " . (is_int($float) ? 'true' : 'false') . ", is_numeric(): " . (is_numeric($float) ? 'true' : 'false') . "</li>";
    echo "<li>\$boolTrue - is_bool() : " . (is_bool($boolTrue) ? 'true' : 'false') . ", is_numeric(): " . (is_numeric($boolTrue) ? 'true' : 'false') . "</li>";
    echo "<li>\$stringZero - is_string() : " . (is_string($stringZero) ? 'true' : 'false') . ", is_numeric(): " . (is_numeric($stringZero) ? 'true' : 'false') . "</li>";
    echo "<li>\$array - is_array() : " . (is_array($array) ? 'true' : 'false') . ", is_object(): " . (is_object($array) ? 'true' : 'false') . "</li>";
    echo "<li>\$data - is_object() : " . (is_object($data) ? 'true' : 'false') . ", is_array(): " . (is_array($data) ? 'true' : 'false') . "</li>";
    echo "</ul>";

    // podpunkt c)
    echo "<h2>Porównanie zmiennych:</h2>";
    echo "<ul>";
    echo "<li>$intTrue == " . ($boolTrue ? 'true' : 'false') . " : " . ($intTrue == $boolTrue  ? 'true' : 'false') . "</li>";
    echo "<li>$intTrue === " . ($boolTrue ? 'true' : 'false') . " : " . ($intTrue === $boolTrue  ? 'true' : 'false') . "</li>";
    echo "<li>$intFalse == '$stringZero' : " . ($intFalse == $stringZero ? 'true' : 'false') . "</li>";
    echo "<li>$intFalse === '$stringZero' : " . ($intFalse === $stringZero ? 'true' : 'false') . "</li>";
    echo "</ul>";

    // podpunkt d)
    echo "<h2>Działanie funkcji var_dump() i print_r() dla tablic:</h2>";

    echo "<h3>var_dump() dla \$array:</h3>";
    echo "<pre>";
    var_dump($array);
    echo "</pre>";

    echo "<h3>print_r() dla \$array:</h3>";
    echo "<pre>";
    print_r($array);
    echo "</pre>";

    echo "<h3>var_dump() dla \$emptyArray:</h3>";
    echo "<pre>";
    var_dump($emptyArray);
    echo "</pre>";

    echo "<h3>print_r() dla \$emptyArray:</h3>";
    echo "<pre>";
    print_r($emptyArray);
    echo "</pre>";

    echo "<h3>var_dump() dla \$colorsArray:</h3>";
    echo "<pre>";
    var_dump($colorsArray);
    echo "</pre>";

    echo "<h3>print_r() dla \$colorsArray:</h3>";
    echo "<pre>";
    print_r($colorsArray);
    echo "</pre>";

    echo "<h3>var_dump() dla \$diffArray:</h3>";
    echo "<pre>";
    var_dump($diffArray);
    echo "</pre>";

    echo "<h3>print_r() dla \$diffArray:</h3>";
    echo "<pre>";
    print_r($diffArray);
    echo "</pre>";

    ?>

</body>
</html>