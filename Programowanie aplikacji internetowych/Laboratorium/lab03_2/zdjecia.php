<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Miniaturki</title>
    </head>
    <body>
        <?php
        // odkomentować w php.ini: extension=gd
        if (isset($_POST['zapisz']) && $_POST['zapisz'] == 'Zapisz'
        && !isset($_GET['pic'])) {
            if (is_uploaded_file($_FILES['zdjecie']['tmp_name'])) {
                $typ = $_FILES['zdjecie']['type'];
                if ($typ === 'image/jpeg'){

                    $zdjeciaFolder = './zdjecia/';
                    $miniaturyFolder = './miniatury/';

                    $link = $_FILES['zdjecie']['name'];
                    move_uploaded_file($_FILES['zdjecie']['tmp_name'], $zdjeciaFolder . $link);

                    $random = uniqid('img_'); // wygenerowanie losowej wartości
                    $zdj = $random . '.jpg';
                    copy($zdjeciaFolder . $link, $zdjeciaFolder . $zdj);

                    list($width, $height) = getimagesize($zdjeciaFolder . $zdj);

                    $wys = $_POST['wys'];
                    $szer = $_POST['szer'];

                    $skalaWys = 1;
                    $skalaSzer = 1;
                    $skala = 1;

                    if ($width > $szer) $skalaSzer = $szer / $width;
                    if ($height > $wys) $skalaWys = $wys / $height;
                    if ($skalaWys <= $skalaSzer) $skala = $skalaWys;
                    else $skala = $skalaSzer;

                    // ustalenie rozmiarów miniaturki tworzonego zdjęcia:
                    $newH = $height * $skala;
                    $newW = $width * $skala;

                    header('Content-type: image/jpeg');
                    $nowe = imagecreatetruecolor($newW, $newH); // czarny obraz
                    $obraz = imagecreatefromjpeg($zdjeciaFolder . $zdj);
                    imagecopyresampled($nowe, $obraz, 0, 0, 0, 0, $newW, $newH, $width, $height);

                    imagejpeg($nowe, $miniaturyFolder . './mini-' . $link, 100);
                    echo "nowe=" . $miniaturyFolder . "mini-$link <br/>";
                    imagedestroy($nowe);
                    imagedestroy($obraz);
                    unlink($zdjeciaFolder . $zdj);

                    $dlugosc = strlen($link);
                    $dlugosc -= 4;
                    $link = substr($link, 0,$dlugosc);
                    echo "link=$link <br/>";
                    header('location:zdjecia.php?pic=' . $link);
                }
                else {
                    header('location:zdjecia.html');
                }
            }
        }
        if (isset($_GET['pic']) && !empty($_GET['pic'])){
            echo '<a href="./zdjecia/' . $_GET['pic'] . '.jpg">Zdjęcie</a><br/>';
            echo '<a href="./miniatury/mini-' . $_GET['pic'] . '.jpg">Miniatura</a><br/><br/>';
            echo '<a href="zdjecia.html">Powrót</a>';
        }
        ?>
    </body>
</html>