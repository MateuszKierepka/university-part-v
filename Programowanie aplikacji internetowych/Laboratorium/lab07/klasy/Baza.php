<?php

namespace klasy;

use mysqli;

class Baza{
    private $mysqli;

    public function __construct($serwer, $user, $pass, $baza){
        $this->mysqli = new mysqli($serwer, $user, $pass, $baza);

        // sprawdzenie polaczenia
        if ($this->mysqli->connect_errno) {
            printf("Connect failed: %s\n", $this->mysqli->connect_error);
            exit();
        }
        if ($this->mysqli->set_charset("utf8")) {
            // udalo sie zmienic kodowanie
        }
    }
    function __destruct(){
        $this->mysqli->close();
    }
    public function select($sql, $pola){
        // parametr $sql - lancuch zapytania select
        // parametr $pola - tablica z nazwami pol w bazie
        // wynik funkcji - kod HTML tabeli z rekordami (String)

        $tresc = "";
        if ($result = $this->mysqli->query($sql)) {
            $ilepol = count($pola);
            $ile = $result->num_rows;

            // petla po wyniku zapytania $results
            $tresc .= "<table><tbody>";
            while ($row = $result->fetch_object()) {
                $tresc .= "<tr>";
                for ($i = 0; $i < $ilepol; $i++) {
                    $p = $pola[$i];
                    $tresc .= "<td>" . $row->$p . "</td>";
                }
                $tresc .= "</tr>";
            }

            $tresc .= "</tbody></table>";
            $result->close(); // zwolnij pamiec
        }
        return $tresc;
    }
    public function delete($sql){
        if ($this->mysqli->query($sql)) {
            return true;
        }
        return false;
    }
    public function insert($sql){
        if ($this->mysqli->query($sql)) {
            return true;
        } else{
            return false;
        }
    }
    public function getMySqli(){
        return $this->mysqli;
    }
}
