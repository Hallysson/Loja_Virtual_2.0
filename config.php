<?php
require 'environment.php';

global $config;
global $db;

$config = array();
if(ENVIRONMENT == 'development') {
	define("BASE_URL", "http://localhost/Projetos/B7WEB/Curso_PHP/Modulo_Loja_Virtual_2.0/Loja_Virtual_2.0/");
	$config['dbname'] = 'B7Web';
	$config['host'] = 'localhost';
	$config['dbuser'] = 'postgres';
	$config['dbpass'] = 'postgres';
} else {
	define("BASE_URL", "http://localhost/Projetos/B7WEB/Curso_PHP/Modulo_Loja_Virtual_2.0/Loja_Virtual_2.0/ ");
	$config['dbname'] = 'B7Web';
	$config['host'] = 'localhost';
	$config['dbuser'] = 'postgres';
	$config['dbpass'] = 'postgres';
}

$db = new PDO("pgsql:dbname=".$config['dbname'].";host=".$config['host'], $config['dbuser'], $config['dbpass']);
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>