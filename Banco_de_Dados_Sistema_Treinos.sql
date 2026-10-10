-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/09/2026 às 01:43
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_treinos`
--
CREATE DATABASE IF NOT EXISTS `sistema_treinos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema_treinos`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

DROP TABLE IF EXISTS `aluno`;
CREATE TABLE IF NOT EXISTS `aluno` (
  `id_usuario` int(11) NOT NULL,
  `altura` decimal(5,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_treino`
--

DROP TABLE IF EXISTS `aluno_treino`;
CREATE TABLE IF NOT EXISTS `aluno_treino` (
  `id_aluno` int(11) NOT NULL,
  `id_treino` int(11) NOT NULL,
  PRIMARY KEY (`id_aluno`,`id_treino`),
  KEY `id_treino` (`id_treino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `criado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `execucao_exercicio`
--

DROP TABLE IF EXISTS `execucao_exercicio`;
CREATE TABLE IF NOT EXISTS `execucao_exercicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `id_item_treino` int(11) NOT NULL,
  `series_feitas` int(11) NOT NULL,
  `repeticoes_feitas` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_item_treino` (`id_item_treino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `execucao_treino`
--

DROP TABLE IF EXISTS `execucao_treino`;
CREATE TABLE IF NOT EXISTS `execucao_treino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `id_treino` int(11) NOT NULL,
  `data_execucao` datetime DEFAULT current_timestamp(),
  `concluido` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_aluno` (`id_aluno`),
  KEY `id_treino` (`id_treino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicio`
--

DROP TABLE IF EXISTS `exercicio`;
CREATE TABLE IF NOT EXISTS `exercicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_treino`
--

DROP TABLE IF EXISTS `item_treino`;
CREATE TABLE IF NOT EXISTS `item_treino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_treino` int(11) NOT NULL,
  `id_exercicio` int(11) NOT NULL,
  `ordem` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `repeticoes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_treino` (`id_treino`),
  KEY `id_exercicio` (`id_exercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
CREATE TABLE IF NOT EXISTS `mensagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chat` int(11) NOT NULL,
  `remetente` varchar(100) NOT NULL,
  `conteudo` text NOT NULL,
  `enviado_em` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_chat` (`id_chat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

DROP TABLE IF EXISTS `professor`;
CREATE TABLE IF NOT EXISTS `professor` (
  `id_usuario` int(11) NOT NULL,
  `codigo_profissional` int(11) NOT NULL,
  `ativo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `codigo_profissional` (`codigo_profissional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `treino`
--

DROP TABLE IF EXISTS `treino`;
CREATE TABLE IF NOT EXISTS `treino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `criado_em` datetime DEFAULT current_timestamp(),
  `id_professor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_professor` (`id_professor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `aluno_treino`
--
ALTER TABLE `aluno_treino`
  ADD CONSTRAINT `aluno_treino_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `aluno_treino_ibfk_2` FOREIGN KEY (`id_treino`) REFERENCES `treino` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `execucao_exercicio`
--
ALTER TABLE `execucao_exercicio`
  ADD CONSTRAINT `execucao_exercicio_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `execucao_exercicio_ibfk_2` FOREIGN KEY (`id_item_treino`) REFERENCES `item_treino` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `execucao_treino`
--
ALTER TABLE `execucao_treino`
  ADD CONSTRAINT `execucao_treino_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `execucao_treino_ibfk_2` FOREIGN KEY (`id_treino`) REFERENCES `treino` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_treino`
--
ALTER TABLE `item_treino`
  ADD CONSTRAINT `item_treino_ibfk_1` FOREIGN KEY (`id_treino`) REFERENCES `treino` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `item_treino_ibfk_2` FOREIGN KEY (`id_exercicio`) REFERENCES `exercicio` (`id`);

--
-- Restrições para tabelas `mensagem`
--
ALTER TABLE `mensagem`
  ADD CONSTRAINT `mensagem_ibfk_1` FOREIGN KEY (`id_chat`) REFERENCES `chat` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `treino`
--
ALTER TABLE `treino`
  ADD CONSTRAINT `treino_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professor` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
