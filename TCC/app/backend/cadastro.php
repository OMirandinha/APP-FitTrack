<?php
// cadastro.php
session_start();
require_once 'config.php'; // Inclui a conexão

// Verifica se o formulário foi enviado
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $tipo = $_POST['tipo'] ?? ''; // 'aluno' ou 'professor'
    $senha = $_POST['senha'] ?? '';
    $confirmarSenha = $_POST['confirmar-senha'] ?? '';

    // Validações básicas (o frontend já faz algumas, mas o backend é essencial)
    if (empty($nome) || empty($email) || empty($senha) || empty($tipo)) {
        die('Por favor, preencha todos os campos obrigatórios.');
    }
    if ($senha !== $confirmarSenha) {
        die('As senhas não coincidem.');
    }
    if (strlen($senha) < 8) {
        die('A senha deve ter no mínimo 8 caracteres.');
    }

    // Hash da senha (NUNCA armazene senhas em texto puro)
    $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

    try {
        // Inicia uma transação (importante, pois vamos inserir em duas tabelas)
        $pdo->beginTransaction();

        // 1. Insere na tabela `usuario`
        $sqlUsuario = "INSERT INTO usuario (nome, email, senha) VALUES (:nome, :email, :senha)";
        $stmtUsuario = $pdo->prepare($sqlUsuario);
        $stmtUsuario->execute([
            ':nome' => $nome,
            ':email' => $email,
            ':senha' => $senhaHash
        ]);

        // Pega o ID do usuário que acabou de ser criado
        $idUsuario = $pdo->lastInsertId();

        // 2. Insere na tabela específica (aluno ou professor)
        if ($tipo === 'aluno') {
            // Para aluno, criamos o registro na tabela `aluno` (altura/peso podem ser nulos por enquanto)
            $sqlAluno = "INSERT INTO aluno (id_usuario) VALUES (:id_usuario)";
            $stmtAluno = $pdo->prepare($sqlAluno);
            $stmtAluno->execute([':id_usuario' => $idUsuario]);
        } elseif ($tipo === 'professor') {
            // Para professor, geramos um código de profissional simples (você pode querer algo mais robusto)
            // Aqui, usamos um número aleatório apenas para exemplo.
            $codigoProfissional = rand(100000, 999999);
            $sqlProfessor = "INSERT INTO professor (id_usuario, codigo_profissional, ativo) VALUES (:id_usuario, :codigo, 1)";
            $stmtProfessor = $pdo->prepare($sqlProfessor);
            $stmtProfessor->execute([
                ':id_usuario' => $idUsuario,
                ':codigo' => $codigoProfissional
            ]);
        } else {
            // Tipo inválido, desfaz a transação
            $pdo->rollBack();
            die('Tipo de conta inválido.');
        }

        // Se tudo deu certo, confirma a transação
        $pdo->commit();

        // Redireciona para o login ou painel
        header('Location: ../Views/login.html?cadastro=sucesso');
        exit;

    } catch (PDOException $e) {
        // Desfaz a transação em caso de erro (ex: email duplicado)
        $pdo->rollBack();
        
        // Verifica se o erro é de email duplicado (código 23000)
        if ($e->getCode() == 23000) {
            die('Este e-mail já está cadastrado. Tente outro.');
        } else {
            // Log do erro real (para debug) e mensagem genérica para o usuário
            error_log('Erro no cadastro: ' . $e->getMessage());
            die('Ocorreu um erro ao criar sua conta. Tente novamente.');
        }
    }
} else {
    // Se tudo deu certo, confirma a transação
    $pdo->commit();

    // Redireciona de volta para a pasta views
    header('Location: ../views/login.html?cadastro=sucesso');
    exit;
}
?>