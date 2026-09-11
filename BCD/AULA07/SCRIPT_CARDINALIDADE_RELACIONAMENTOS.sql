-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
--Relacionamento e Cradinalidade - Banco de dados Exemplo

CREATE DATABASE IF NOT EXISTS SESI_CR_TA;

USE SESI_CR_TA;


CREATE TABLE Cliente (
Nome_cliente Int Auto_Increment primary key PRIMARY KEY,
Id_cliente Texto(1) PRIMARY KEY
)

CREATE TABLE Pedido (
id_pedido Int Auto_Increment Primary Key,
Data_pedido datetime not null ,
Id_cliente int not null
)

CREATE TABLE Estoque (
Nome_Produto varchar(100),
Id_produto Int not null unique,
Id_Estoque Int Auto_Increment Primary Key,
Quantidade int not null
-- PRIMARY KEY(Id_produto,Id_Estoque)
)

CREATE TABLE Fornecedor (
Razao_Social varchar(100) not null,
Id_Forncedor Int Auto_Increment primary Key  Primary Key
)

CREATE TABLE Produto (
Id_Produto Int Auto_Increment primary Key PRIMARY KEY,
Nome_Produto varchar(100) not null
)



CREATE TABLE Item_Produto (
Id_Produto Int not null,
Id_Forncedor Int not null,
Id_Item Int Auto_Increment Primary Key PRIMARY KEY,
Valor Decimal(10,2),
Observacao text(300),
FOREIGN KEY(Id_Forncedor) REFERENCES Fornecedor (Id_Forncedor),
FOREIGN KEY(Id_Produto) REFERENCES Produto (Id_Produto)
)
