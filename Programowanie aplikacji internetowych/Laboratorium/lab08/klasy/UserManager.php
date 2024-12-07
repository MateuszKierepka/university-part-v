<?php
class UserManager {
    function loginForm() {
        ?>
        <h3>Formularz logowania</h3>
        <form action="processLogin.php" method="post">
            <label for="login">Login:</label>
            <input type="text" id="login" name="login" required><br>
            <label for="passwd">Hasło:</label>
            <input type="password" id="passwd" name="passwd" required><br>
            <input type="submit" value="Zaloguj" name="zaloguj">
        </form>
        <?php
    }

    function login($db) {
        $args = [
            'login' => FILTER_SANITIZE_ADD_SLASHES,
            'passwd' => FILTER_SANITIZE_ADD_SLASHES
        ];
        $dane = filter_input_array(INPUT_POST, $args);
        $login = $dane["login"];
        $passwd = $dane["passwd"];
        $userId = $db->selectUser($login, $passwd, "users");

        if ($userId >= 0) { 
            session_start();
            $sessionId = session_id();

            $db->delete("DELETE FROM logged_in_users WHERE userId='$userId'");

            $time = (new DateTime())->format('Y-m-d H:i:s');
            $db->insert("INSERT INTO logged_in_users (userId, sessionId, lastUpdate) VALUES ('$userId', '$sessionId', '$time')");

            return $userId;
        }
        return -1; 
    }

    function logout($db) {
        session_start();
        $sessionId = session_id();

        $db->delete("DELETE FROM logged_in_users WHERE sessionId='$sessionId'");

        session_unset();
        session_destroy();
        setcookie(session_name(), '', time() - 3600, '/');
    }

    function getLoggedInUser($db, $sessionId) {
        $sql = "SELECT userId FROM logged_in_users WHERE sessionId='$sessionId'";
        if ($result = $db->getMysqli()->query($sql)) {
            $row = $result->fetch_assoc();
            return $row ? $row['userId'] : -1;
        }
        return -1;
    }
}
