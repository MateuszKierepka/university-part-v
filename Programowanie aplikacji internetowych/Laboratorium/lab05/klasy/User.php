<?php
class User{
    const STATUS_USER = 1;
    const STATUS_ADMIN = 2;

    protected $userName;
    protected $password;
    protected $fullName;
    protected $email;
    protected $date;
    protected $status;

    function __construct($userName, $password, $fullName, $email){
        $this->userName = $userName;
        $this->password = password_hash($password, PASSWORD_DEFAULT);
        $this->fullName = $fullName;
        $this->email = $email;
        $this->date = new DateTime();
        $this->status = self::STATUS_USER;
    }
    public function show(){
       echo $this->userName . " " . $this->fullName . " " . $this->email . " status: " . $this->status . " " . $this->date->format('Y-m-d');
    }
    static function getAllUsers($plik){
        $tab = json_decode(file_get_contents($plik));
        //var_dump($tab);
        foreach($tab as $val){
            echo "<p>".$val->userName." ".$val->fullName." ".$val->date."</p>";
        }
    }
    function toArray(){
        $arr = [
            "userName" => $this->userName,
            "password" => $this->password,
            "fullName" => $this->fullName,
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
    function saveXML(){
        $xml = simplexml_load_file("users.xml");
        $xmlCopy = $xml->addChild("user");
        $xmlCopy->addChild("userName", $this->userName);
        $xmlCopy->addChild("password", $this->password);
        $xmlCopy->addChild("fullName", $this->fullName);
        $xmlCopy->addChild("email", $this->email);
        $xmlCopy->addChild("date", $this->date->format('Y-m-d'));
        $xmlCopy->addChild("status", $this->status);
        $xml->asXML("users.xml");
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
    public function getUserName(){
        return $this->userName;
    }
    public function setUserName($userName){
        $this->userName = $userName;
    }
    public function getStatus(){
        return $this->status;
    }
    public function setStatus($status){
        $this->status = $status;
    }
    public function getDate(){
        return $this->date;
    }
    public function setDate($date){
        $this->date = $date;
    }
    public function getEmail(){
        return $this->email;
    }
    public function setEmail($email){
        $this->email = $email;
    }
    public function getFullName(){
        return $this->fullName;
    }
    public function setFullName($fullName){
        $this->fullName = $fullName;
    }
    public function getPassword(){
        return $this->password;
    }
    public function setPassword($password){
        $this->password = $password;
    }
}