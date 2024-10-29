<?php

class RegistrationForm{
    protected $user;

    function __construct(){ ?>
        <h3>Formularz rejestracji</h3><p>
        <form action="index.php" method="post">
            Nazwa użytkownika: <br><input name="userName"><br>
            Imię i nazwisko: <br><input name="fullName"><br>
            Hasło: <br><input name="password" type="password"><br>
            Email: <br><input name="email">
            <input type="submit" value="Rejestruj" name="submit">
            <input type="reset" value="Anuluj">
        </form>
        <?php
    }
    function checkUser(){
        $args = [
            'userName' => [
                'filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[0-9A-Za-ząęłńśćźżó_-]{2,25}$/']
            ],
            'fullName' => [
                'filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ]+(\s+[A-Za-ząćęłńóśźżĄĆĘŁŃÓŚŹŻ]+)+$/']
            ],
            'password' => [
                'filter' => FILTER_VALIDATE_REGEXP,
                'options' => ['regexp' => '/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/'] //co najmniej 1 litera, 1 cyfra i min. 6 znaków
            ],
            'email' => FILTER_VALIDATE_EMAIL
        ];

        $dane = filter_input_array(INPUT_POST, $args);

        $errors = "";
        foreach ($dane as $key => $val) {
            if ($val === false or $val === null) {
                $errors .= "$key jest niepoprawne.<br>";
            }
        }

        if ($errors === ""){
            $this->user = new User($dane['userName'], $dane['password'], $dane['fullName'], $dane['email']);
        } else{
            echo "<p>Błędne dane: <br>$errors</p>";
            $this->user = NULL;
        }
        return $this->user;
    }
}