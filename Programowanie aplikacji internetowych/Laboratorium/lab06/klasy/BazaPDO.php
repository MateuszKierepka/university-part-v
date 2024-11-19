<?php

namespace klasy;

use PDO;
use PDOException;

class BazaPDO {
    private $dbh;

    public function __construct($serwer, $user, $pass, $baza) {
        try {
            $this->dbh = new PDO(
                "mysql:host=$serwer;dbname=$baza",
                $user,
                $pass,
                [
                    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
                ]
            );
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    function __destruct() {
        $this->dbh = null;
    }

    public function select($sql, $pola) {
        $tresc = "";
        try {
            $stmt = $this->dbh->query($sql);
            $ilepol = count($pola);

            $tresc .= "<table><tbody>";
            while ($row = $stmt->fetch(PDO::FETCH_OBJ)) {
                $tresc .= "<tr>";
                for ($i = 0; $i < $ilepol; $i++) {
                    $p = $pola[$i];
                    $tresc .= "<td>" . htmlspecialchars($row->$p) . "</td>";
                }
                $tresc .= "</tr>";
            }
            $tresc .= "</tbody></table>";

            return $tresc;
        } catch (PDOException $e) {
            return "Error: " . $e->getMessage();
        }
    }

    public function delete($sql) {
        try {
            $stmt = $this->dbh->prepare($sql);
            return $stmt->execute();
        } catch (PDOException $e) {
            return false;
        }
    }

    public function insert($sql) {
        try {
            $stmt = $this->dbh->prepare($sql);
            return $stmt->execute();
        } catch (PDOException $e) {
            return false;
        }
    }

    public function getMySqli() {
        return $this->dbh;
    }

    public function query($sql) {
        try {
            $stmt = $this->dbh->query($sql);
            return $stmt;
        } catch (PDOException $e) {
            return null;
        }
    }
}