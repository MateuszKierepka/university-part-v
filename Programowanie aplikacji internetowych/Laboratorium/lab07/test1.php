<?php
session_start();
include 'klasy/User.php';

echo '<h3><b>Id sesji:';
echo session_id();
echo '</b></h3>';

//foreach ($_SESSION as $key => $value) {
//    echo $key . ': ' . $value . '<br>';
//}

$user = new User('kubus', 'Haslo1', 'Kubus Puchatek', 'kubus@stumilowylas.pl');
$_SESSION['user'] = $user;
$_SESSION['user'] = serialize($user);

echo '<h4><b>Ciasteczka:<br>';
foreach ($_COOKIE as $key => $value) {
    echo $key . ': ' . $value . '<br>';
}
echo '</b></h4>';

echo '<a href="test2.php">Przejdź do strony 2</a>';