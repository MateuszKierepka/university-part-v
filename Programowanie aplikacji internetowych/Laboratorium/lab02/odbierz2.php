<!--<!DOCTYPE html>-->
<!--<html lang="en">-->
<!--<head>-->
<!--    <meta charset="UTF-8">-->
<!--    <meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<!--    <title>Odebrane</title>-->
<!---->
<!--</head>-->
<!--<body>-->
<!--    <div>-->
<!--        <h2>Parametry odebrane z formularza</h2>-->
<!---->
<!--        <h3>Parametry z $_GET:</h3>-->
<!--            --><?php
//            if (!empty($_GET)) {
//                foreach ($_GET as $key => $value) {
//                    echo htmlspecialchars($key) . " = " . htmlspecialchars($value) . "<br />";
//                }
//            } else {
//                echo "Brak parametrów w tablicy \$_GET.<br />";
//            }
//            ?>
<!---->
<!--        <h3>Parametry z $_POST:</h3>-->
<!--            --><?php
//            if (!empty($_POST)) {
//                foreach ($_POST as $key => $value) {
//                    echo htmlspecialchars($key) . " = " . htmlspecialchars($value) . "<br />";
//                }
//            } else {
//                echo "Brak parametrów w tablicy \$_POST.<br />";
//            }
//            ?>
<!---->
<!--        <h3>Parametry z $_REQUEST:</h3>-->
<!--            --><?php
//            if (!empty($_REQUEST)) {
//                foreach ($_REQUEST as $key => $value) {
//                    echo htmlspecialchars($key) . " = " . htmlspecialchars($value) . "<br />";
//                }
//            } else {
//                echo "Brak parametrów w tablicy \$_REQUEST.<br />";
//            }
//            ?>
<!---->
<!--        <br />-->
<!--        <a href="formularz.html">Powrót do formularza</a>-->
<!--    </div>-->
<!--</body>-->
<!--</html>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Odebrane parametry - var_dump()</title>
</head>
<body>

<div>
    <h2>Parametry odebrane z formularza</h2>

    <h3>Zawartość tablicy $_GET:</h3>
    <?php
    if (!empty($_GET)) {
        echo "<pre>";
        var_dump($_GET);
        echo "</pre>";
    } else {
        echo "Brak danych w tablicy \$_GET.<br />";
    }
    ?>

    <h3>Zawartość tablicy $_POST:</h3>
    <?php
    if (!empty($_POST)) {
        echo "<pre>";
        var_dump($_POST);
        echo "</pre>";
    } else {
        echo "Brak danych w tablicy \$_POST.<br />";
    }
    ?>

    <h3>Zawartość tablicy $_REQUEST:</h3>
    <?php
    if (!empty($_REQUEST)) {
        echo "<pre>";
        var_dump($_REQUEST);
        echo "</pre>";
    } else {
        echo "Brak danych w tablicy \$_REQUEST.<br />";
    }
    ?>

    <br />
    <a href="formularz.html">Powrót do formularza</a>
</div>

</body>
</html>
