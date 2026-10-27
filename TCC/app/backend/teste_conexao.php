<?php
// teste_conexao.php
$host = '127.0.0.1';
$dbname = 'sistema_treinos';
$user = 'root'; // Padrão do XAMPP
$pass = '';     // Padrão do XAMPP (vazio)

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "<h1>✅ Conexão com o banco de dados realizada com sucesso!</h1>";
    
    // Teste extra: contar quantos usuários existem
    $stmt = $pdo->query("SELECT COUNT(*) FROM usuario");
    $count = $stmt->fetchColumn();
    echo "<p>O banco está funcionando. Existem <strong>$count</strong> usuários cadastrados na tabela.</p>";
    
} catch (PDOException $e) {
    die("<h1>❌ Erro na conexão:</h1><p>" . $e->getMessage() . "</p>");
}
?>