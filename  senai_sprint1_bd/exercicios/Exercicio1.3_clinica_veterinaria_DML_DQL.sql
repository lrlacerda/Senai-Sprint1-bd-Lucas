-- Tabela de clínicas
CREATE TABLE clinicas (
    IdClinica INT PRIMARY KEY IDENTITY,
    razao_social VARCHAR(100),
    endereco VARCHAR(200)
);

-- Tabela de veterinários
CREATE TABLE veterinarios (
    IdVeterinario INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    crmv VARCHAR(20)
);

-- Tabela de tipos de pet
CREATE TABLE tipos_pet (
    IdTipoPet INT PRIMARY KEY IDENTITY,
    tipo VARCHAR(50)
);

-- Tabela de raças de pet
CREATE TABLE racas (
    IdRacas INT PRIMARY KEY IDENTITY,
    raca VARCHAR(100),
    tipo_pet_id INT REFERENCES tipos_pet(IdTipoPet)
);

-- Tabela de donos de pets
CREATE TABLE donos (
    IdDonos INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100)
);

-- Tabela de pets
CREATE TABLE pets (
    IdPet INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    data_nascimento DATE,
    raca_id INT REFERENCES racas(IdRacas),
    dono_id INT REFERENCES donos(IdDonos)
);

-- Tabela de atendimentos
CREATE TABLE atendimentos (
    IdAtendimento INT PRIMARY KEY IDENTITY,
    veterinario_id INT REFERENCES veterinarios(IdVeterinario),
    pet_id INT REFERENCES pets(IdPet),
    consulta_descricao TEXT,
    data_consulta DATE
);



-- Inserindo clínicas
INSERT INTO clinicas (razao_social, endereco) 
VALUES
    ('Clínica Veterinária Amigos de Quatro Patas', 'Rua das Petúnias, 123, Cidade Feliz');

-- Inserindo veterinários
INSERT INTO veterinarios (nome, crmv) 
VALUES
    ('Mariana Santos', 'CRMV1234'),
    ('Pedro Oliveira', 'CRMV5678');

-- Inserindo tipos de pet
INSERT INTO tipos_pet (tipo) 
VALUES
    ('Cachorro'),
    ('Gato'),
    ('Pássaro');

-- Inserindo raças
INSERT INTO racas (raca, tipo_pet_id) 
VALUES
    ('Schnauzer', 1),
    ('Shih Tzu', 1),
    ('Siamês', 2),
    ('Sphynx', 2),
    ('Sabiá', 3),
    ('Sanhaço', 3);

-- Inserindo donos
INSERT INTO donos (nome) 
VALUES
    ('Fernanda Lima'),
    ('Ricardo Silva');

-- Inserindo pets
INSERT INTO pets (nome, data_nascimento, raca_id, dono_id) 
VALUES
    ('Rex', '2019-05-10', 1, 1),
    ('Frajola', '2020-02-15', 4, 2),
    ('Luna', '2018-11-20', 3, 1);

-- Inserindo registros de atendimento (Você pode ajustar as datas conforme necessário)
INSERT INTO atendimentos (veterinario_id, pet_id, consulta_descricao, data_consulta) 
VALUES
    (1, 1, 'Consulta de rotina. Pet saudável.', '2023-07-10'),
    (2, 2, 'Dor de ouvido. Prescrito tratamento.', '2023-07-15'),
    (1, 3, 'Vacinação anual. Pet em ótima saúde.', '2023-07-20');



SELECT v.nome, v.crmv
FROM veterinarios AS v
JOIN atendimentos AS a ON v.id = a.veterinario_id
JOIN pets AS p ON a.pet_id = p.id
JOIN donos AS d ON p.dono_id = d.id
JOIN clinicas AS c ON c.id = 1; -- Use o ID da clínica desejada aqui


SELECT raca
FROM racas
WHERE raca LIKE 'S%';


SELECT p.nome AS nome_pet, d.nome AS nome_dono
FROM pets AS p
JOIN donos AS d ON p.dono_id = d.id;


SELECT v.nome AS nome_veterinario, p.nome AS nome_pet, r.raca, tp.tipo, d.nome AS nome_dono, c.razao_social
FROM atendimentos AS a
JOIN veterinarios AS v ON a.veterinario_id = v.id
JOIN pets AS p ON a.pet_id = p.id
JOIN racas AS r ON p.raca_id = r.id
JOIN tipos_pet AS tp ON r.tipo_pet_id = tp.id
JOIN donos AS d ON p.dono_id = d.id
JOIN clinicas AS c ON c.id = 1; -- Use o ID da clínica desejada aqui
