--Criar o banco de dados
CREATE DATABASE Lucas_Exercicio1_1

-- Tabela de veículos
CREATE TABLE veiculos (
    IdVeiculo INT PRIMARY KEY IDENTITY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    placa VARCHAR(10)
);

-- Tabela de clientes
CREATE TABLE clientes (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela de aluguéis
CREATE TABLE alugueis (
    IdAluguel INT PRIMARY KEY IDENTITY,
    cliente_cpf VARCHAR(14) REFERENCES clientes(cpf),
    veiculo_id INT REFERENCES veiculos(IdVeiculo),
    data_retirada DATE,
    data_devolucao DATE
);

-- Inserindo veículos
INSERT INTO veiculos (marca, modelo, placa) 
VALUES
    ('GM', 'Onix', 'ABC123'),
    ('Ford', 'Fiesta', 'XYZ456'),
    ('Fiat', 'Argo', 'DEF789');

-- Inserindo clientes
INSERT INTO clientes (cpf, nome) 
VALUES
    ('111.222.333-44', 'João da Silva'),
    ('555.666.777-88', 'Maria Souza'),
	('333.555.444.88', 'Lucas Lacerda'),
	('999.444.666.33', 'Uiara Ambrosio');


-- Inserindo registros de aluguel 
INSERT INTO alugueis (cliente_cpf, veiculo_id, data_retirada, data_devolucao) 
VALUES
    ('111.222.333-44', 1, '2023-07-01', '2023-07-10'),
    ('111.222.333-44', 3, '2023-07-15', '2023-07-20'),
    ('555.666.777-88', 2, '2023-07-05', '2023-07-08'),
    ('555.666.777-88', 1, '2023-07-25', '2023-07-30');


SELECT a.data_retirada, a.data_devolucao, c.nome AS nome_cliente, v.modelo
FROM alugueis AS a
JOIN clientes AS c ON a.cliente_cpf = c.cpf
JOIN veiculos AS v ON a.veiculo_id = v.IdVeiculo;

SELECT a.data_retirada, a.data_devolucao, c.nome AS nome_cliente, v.modelo
FROM alugueis AS a
JOIN clientes AS c ON a.cliente_cpf = c.cpf
JOIN veiculos AS v ON a.veiculo_id = v.IdVeiculo
WHERE c.cpf = '111.222.333-44';

SELECT *
FROM veiculos
LEFT JOIN clientes ON clientes.cpf = clientes.nome

SELECT *
FROM veiculos
RIGHT JOIN clientes ON clientes.cpf = clientes.nome
