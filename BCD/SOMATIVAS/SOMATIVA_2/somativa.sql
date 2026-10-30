-- Active: 1788519233457@@127.0.0.1@3306@biblioteca_chico
CREATE DATABASE IF NOT EXISTS biblioteca_chico;
USE biblioteca_chico;

CREATE TABLE usuarios (
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponível INT DEFAULT 0
);

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponível INT,
    QUANTIDADE_DISPONÍVEL INT NOT NULL CHECK (QUANTIDADE >0)
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT FK_ID_USUARIO FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    CONSTRAINT FK_ID_LIVRO FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);

ALTER TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO',
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    CONSTRAINT FK_ID_USUARIO FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario),
    CONSTRAINT FK_ID_LIVRO FOREIGN KEY (id_livro) REFERENCES livro (id_livro),
    id_livro INT NOT NULL CHECK (id_livro >0),
    id_usuario INT NOT NULL CHECK (id_usuario >0)
);

ALTER TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponível INT DEFAULT 0,
    editora VARCHAR(100) NOT NULL
);

INSERT INTO usuarios (nome, email, tekefone, ativo) VALUES
('Francisco Magri', 'chico@gmail.com', '1999999991', TRUE),
('Felipe Rodrigues', 'felipe@email.com', '1999999992', TRUE),
('Franz Kramer', 'franz@email.com', '1999999993', TRUE),
('Davi Ferreira', 'davi@email.com', NULL);

INSERT INTO livro (titulo, autor, isbn, ano_publicacao, quantidade_disponível) VALUES
('Crime e Castigo', 'Fiódor Dostoiévski', '85-7326-208-7', '1866', '20'),
('Dom Quixote', 'Miguel de Cervantes','9788563560551', '2021', '18'),
('A Divina Comédia', 'Dante Alighieri','9788571751248', '1921', '10'),
('Capitão Cueca', 'Dav Pilkey', '9788574067544', '1997', '22'),
(' Diário de um Banana ', 'Jeff Kinney', '8576831309', '2020', '28'),
('Cem Anos de Solidão', 'Gabriel García Márquez', '9788501116550', '1967', '30');

INSERT INTO emprestimo
(data_prevista, id_usuario, id_livro) VALUES
('2026-11-04', 1,1)
('2026-12-03', 1,2)
('2026-04-05', 1,3)

SELECT * FROM usuarios
WHERE id_usuario = 1;

UPDATE usuarios 
SET telefone = '19999999992'
WHERE id_cliente = '1';

SELECT * FROM livro;

UPDATE livro 
SET ano_publicacao >= 2020
WHERE id_livro = 1 and 5;

