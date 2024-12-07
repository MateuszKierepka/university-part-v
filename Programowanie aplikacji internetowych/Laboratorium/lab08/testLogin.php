<?php
include_once 'klasy/Baza.php';
include_once 'klasy/User.php';
include_once 'klasy/UserManager.php';

$db = new Baza("localhost", "root", "", "klienci");
$um = new UserManager();

session_start();
$sessionId = session_id();
$userId = $um->getLoggedInUser($db, $sessionId);

if ($userId > 0) {
    $result = $db->select(
        "SELECT * FROM users WHERE id = '$userId'",
        ["id", "userName", "email"]
    );
    echo "<p><a href='processLogin.php?akcja=wyloguj'>Wyloguj</a></p>";
    echo "<b>Dane zalogowanego użytkownika:</b>";
    echo $result;
    
} else {
    
    header("location:processLogin.php");
}
?>
