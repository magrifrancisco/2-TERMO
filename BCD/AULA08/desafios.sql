-- Active: 1788519233457@@127.0.0.1@3306@smartcoffee_dml_chico
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Francisco Miguel Magri
-- Turma: 2DEVIS TURMA A Data: 02/10/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_chico;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Beatriz', 'beatriz@email.com', '1999999903', 'Americana', TRUE),
('Lucas', 'lucas@email.com', '1999999904', 'Limeira', TRUE);

-- 2. Cadastre a categoria 'Especiais da Casa'.

INSERT INTO categoria (nome) VALUES
('Modas da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.

-- 3. Localize o id da categoria criada.

SELECT id_categoria, nome
FROM categorias
WHERE nome = 'Modas da Casa';

-- Cadastre três produtos nessa categoria.

INSERT INTO produtos (nome, preco, id_categoria)
VALUES
('Café Especial', 15.00, 
    (SELECT id_categoria FROM categorias
     WHERE nome = 'Modas da Casa')),
('Mocha Chocolate', 18.00,
    (SELECT id_categoria FROM categorias
     WHERE nome = 'Modas da Casa')),
('Capuccino de Avelã', 12.00
    (SELECT id_categoria FROM categrias
     WHERE nome = 'Modas da casa'));


-- 4. Cadastre um terceiro cliente sem telefone.

INSERT INTO cliente (nome, email, telefone, cidade,ativo) VALUES
('Chico', 'chico@emial.com', NULL, 'Santos', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
SET @id_cliente_chico = LAST_INSERT_ID();
INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES(NOW(),'PREPARANDO','10.00','3');

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.

SET @pedido_atividade = LAST_INSERT_ID();
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
('1','3', '2', '12.00',NULL);

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:

SELECT * FROM cliente WHERE id_cliente = 2;
UPDATE cliente 
SET telefone = 1998759669
WHERE id_cliente = 2;
SELECT * FROM cliente WHERE email = 'beatriz@email.com';

SELECT * FROM cliente;
-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

SELECT * FROM cliente WHERE id_cliente = 8;
UPDATE cliente
SET telefone = 199764325
WHERE id_cliente = 8;

UPDATE cliente
SET cidade = judiaí
WHERE id_cliente = 8;


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

SELECT *
FROM produto
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    WHERE nome = 'MOdas da Casa'
);

-- UUPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    WHERE nome = 'MOdas da Casa'
);

-- SELECT final:
SELECT *
FROM produto
WHERE id_categoria = (
    SELECT id_categoria
    FROM categoria
    WHERE nome = 'MOdas da Casa'
);

-- 10. Altere o status do pedido criado para 'PREPARANDO'.

SELECT * FROM pedido WHERE id_pedido = @pedido_atividade;
UPDATE pedido
SET status_pedido = 'Preparando'
WHERE id_pedido = @pedido_atividade;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).

SELECT SUM(quantidade * preco_unitario) AS total_pedido
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

UPDATE produto
SET ativo = FALSE
WHERE id_produto = 1;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.

SELECT * FROM cliente WHERE nome = 'Teste';
DELETE FROM cliente
WHERE nome = 'Teste';

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:

SELECT * FROM cliente WHERE id_cliente = 1;
DELETE FROM cliente
WHERE id_cliente = 1;

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:



-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

SELECT * FROM categoria WHERE nome = 'Excluir Depois';
INSERT INTO categoria (nome) VALUES ('Excluir Depois');

-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.
