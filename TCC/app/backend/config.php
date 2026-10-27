<?php
// config.php

ini_set('display_errors', 1);
error_reporting(E_ALL);
$host = '127.0.0.1'; // ou 'localhost'
$dbname = 'sistema_treinos'; // Nome do banco que você criou no SQL
$user = 'root'; // Usuário padrão do XAMPP/WAMP (ajuste se necessário)
$pass = ''; // Senha padrão do XAMPP é vazia (ajuste se necessário)
$charset = 'utf8mb4'; // Garante suporte a acentos e emojis

// DSN (Data Source Name) - String de conexão
$dsn = "mysql:host=$host;dbname=$dbname;charset=$charset";

// Opções de configuração do PDO
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Lança exceções em erros (melhor para debug)
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Retorna arrays associativos
    PDO::ATTR_EMULATE_PREPARES   => false,                  // Usa prepared statements reais do MySQL
];

try {
    // Cria a conexão PDO
    $pdo = new PDO($dsn, $user, $pass, $options);
    
    // Opcional: echo "Conexão bem-sucedida!"; // Use apenas para testar
} catch (PDOException $e) {
    // Em produção, não exiba a mensagem de erro detalhada para o usuário.
    // Registre o erro em um log e mostre uma mensagem genérica.
    // error_log($e->getMessage());
    die('Erro ao conectar ao banco de dados. Tente novamente mais tarde.');
}
?>