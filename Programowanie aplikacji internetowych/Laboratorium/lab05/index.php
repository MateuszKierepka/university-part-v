<!-- zadanie 5.1. Definicja klasy User -->

<?php
//include 'klasy/User.php';
//$user1 = new User('kp', 'nielubietygryska', 'Kubus Puchatek', 'kubus@stumilowylas.pl');
//$user1->show();
//?>

<!-- zadanie 5.2 + zadanie 5.3 -->

<?php
//    include_once('klasy/User.php');
//    include_once('klasy/RegistrationForm.php');
//    $rf = new RegistrationForm();
//    if  (filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)) {
//        $user = $rf->checkUser();
//        if ($user === NULL) {
//            echo "<p>Niepoprawne dane rejestracji.</p>";
//        } else{
//            echo "<p>Poprawne dane rejestracji:</p>";
//            $user->show();
//            $user->save("users.json");
//        }
//    }
//    User::getAllUsers('users.json');
?>

<!-- zadanie 5.4 -->

<?php
include_once('klasy/User.php');
include_once('klasy/RegistrationForm.php');
$rf = new RegistrationForm();
if  (filter_input(INPUT_POST, 'submit', FILTER_SANITIZE_FULL_SPECIAL_CHARS)) {
    $user = $rf->checkUser();
    if ($user === NULL) {
        echo "<p>Niepoprawne dane rejestracji.</p>";
    } else{
        echo "<p>Poprawne dane rejestracji:</p>";
        $user->show();
        $user->saveXML();
    }
}
User::getAllUsersFromXML();
?>