<?php
session_start();
include 'klasy/User.php';

echo '<h3><b>Id sesji:';
echo session_id();
echo '</b></h3>';

//foreach ($_SESSION as $key => $value) {
//    echo $key . ': ' . $value . '<br>';
//}

if (isset($_SESSION['user'])){
    $user = unserialize($_SESSION['user']);

    echo 'username: ' . $user->getUserName();
    echo '<br>fullname: ' . $user->getFullName();
    echo '<br>email: ' . $user->getEmail();
    echo '<br>status: ' . $user->getStatus();

} else{
    echo 'brak obiektu w sesji...';
}

echo '<h4><b>Ciasteczka:<br>';
foreach ($_COOKIE as $key => $value) {
    echo $key . ': ' . $value . '<br>';
}
echo '</b></h4>';

//session_destroy();

echo '<a href="test1.php">Przejdź do strony 1</a>';

// Jeśli pożądane jest zabicie sesji, należy usunąć także ciasteczko sesyjne