-- Active: 1788519233457@@127.0.0.1@3306@smartcoffee_dml_chico

DROP DATABASE IF EXISTS SMARTCOFFEE_DML_CHICO;
CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_CHICO;
USE SMARTCOFFEE_DML_CHICO;


-- CRIAÇÃO DAS TABELAS
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);



-- INSERINDO DADOS NA TABELA CLIENTE
INSERT INTO cliente 
(nome, email, telefone, cidade, ativo) 
VALUES
('Arthur Nunes', 'arthur@email.com', '1999999901', 'Rondonia', TRUE),
('Beatriz Raissa', 'beatriz@email.com', '1999999902', 'Limeira', TRUE),
('Dandara Dias', 'dandara@emial.com', '1999999903', 'Limeira', TRUE),
('Davi Ferreira', 'davi@emial.com', NULL, 'Limeira', TRUE),
('Felipe Rodrigues', 'felipe@email.com', NULL, 'Limeira', TRUE),
('Francisco Magri', 'chico@email.com', '1999999903', 'Limeira', TRUE),
('Franz Kramer', 'franz@email.com', '1999999904', 'Limeira', TRUE),
('Gabriel Nogueira', 'gabriel@email', '1999999905', 'Limeira', TRUE),
('Gabrielli Araujo', 'gabrielli@email', '1999999906', 'Americana', TRUE),
('Isabella Alves', 'isabella@email.com', NULL, 'Limeira', TRUE),
('Keynan Santos', 'keynan@email.com', '1999999907', 'Limeira', TRUE),
('Larissa Ramires', 'larissa@email.com', '1999999908', 'Limeira', TRUE),
('Leonardo Dias', 'leonardo@email', '1999999909', 'Valinhos', TRUE),
('Lívia Stein', 'livia@email', '1999999910', 'Limeira', TRUE),
('Luccas Manfredi', 'lucas@email.com', '1999999911', 'Limeira', TRUE);



-- INSERINDO CATEGORIAS
INSERT INTO categoria (nome) 
VALUES
('Cafés'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');


-- VERIFICANDO O ÚLTIMO INSERT REALIZADO
INSERT INTO categoria (nome) 
VALUES ('Doces');

SET @categoria = LAST_INSERT_ID();

SELECT @categoria AS ultimo_id_categoria;


-- ATUALIZANDO DADOS

-- Exemplo 1:
-- Modificando apenas o telefone do cliente de ID 9

UPDATE cliente
SET telefone = '19888888801'
WHERE id_cliente = 9;


-- Consultando o cliente após o UPDATE

SELECT *
FROM cliente
WHERE id_cliente = 9;


-- ============================================
-- Exemplo 2:
-- Modificando vários valores do mesmo cliente
-- ============================================

UPDATE cliente
SET telefone = '1999999901',
    cidade = 'Piracicaba'
WHERE id_cliente = 9;


-- Consultando novamente para verificar a alteração

SELECT *
FROM cliente
WHERE id_cliente = 9;


-- ============================================
-- CONSULTANDO TODOS OS CLIENTES
-- ============================================

SELECT *
FROM cliente;
