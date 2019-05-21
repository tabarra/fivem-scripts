<?php
header('Content-Type: text/html; charset=utf-8');
date_default_timezone_set('America/Sao_Paulo');
echo '<title>vRP Users</title><pre>';
//require 'vendor/autoload.php';
//ref::config('expLvl', 3);


$host = '127.0.0.1';
$db   = 'db_name';
$user = 'root';
$pass = '';
$charset = 'utf8'; //or 'utf8mb4'?

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
    PDO::ATTR_EMULATE_PREPARES   => false,
];
try {
     $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
     throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

function echoRow($label, $data){
	echo "<b>{$label}:</b>\t{$data}\n";
}
