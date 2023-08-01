--comando para criar o banco de dados
CREATE DATABASE Exercicio_1_1;

--comando para usar o banco de dados
USE Exercicio_1_1;

--comando para criar tabelas
CREATE TABLE Pessoa(
	IdPessoa INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) NOT NULL, --NAO PODE SER NULO
	CNH VARCHAR(11) NOT NULL
)

CREATE TABLE Email(
	IdEmail INT PRIMARY KEY IDENTITY,
	IdPessoa INT FOREIGN KEY REFERENCES Pessoa(IdPessoa),
	EnderecoEmail Varchar(50) not null
)

CREATE TABLE Telefone (
	IdTelefone INT PRIMARY KEY IDENTITY,
	IdPessoa INT FOREIGN KEY REFERENCES Pessoa(IdPessoa),
	Numero VARCHAR(30) NOT NULL
)

--comando para inserir dados na tabela
INSERT INTO Pessoa(Nome, CNH)
VALUES 
	('Lucas', '25894632157'),
	('Tadeu', '24658732469')

INSERT INTO Email(IdPessoa, EnderecoEmail)
VALUES
	(1, 'lucasemail@email.com'),
	(2, 'tadeuemail@email.com')

INSERT INTO Telefone(IdPessoa, Numero)
VALUES
	(1, '11634588534'),
	(2, '11982453871')

--consulta simples das tabelas
SELECT * FROM Pessoa
SELECT * FROM Email
SELECT * FROM Telefone