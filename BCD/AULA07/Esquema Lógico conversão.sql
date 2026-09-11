-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
Nome_cliente varchar(60),
Id_Cliente Int Auto_Increment Prinary Key
)

CREATE TABLE Pedido (
id_pedido Int Auto_Increment Primary Key PRIMARY KEY,
Data_pedido datetime not null,
id_cliente int auto increment primary key
)

CREATE TABLE Produto+Estoque (
Atributo_5 Texto(1),
Atributo_6 Texto(1),
Atributo_7 Texto(1),
Atributo_8 Texto(1)
)

CREATE TABLE Produto (
Atributo_5 Texto(1),
Atributo_6 Texto(1)
)

