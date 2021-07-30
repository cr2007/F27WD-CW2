<?php

$host = "localhost";
$user = "root";
$pass = "";
$db = "cw2";

$dsn = "mysql:host=$host;dbname=$db";
$options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  PDO::ATTR_EMULATE_PREPARES => false,
];

try {
  $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
  echo $e->getMessage();
}

?>