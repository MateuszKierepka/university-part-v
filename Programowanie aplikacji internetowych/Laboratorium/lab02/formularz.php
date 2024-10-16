<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>

</head>
<body>

    <form action="odbierz3.php" method="post">
        <h3>Zamawiam tutorial z języka:</h3>

        <?php
        $jezyki = ["C", "CPP", "Java", "C#", "HTML", "CSS", "XML", "PHP", "JavaScript"];
        foreach ($jezyki as $jezyk) {
            echo "<label><input type='checkbox' name='jezyki[]' value='$jezyk'>$jezyk </label>";
        }
        ?>

        <h3>Sposób zapłaty:</h3>
        <label><input type="radio" name="platnosc" value="eurocard" checked> eurocard</label>
        <label><input type="radio" name="platnosc" value="visa"> visa</label>
        <label><input type="radio" name="platnosc" value="przelew_bankowy"> przelew bankowy</label>

        <br><br>
        <input type="submit" value="Wyślij">
        <input type="reset" value="Anuluj">

    </form>

</body>
</html>
