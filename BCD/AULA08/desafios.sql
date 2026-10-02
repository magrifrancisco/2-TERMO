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

INSERT INTO cliente 
(nome, email, telefone, cidade, ativo) 
VALUES
('Davi Ferreira', 'davi@email.com', '1999999901', 'Butao', TRUE),
('Felipe Rodrigues', 'felipe@email.com', '1999999902', 'Limeira', TRUE),

-- 2. Cadastre a categoria 'Especiais da Casa'.

INSERT INTO categoria (nome) VALUES
('MOdas da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SET @id_categorias_especiais = LAST_INSERT_ID();


INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Especial com Chocolate', 12.50, TRUE, @id_categorias_especiais),
('Capuccino de Avelã', 14.00, TRUE, @id_categorias_especiais),
('Café Expresso', 11.00, TRUE, @id_categorias_especiais);

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


-- 10. Altere o status do pedido criado para 'PREPARANDO'.


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).


-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).


-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.


-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:


-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.


-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.
