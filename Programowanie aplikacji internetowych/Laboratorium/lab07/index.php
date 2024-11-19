<?php
include_once('klasy/User.php');
include_once('klasy/RegistrationForm.php');
include_once('klasy/Baza.php');

$db = new klasy\Baza('localhost', 'root', '', 'klienci');

$rf = new RegistrationForm();
if (filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)) {
    $user = $rf->checkUser($db);
    if ($user === NULL) {
        echo "<p>Niepoprawne dane rejestracji.</p>";
    } else {
        echo "<p>Poprawne dane rejestracji:</p>";
        $user->show();
        if ($user->saveDB($db)) {
            echo "<p>Użytkownik został zapisany do bazy danych.</p>";
        } else {
            echo "<p>Błąd podczas zapisu do bazy danych.</p>";
        }
    }
}

echo "<h3>Lista użytkowników:</h3>";
echo User::getAllUsersFromDB($db);