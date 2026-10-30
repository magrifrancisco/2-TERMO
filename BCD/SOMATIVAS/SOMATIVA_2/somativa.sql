-- Active: 1788519233457@@127.0.0.1@3306@biblioteca_chico
-- 1 Crie o banco biblioteca_som2 e selecione-o.
CREATE DATABASE IF NOT EXISTS biblioteca_chico;
USE biblioteca_chico;
-- 2 Crie a tabela respeitando RN01, RN02 e RN03.
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

-- 3 Crie a tabela e utilize CHECK para impedir quantidade negativa.
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT DEFAULT 0,
    editora VARCHAR(100),
    CHECK (quantidade_disponivel >= 0)
);

-- 4 Crie PK, duas FKs, DEFAULTs e CHECK de status. As FKs devem impedir
-- exclusão de usuário ou livro com histórico.
CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',

    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,

    CHECK (
        status_emprestimo IN
        ('ABERTO', 'DEVOLVIDO', 'ATRASADO')
    ),

    CONSTRAINT FK_ID_USUARIO
    FOREIGN KEY (id_usuario)
    REFERENCES usuarios(id_usuario)
    ON DELETE RESTRICT,

    CONSTRAINT FK_ID_LIVRO
    FOREIGN KEY (id_livro)
    REFERENCES livro(id_livro)
    ON DELETE RESTRICT
);
-- 5 Adicione editora VARCHAR(100) à tabela LIVRO.
ALTER TABLE livro
ADD COLUMN editora VARCHAR(100);

-- 6 Cadastre pelo menos 4 usuários; um deles deve ter telefone NULL.
INSERT INTO usuarios
(nome, email, telefone, ativo)
VALUES
('Francisco Magri', 'chico@gmail.com', '1999999991', TRUE),
('Felipe Rodrigues', 'felipe@email.com', '1999999992', TRUE),
('Franz Kramer', 'franz@email.com', '1999999993', TRUE),
('Davi Ferreira', 'davi@email.com', NULL, TRUE);


-- 7 Cadastre pelo menos 6 livros com autores, ISBNs, anos e quantidades diferentes.
INSERT INTO livro
(titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora)
VALUES
('Crime e Castigo', 'Fiodor Dostoievski', '8573262087001', 1866, 20),
('Dom Quixote', 'Miguel de Cervantes', '9788563560551', 2021, 18),
('A Divina Comedia', 'Dante Alighieri', '9788571751248', 1921, 10),
('Capitao Cueca', 'Dav Pilkey', '9788574067544', 1997, 22),
('Diario de um Banana', 'Jeff Kinney', '8576831309000', 2020, 28),
('Cem Anos de Solidao', 'Gabriel Garcia Marquez', '9788501116550', 1967, 30);


-- 8 Cadastre pelo menos 3 empréstimos ABERTOS para usuários e livros existentes.
INSERT INTO emprestimo
(data_prevista, id_usuario, id_livro)
VALUES
('2026-11-04', 1, 1),
('2026-12-03', 1, 2),
('2026-04-05', 1, 3);


-- 9 Localize um usuário com SELECT e depois altere seu telefone com UPDATE.
SELECT *
FROM usuarios
WHERE id_usuario = 1;

UPDATE usuarios
SET telefone = '19999999992'
WHERE id_usuario = 1;

SELECT * FROM livro;

SELECT * FROM usuarios;

SELECT * FROM emprestimo;

-- 10 Acrescente 2 exemplares a todos os livros publicados a partir de 2020.
UPDATE livro
SET quantidade_disponível = quantidade_disponível + 2
WHERE ano_publicacao >= 2020;

-- 11 Crie e exclua um usuário sem empréstimos. Depois tente excluir um usuário que
-- possua empréstimo e explique o resultado.

INSERT INTO usuarios
(nome, email, telefone, ativo)
VALUES
('Brunão', 'bruno@gmail.com', '1999999999', TRUE);

SELECT * FROM usuarios;
DELETE FROM usuarios
WHERE nome = 'Brunão';

-- 12 Liste título, autor e quantidade disponível de todos os livros. 
SELECT titulo, autor, quantidade_disponivel FROM livro,
WHERE quantidade_disponivel > 0;

-- 13 Liste livros com quantidade maior que 2, do maior para o menor estoque.
SELECT titulo, autor, quantidade_disponivel
FROM livro
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC;

-- 14 Pesquise livros cujo título contenha uma palavra escolhida por você.
SELECT titulo, autor, quantidade_disponível
FROM livro
WHERE titulo LIKE '%Divina%';



-- 15 Liste livros publicados entre 2015 e 2025.
SELECT titulo, autor, ano_publicacao
FROM livro
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16 Mostre COUNT, SUM, AVG, MIN e MAX sobre a quantidade disponível.
SELECT COUNT(*) AS total_livros, SUM(quantidade_disponivel) AS total_estoque, AVG(quantidade_disponivel) AS media_estoque, MIN(quantidade_disponivel) AS min_estoque, MAX(quantidade_disponivel) AS max_estoque
FROM livro;

-- 17 Liste ID do empréstimo, usuário, livro, data e status.
SELECT e.id_emprestimo, u.nome AS usuario, l.titulo AS livro, e.data_emprestimo, e.status_emprestimo
FROM emprestimo e
JOIN usuarios u ON e.id_usuario = u.id_usuario
JOIN livro l ON e.id_livro = l.id_livro;

-- 18 Mostre apenas os empréstimos ABERTOS.
SELECT e.id_emprestimo, u.nome AS usuario, l.titulo AS livro, e.data_emprestimo, e.status_emprestimo
FROM emprestimo e
JOIN usuarios u ON e.id_usuario = u.id_usuario
JOIN livro l ON e.id_livro = l.id_livro
WHERE e.status_emprestimo = 'ABERTO';

-- 19 Mostre cada usuário e sua quantidade de empréstimos, do maior para o menor.
SELECT u.nome AS usuario, COUNT(e.id_emprestimo) AS quantidade_emprestimos
FROM usuarios u
LEFT JOIN emprestimo e ON u.id_usuario = e.id_usuario
GROUP BY u.id_usuario, u.nome
ORDER BY quantidade_emprestimos DESC;

-- 20 Liste todos os usuários, inclusive os que nunca fizeram empréstimo, com a quantidade de empréstimos de cada um.
SELECT u.nome AS usuario, COUNT(e.id_emprestimo) AS quantidade_emprestimos
FROM usuarios u
LEFT JOIN emprestimo e ON u.id_usuario = e.id_usuario
GROUP BY u.id_usuario, u.nome;

-- 21 Transação de empréstimo — 7 pts
-- START TRANSACTION;
-- registre novo empréstimo;
-- reduza o estoque em 1;
-- consulte para conferir;
-- finalize com COMMIT.


-- 22. ROLLBACK — 5 pts
-- Altere propositalmente a quantidade de um livro dentro de uma transação, consulte,
-- execute ROLLBACK e comprove o retorno do valor anterior.



-- 23. SAVEPOINT — 4 pts
-- Faça duas alterações em livros diferentes; após a primeira, crie um SAVEPOINT.
-- Desfaça apenas a segunda e confirme a primeira.


-- 24. Transação de devolução — 4 pts
-- Localize empréstimo ABERTO, marque DEVOLVIDO, registre data de devolução,
-- aumente estoque em 1 e execute COMMIT.

-- Para cada situação abaixo, identifique o mecanismo mais adequado entre
-- constraint, integridade referencial, transação ou regra da aplicação, e justifique
-- tecnicamente sua escolha.
-- Cadastrar dois usuários com o mesmo e-mail.
-- Cadastrar dois livros com o mesmo ISBN.
-- Permitir quantidade disponível negativa.
-- Criar empréstimo para usuário inexistente.
-- Excluir livro com histórico de empréstimos.
-- Gravar empréstimo e falhar na redução do estoque.
-- Emprestar livro cuja quantidade disponível seja zero.