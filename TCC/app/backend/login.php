<?php
// backend/login.php
session_start();
require_once __DIR__ . '/config.php'; // Inclui a conexão

// Verifica se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $senha = $_POST['senha'] ?? '';

    // Validação básica
    if (empty($email) || empty($senha)) {
        die('Por favor, preencha e-mail e senha.');
    }

    try {
        // 1. Busca o usuário no banco pelo e-mail
        $sql = "SELECT id, nome, email, senha FROM usuario WHERE email = :email LIMIT 1";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':email' => $email]);
        $usuario = $stmt->fetch();

        // 2. Verifica se o usuário existe e se a senha está correta
        // O password_verify compara a senha digitada com o hash salvo no banco
            if ($usuario && password_verify($senha, $usuario['senha'])) {
            
            // Login deu certo! Vamos criar a sessão do usuário
            $_SESSION['usuario_id'] = $usuario['id'];
            $_SESSION['usuario_nome'] = $usuario['nome'];
            $_SESSION['usuario_email'] = $usuario['email'];

          $sqlTipo = "SELECT 'aluno' AS tipo FROM aluno WHERE id_usuario = :id_aluno 
            UNION 
            SELECT 'professor' AS tipo FROM professor WHERE id_usuario = :id_prof";
            $stmtTipo = $pdo->prepare($sqlTipo);
            $stmtTipo->execute([
                ':id_aluno' => $usuario['id'],
                ':id_prof' => $usuario['id']
            ]);
            $tipoUsuario = $stmtTipo->fetchColumn();

            // Salva o tipo na sessão (se não achar, define como 'usuario')
            $_SESSION['usuario_tipo'] = $tipoUsuario ? $tipoUsuario : 'usuario';

            // Redireciona para o painel
            header('Location: ../views/inicio.html');
            exit;
            
        } else {
            // Usuário não encontrado ou senha incorreta
            // Por segurança, não dizemos se o erro foi no email ou na senha
            die('E-mail ou senha incorretos. <a href="/sistema_treinos/views/login.html">Voltar</a>');
        }

    } catch (PDOException $e) {
        error_log('Erro no login: ' . $e->getMessage());
        die('Ocorreu um erro no sistema. Tente novamente mais tarde.');
    }
} else {
    // Se não for POST, redireciona de volta para a tela de login
    header('Location: ../views/login.html');
    exit;
}
?>