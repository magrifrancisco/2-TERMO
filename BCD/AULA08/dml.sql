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

CREATE TABLE if NOT exists categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES
    categoria (id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM('ABERTO', 'PREPARANDO','FINALIZANDO','CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL (10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);


CREATE TABLE forma_pagamento (
    if_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    if_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT  NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (if_forma_pagamento)
    REFERENCES forma_pagamento (if_forma_pagamento)
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
('Francisco Magri', 'chico@email.com', '1999999904', 'Limeira', TRUE),
('Franz Kramer', 'franz@email.com', '1999999905', 'Limeira', TRUE),
('Gabriel Nogueira', 'gabriel@email', '1999999906', 'Limeira', TRUE),
('Gabrielli Araujo', 'gabrielli@email', '1999999907', 'Americana', TRUE),
('Isabella Alves', 'isabella@email.com', NULL, 'Limeira', TRUE),
('Keynan Santos', 'keynan@email.com', '1999999908', 'Limeira', TRUE),
('Larissa Ramires', 'larissa@email.com', '1999999909', 'Limeira', TRUE),
('Leonardo Dias', 'leonardo@email', '1999999910', 'Valinhos', TRUE),
('Lívia Stein', 'livia@email', '1999999911', 'Limeira', TRUE),
('Luccas Manfredi', 'lucas@email.com', '1999999912', 'Limeira', TRUE);



-- INSERINDO CATEGORIAS
INSERT INTO categoria (nome) 
VALUES
('Cafés'),
('Bebidas Geladas'),
('Bebidas Quentes'),
('Salgados'),
('Sobremesas'),
('Combo');

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Café Tradicional', 7.00,TRUE,1),
('Capuccino', 10.00, TRUE,2),
('Café Gelado', 6.00, TRUE,3),
('Café Expresso', 9.00, TRUE,4),
('Café com Leite', 6.00, TRUE,5);

INSERT INTO pedido (data_pedido, status_pedido, valor_total,id_cliente) VALUES (NOW(),'FINALIZADO', 0.00, 2),(NOW())

INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario, observacao) VALUES
('Chocolate'),
('Espuma'),
('Açucar'),
('Com Canela');

INSERT INTO forma_pagamento (descricao) VALUES
('Crédito'),
('Débito'),
('Pix'),
('Dinheiro');

-- VERIFICANDO O ÚLTIMO INSERT REALIZADO OU FEITO
INSERT INTO categoria (nome) VALUES 
('Epeciais da House');
SET @categoria = LAST_INSERT_ID();

SELECT @categoria AS ultimo_id_categoria;

SELECT * FROM cliente;

INSERT INTO categoria (nome) VALUES
('Combos Extras');

SET @categorias_novas = (SELECT nome FROM categoria WHERE nome = 'Combos Extras');

SELECT @categorias_novas




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



-- Exemplo 2:
-- Modificando vários valores do mesmo cliente

UPDATE cliente
SET telefone = '1999999901',
    cidade = 'Piracicaba'
WHERE id_cliente = 9;


-- Consultando novamente para verificar a alteração

SELECT *
FROM cliente
WHERE id_cliente = 9;



-- CONSULTANDO TODOS OS CLIENTES
SELECT *
FROM cliente;


-- PROCEDIMENTO DE UMA COMPRA
-- PASSO 1: REALIZAR CADASTRO CLIENTE 

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES ('Carlos Silva','carlos.silva4@email.com','1999999999','Santos',TRUE);

SET @cliente_compra = LAST_INSERT_ID();

-- PASSO 2: REALIZAR PEDIDO 
INSERT INTO pedido (data_pedido,status_pedido,valor_total,id_cliente)VALUES (NOW(),'ABERTO', 0.00,@cliente_compra);
SET @pedido_compra = LAST_INSERT_ID();

-- PASSO 3: INSERINDO ITENS

INSERT into item_pedido (id_pedido,id_produto,quantidade,preco_unitario) VALUES (@pedido_compra,4,1,13.00), (@pedido_compra,5,1,9.00);

-- PASSO 4 - ATUALIZANDO TOTAL E STATUS
UPDATE pedido
SET valor_total = 22.00,
    status_pedido = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

-- PASSO 5 - REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido,if_forma_pagamento,valor,data_pagamento) VALUES (@pedido_compra,2,22.00,NOW());

-- PASSO 6 - CONSULTAR PEDIDO E RESULTADO
SELECT p.id_pedido,
    c.nome AS Nome_Cliente,
    p.status_pedido AS status_pedido,
    p.valor_total AS Compra_total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

-- PASSO 7 - RELATÓRIO

-- TRANSAÇÕES - SEGURANÇA PARA DML
START TRANSACTION;
UPDATE produto
SET preco = preco * 2.80
WHERE id_categoria = 1;
-- DESFAZ O QUE FIZEMOS ERRADO OU VOLTA UMA TRANSAÇÃO

ROLLBACK;
-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO
COMMIT;

START TRANSACTION;
UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 121;
SELECT * FROM cliente WHERE id_cliente = 121;
COMMIT;
ROLLBACK

-- PROCEDIMENTO DE UMA COMPRA

