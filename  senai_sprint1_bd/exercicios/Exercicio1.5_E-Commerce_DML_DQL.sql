-- Tabela de categorias
CREATE TABLE categorias (
    IdCategoria INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100)
);

-- Tabela de subcategorias
CREATE TABLE subcategorias (
    IdSubcategoria INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    categoria_id INT REFERENCES categorias(IdCategoria)
);

-- Tabela de produtos
CREATE TABLE produtos (
    IdProduto INT PRIMARY KEY IDENTITY,
    titulo VARCHAR(200),
    subcategoria_id INT REFERENCES subcategorias(IdSubcategoria)
);

-- Tabela de clientes
CREATE TABLE clientes (
    IdCliente INT PRIMARY KEY IDENTITY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

-- Tabela de pedidos
CREATE TABLE pedidos (
    IdPedido INT PRIMARY KEY IDENTITY,
    cliente_id INT REFERENCES clientes(IdCliente),
    data_pedido DATE,
    total_pedido DECIMAL(10, 2)
);

-- Tabela de itens do pedido
CREATE TABLE itens_pedido (
    pedido_id INT REFERENCES pedidos(IdPedido),
    produto_id INT REFERENCES produtos(IdProduto),
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    PRIMARY KEY (pedido_id, produto_id)
);



-- Inserindo categorias
INSERT INTO categorias (nome)
VALUES
    ('Eletrônicos'),
    ('Roupas'),
    ('Livros');

-- Inserindo subcategorias
INSERT INTO subcategorias (nome, categoria_id)
VALUES
    ('Smartphones', 1),
    ('Camisetas', 2),
    ('Romance', 3);

-- Inserindo produtos
INSERT INTO produtos (titulo, subcategoria_id)
VALUES
    ('iPhone 13', 1),
    ('Samsung Galaxy S21', 1),
    ('Camiseta Preta', 2),
    ('Camiseta Branca', 2),
    ('Dom Casmurro', 3),
    ('Memórias Póstumas de Brás Cubas', 3);

-- Inserindo clientes
INSERT INTO clientes (nome, endereco, telefone, email)
VALUES
    ('Ana Silva', 'Av. das Flores, 456', '(11) 88888-8888', 'ana.silva@example.com'),
    ('Carlos Santos', 'Rua dos Pássaros, 789', '(11) 77777-7777', 'carlos.santos@example.com');

-- Inserindo pedidos
INSERT INTO pedidos (cliente_id, data_pedido, total_pedido)
VALUES
    (1, '2023-08-03', 1200.00),
    (2, '2023-08-02', 450.50);

-- Inserindo itens do pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES
    (1, 1, 1, 1000.00),
    (1, 2, 2, 400.00),
    (2, 3, 3, 50.50);



SELECT c.nome AS nome_cliente, 
       p.titulo AS titulo_produto,
       sc.nome AS nome_subcategoria,
       cat.nome AS nome_categoria
FROM clientes AS c
JOIN pedidos AS pd ON c.IdCliente = pd.cliente_id
JOIN itens_pedido AS ip ON pd.IdPedido = ip.pedido_id
JOIN produtos AS p ON ip.produto_id = p.IdProduto
JOIN subcategorias AS sc ON p.subcategoria_id = sc.IdSubcategoria
JOIN categorias AS cat ON sc.categoria_id = cat.IdCategoria
WHERE c.nome = 'Nome do Cliente';
