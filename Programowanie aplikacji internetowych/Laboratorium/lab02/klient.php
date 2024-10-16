<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dane klienta</title>
</head>
<body>

    <h2>Dane klienta</h2>

    <p>
        Nazwisko: <?php echo $_GET['nazwisko']; ?> <br>
        Wiek: <?php echo $_GET['wiek']; ?> <br>
        Kraj: <?php echo $_GET['panstwo']; ?> <br>
        Email: <?php echo $_GET['email']; ?>
    </p>

</body>
</html>