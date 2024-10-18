<?php
function dodaj() {
$dane = "";
    if (isset($_REQUEST["nazwisko"]) && isset($_REQUEST["wiek"]) && isset($_POST["państwo"]) && isset($_POST["e-mail"])
    && isset($_POST["jezyki"]) && is_array($_POST["jezyki"]) && isset($_POST["platnosc"])){

        $dane .= htmlspecialchars($_REQUEST['nazwisko'])." ";
        $dane .= htmlspecialchars($_REQUEST['wiek'])." ";
        $dane .= htmlspecialchars($_POST['państwo']) . " ";
        $dane .= htmlspecialchars($_REQUEST['e-mail']) . " ";
        $dane .= implode(",", array_map('htmlspecialchars', $_POST["jezyki"])) . " ";
        $dane .= htmlspecialchars($_POST['platnosc']) . " ";
        $dane .= "\n";
    } else{
        echo "<br><b>Nie wypelniles wszystkich pol!</b>";
    }

    $file = fopen("dane.txt", "a");

    if($file){
        fwrite($file, $dane);
        fclose($file);
    }else{
        echo "Nie udalo sie otworzyc pliku do zapisu.";
    }
}
function pokaz() {
    $file = "dane.txt";
    if(file_exists($file)) {
        $zawartosc = file($file);
        foreach ($zawartosc as $linia) {
            echo "<br>" . htmlspecialchars($linia);
        }
    } else {
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}
function pokaz_zamowienie($tut) {
    $file = "dane.txt";
    if(file_exists($file)) {
        $zawartosc = file($file);
        foreach ($zawartosc as $linia) {
            if (strpos($linia, $tut) !== false) {
                echo "<br>" . htmlspecialchars($linia);
            }
        }
    } else{
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}
function wyczysc(){
    $plik = "dane.txt";
    if (file_exists($plik)) {
        $file = fopen($plik, "w");
        if ($file) {
            fclose($file);
        } else {
            echo "<br><b>Nie udało się otworzyć pliku do czyszczenia.</b>";
        }
    } else {
        echo "<br><b>Plik z danymi nie istnieje.</b>";
    }
}