-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Francisco Miguel Magri
-- Turma: 2Devs Data: 09/10/2026
-- Base: smartcoffee_dql
-- ============================================================


USE smartcoffee_dml_chico;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.

SELECT nome FROM cliente;


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.

SELECT nome, cidade, email
FROM cliente;

-- 3. Liste os nomes das cidades sem repetir valores.

SELECT DISTINCT cidade FROM cliente;

-- 4. Liste todos os produtos em ordem crescente de preço.

SELECT nome, preco FROM produto
ORDER BY preco ASC;

-- 5. Mostre apenas os 5 produtos mais caros.

SELECT nome, preco FROM produto
ORDER BY preco DESC
LIMIT 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.

SELECT nome, preco FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;

-- 7. Liste os clientes das cidades Limeira ou Americana.

SELECT nome, cidade FROM cliente
WHERE cidade IN ('Limeira', 'Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.

SELECT nome FROM produto
WHERE nome LIKE '%Café%';

-- 9. Liste os clientes que não informaram telefone.

SELECT nome, telefone FROM cliente
WHERE telefone IS NULL;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE status_pedido = 'Preparando' AND valor_total > 20.00
ORDER BY valor_total DESC;
-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.

SELECT COUNT(*) AS total_produtos FROM produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.

SELECT ROUND(MIN(preco),2) AS Preço_Baixo,
       ROUND(MAX(preco),2) AS Preço_Alto,
       ROUND(AVG(preco),2) AS Média_Preço
FROM produto;

-- 13. Informe quantos clientes existem em cada cidade.

SELECT cidade, COUNT(*) AS total_cliente
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

SELECT cidade, COUNT(*) AS total_cliente
FROM cliente
GROUP BY cidade
HAVING COUNT(*) >= 2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

SELECT SUM(valor_total) AS faturamento_total
FROM pedido
WHERE status_pedido = 'Preparando';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.

SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS NOME, P.STATUS_PEDIDO, P.VALOR_TOTAL
FROM PEDIDO P
JOIN CLIENTE C ON P.ID_CLIENTE = C.ID_CLIENTE;

-- 17. Liste cada produto acompanhado do nome de sua categoria.

SELECT P.NOME AS PRODUTO , C.NOME AS CATEGORIA
FROM PRODUTO AS P 
JOIN CATEGORIA C ON P.ID_CATEGORIA = C.ID_CATEGORIA;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.

SELECT P.ID_PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, (IP.QUANTIDADE * IP.PRECO_UNITARIO) AS SUBTOTAL
FROM ITEM_PEDIDO IP
JOIN PEDIDO P ON IP.ID_PEDIDO = P.ID_PEDIDO
JOIN PRODUTO PR ON IP.ID_PRODUTO = PR.ID_PRODUTO;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.

SELECT C.NOME AS CLIENTE, P.ID_PEDIDO, P.DATA_PEDIDO, P.VALOR_TOTAL
FROM CLIENTE C
LEFT JOIN PEDIDO P ON C.ID_CLIENTE = P.ID_CLIENTE;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.

SELECT C.NOME AS CLIENTE
FROM CLIENTE C
LEFT JOIN PEDIDO P ON C.ID_CLIENTE = P.ID_CLIENTE
WHERE P.ID_CLIENTE IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.

SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_GASTO
FROM CLIENTE C
LEFT JOIN PEDIDO P ON C.ID_CLIENTE = P.ID_CLIENTE
WHERE P.STATUS_PEDIDO = 'Finalizado'
GROUP BY C.NOME;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.

SELECT C.NOME AS CATEGORIA, COUNT(P.ID_PRODUTO) AS QTDE_PRODUTOS, AVG(P.PRECO) AS PRECO_MEDIO
FROM CATEGORIA C
LEFT JOIN PRODUTO P ON C.ID_CATEGORIA = P.ID_CATEGORIA
GROUP BY C.NOME;

-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.

SELECT NOME, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO) FROM PRODUTO);

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.

SELECT NOME, PRECO,
CASE
WHEN PRECO < 10 THEN 'Econômico'
WHEN PRECO BETWEEN 10 AND 20 THEN 'Intermediário'
ELSE 'Premium'
END AS CLASSIFICACAO
FROM PRODUTO;

-- 25. CONSULTA AUTORAL
-- Pergunta de negócio:
--
-- Por que essa informação é útil?
--
-- Consulta: