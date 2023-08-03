-- Tabela de artistas
CREATE TABLE artistas (
    IDArtista INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100)
);

-- Tabela de estilos
CREATE TABLE estilos (
    IdEstilo INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100)
);

-- Tabela de usuários
CREATE TABLE usuarios (
    IdUsuario INT PRIMARY KEY Identity,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    permissao VARCHAR(20)
);

-- Tabela de álbuns
CREATE TABLE albuns (
    IdAlbum INT PRIMARY KEY IDENTITY,
    titulo VARCHAR(200),
    data_lancamento DATE,
    localizacao VARCHAR(100),
    minutos INTEGER,
    artista_id INT REFERENCES artistas(IdArtista)
);

-- Tabela de estilos dos álbuns 
CREATE TABLE albuns_estilos (
    album_id INT REFERENCES albuns(IdAlbum),
    estilo_id INT REFERENCES estilos(IdEstilo),
    PRIMARY KEY (album_id, estilo_id)
);


INSERT INTO artistas (nome) 
VALUES
    ('Michael Jackson'),
    ('Madonna'),
    ('Queen'),
    ('Adele');

INSERT INTO estilos (nome) 
VALUES
    ('Pop'),
    ('Rock'),
    ('R&B'),
    ('Hip Hop');

INSERT INTO usuarios (nome, email, senha, permissao) 
VALUES
    ('Admin', 'admin@example.com', 'admin123', 'administrador'),
    ('Usuário1', 'usuario1@example.com', 'senha1', 'comum'),
    ('Usuário2', 'usuario2@example.com', 'senha2', 'comum');

INSERT INTO albuns (titulo, data_lancamento, localizacao, minutos, artista_id) 
VALUES
    ('Thriller', '1982-11-30', 'Los Angeles', 42, 1),
    ('Like a Virgin', '1984-11-12', 'New York', 37, 2),
    ('A Night at the Opera', '1975-11-21', 'London', 43, 3),
    ('21', '2011-01-19', 'London', 48, 4);

INSERT INTO albuns_estilos (album_id, estilo_id)
VALUES
    (1, 1),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 3),
    (4, 4);



SELECT IdUsuario, nome, email, permissao
FROM usuarios
WHERE permissao = 'administrador';


SELECT *
FROM albuns
WHERE data_lancamento > 'YYYY-01-01';


SELECT *
FROM usuarios
WHERE email = 'email_desejado' AND senha = 'senha_desejada';


SELECT a.titulo, ar.nome AS nome_artista, string_agg(e.nome, ', ') AS estilos
FROM albuns AS a
JOIN artistas AS ar ON a.artista_id = ar.IDArtista
LEFT JOIN albuns_estilos AS ae ON a.IdAlbum = ae.album_id
LEFT JOIN estilos AS e ON ae.estilo_id = e.IdEstilo
WHERE a.ativo = TRUE
GROUP BY a.titulo, ar.nome;

