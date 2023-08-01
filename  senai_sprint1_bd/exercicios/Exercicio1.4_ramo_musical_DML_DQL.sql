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
JOIN artistas AS ar ON a.artista_id = ar.id
LEFT JOIN albuns_estilos AS ae ON a.id = ae.album_id
LEFT JOIN estilos AS e ON ae.estilo_id = e.id
WHERE a.ativo = TRUE
GROUP BY a.titulo, ar.nome;
