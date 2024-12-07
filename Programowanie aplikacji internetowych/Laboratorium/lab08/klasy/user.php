<?php
include_once('klasy/Baza.php');
class User {
    
const STATUS_USER = 1;
const STATUS_ADMIN = 2;
protected $userName;
protected $password;
protected $fullName;
protected $email;
protected $date;
protected $data;
protected $status;

//pozostale pola klasy:
//...
//metody klasy:

function __construct($userName, $password, $fullName, $email){
    $this->userName = $userName;
    $this->password = password_hash($password, PASSWORD_DEFAULT);
    $this->fullName = $fullName;
    $this->email = $email;
    $this->date = new DateTime();
    $this->status = self::STATUS_USER;
}
Public function show() {

    echo "Imie Nazwisko: ".$this->fullName." Email: ".$this->email." Nazwa: ".$this->userName." ";
    echo "<br>";
    echo "User: $this->status";
    echo "<br>";
    echo $this->date->format('Y-m-d');
    echo "<br>";
}

public function setUserName($userName)
{
    $this->userName=$userName;
}
public function getUserName()
{
    return $this->userName;
}
public function setFullName($fullName){
    $this->fullName=$fullName;
}
public function getFullName(){
    return $this->fullName;
}
public function setEmail($email){
    $this->email=$email;
}
public function getEmail(){
    return $this->email;
}
public function setData($data){
    $this->data=$data;
}
public function getData(){
    return $this->data;
}
public function setStatus($status){
    $this->status=$status;

}
public function getPassword(){
    return $this->password;
}
public function setPassword($password){
    $this->password = $password;
}
static function getAllUsers($plik){
    $tab = json_decode(file_get_contents($plik));
    //var_dump($tab);
    foreach($tab as $val){
        echo "<p>".$val->userName." ".$val->fullName." ".$val->date."</p>";
    }
}
   function toArray(){
    $arr=[
    "userName" => $this->userName,
    "fullName" => $this->fullName,
    "password" => $this->password,
    "email" => $this->email,
    "date" => $this->date->format('Y-m-d'),
    "status" => $this->status
    ];
    return $arr;
   }

   function save($plik){
    $tab = json_decode(file_get_contents($plik), true);
    array_push($tab, $this->toArray());
    file_put_contents($plik, json_encode($tab));
}
    function saveXML()
    {
         //wczytujemy plik XML:
 $xml = simplexml_load_file('users.xml');
 //dodajemy nowy element user (jako child)
 $xmlCopy=$xml->addChild("user");
 //do elementu dodajemy jego właściwości o określonej nazwie i treści

$xmlCopy->addChild("userName", $this->userName);
$xmlCopy->addChild("password", $this->password);
$xmlCopy->addChild("fullName", $this->fullName);
$xmlCopy->addChild("email", $this->email);
$xmlCopy->addChild("date", $this->date->format('Y-m-d'));
$xmlCopy->addChild("status", $this->status);

 $xml->asXML('users.xml'); 

    }
    static function getAllUsersFromXML(){
        $allUsers = simplexml_load_file('users.xml');
        echo "<ul>";
        foreach ($allUsers as $user):
            $userName = $user->userName;
            $fullName = $user->fullName;
            $email = $user->email;
            $date = $user->date;
            $status = $user->status;
            echo "<li>$userName, $fullName, $email, $date, $status</li>";
        endforeach;
        echo "</ul>";
    }

    function saveDB($db)
    {
        include_once('klasy/Baza.php');
        
        $data = $this->date->format('Y-m-d H:i:s');

        $db->insert("INSERT INTO users VALUES (NULL, '$this->userName', '$this->fullName', '$this->email', '$this->password', '$this->status', '$data')");
    }

    Public static function getAllUsersFromDB($db)
    {
        include_once('klasy/Baza.php');

        echo $db->select("SELECT userName, fullName, email, passwd, date, status FROM users", ["userName","fullName","email","passwd","date","status"]);
    }

}
