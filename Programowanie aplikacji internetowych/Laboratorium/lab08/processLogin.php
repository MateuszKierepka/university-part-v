<?php
 include_once 'klasy/Baza.php';
 include_once 'klasy/user.php';
 include_once 'klasy/UserManager.php';

 $db = new Baza("localhost", "root", "", "klienci");
 $um = new UserManager();
 //parametr z GET – akcja = wyloguj
 if (filter_input(INPUT_GET, "akcja")=="wyloguj") {
    $um->logout($db);
 }
 //kliknięto przycisk submit z name = zaloguj
 if (filter_input(INPUT_POST, "zaloguj")) {
     $userId=$um->login($db); //sprawdź parametry logowania
     if ($userId > 0) {
         header("location:testLogin.php");
         echo "<p>Poprawne logowanie.<br />";
         echo "Zalogowany użytkownik o id=$userId <br />";
         echo "<a href='processLogin.php?akcja=wyloguj'>Wyloguj</a> </p>";
     } else {
         echo "<p>Błędna nazwa użytkownika lub hasło</p>";
         $um->loginForm();
     }
 } else {
     $um->loginForm();
 }
 ?>