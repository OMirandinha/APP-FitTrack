<?php
session_start();

header('Content-Type: application/json');

if (isset($_SESSION['usuario_id'])) {
    echo json_encode([
        'logado' => true,
        'nome' => $_SESSION['usuario_nome'], // Envia o nome
        'tipo' => $_SESSION['usuario_tipo']  // Envia Aluno/Professor
    ]);
} else {
    echo json_encode(['logado' => false]);
}
?>