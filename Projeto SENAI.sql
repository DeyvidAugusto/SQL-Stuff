CREATE DATABASE db_oficina_dois_irmaos;
USE db_oficina_dois_irmaos;
-- DROP DATABASE db_oficina_dois_irmaos;

CREATE TABLE tb_cliente(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,    
nome VARCHAR (125) NOT NULL,
cpf VARCHAR(20) NOT NULL UNIQUE,
data_cadastro DATE,
email VARCHAR(125) NOT NULL 
);

CREATE TABLE tb_endereco_cliente(
id_endereco_cliente INT PRIMARY KEY AUTO_INCREMENT, 
estado  ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO') NOT NULL,
cidade VARCHAR(50) NOT NULL,
rua VARCHAR(50) NOT NULL,
numero INT (11)NOT NULL,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
);

CREATE TABLE tb_telefone_cliente(
id_telefone_cliente INT PRIMARY KEY AUTO_INCREMENT,  
contato VARCHAR(20) NOT NULL UNIQUE,
id_cliente INT, 
FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
);

CREATE TABLE tb_fornecedor(
id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (125) NOT NULL,
contato VARCHAR (125) NOT NULL,
cnpj VARCHAR (125) NOT NULL UNIQUE 
);

CREATE TABLE tb_endereco_fornecedor(
id_endereco_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
estado ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO') NOT NULL,
cidade VARCHAR(50) NOT NULL,
rua VARCHAR(50) NOT NULL,
numero INT (11)NOT NULL,
id_fornecedor INT,
FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedor (id_fornecedor)
); 

CREATE TABLE tb_pecas(
id_pecas INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (125) ,
categoria VARCHAR (125) ,
marca VARCHAR (125) ,
preco DECIMAL(10,2),
id_fornecedor INT,
FOREIGN KEY (id_fornecedor) REFERENCES tb_fornecedor (id_fornecedor)
); 
CREATE TABLE tb_veiculos(
id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
modelo VARCHAR (50),
marca VARCHAR (50),
placa VARCHAR(10) NOT NULL UNIQUE,
cor VARCHAR (20),
id_cliente INT, 
FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente)
);

CREATE TABLE tb_funcionario(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(125),
cpf VARCHAR(20)UNIQUE,
cargo VARCHAR(20),
email VARCHAR(125)
);

CREATE TABLE tb_servicos(
id_servico INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(125),
descricao TEXT, 
custo_mdo DECIMAL(10,2),
id_funcionario INT,
id_pecas INT,
FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario (id_funcionario),
FOREIGN KEY (id_pecas) REFERENCES tb_pecas (id_pecas));

CREATE TABLE tb_endereco_funcionario(
id_endereco_funcionario INT PRIMARY KEY AUTO_INCREMENT,
estado ENUM('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO') NOT NULL,
cidade VARCHAR(50),
rua VARCHAR(50),
numero INT (11),
id_funcionario INT,
FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario (id_funcionario)
);

CREATE TABLE tb_telefone_funcionario(
id_telefone_funcionario INT PRIMARY KEY AUTO_INCREMENT,
numero VARCHAR(20) NOT NULL UNIQUE,
id_funcionario INT,
FOREIGN KEY (id_funcionario) REFERENCES tb_funcionario (id_funcionario)
);

CREATE TABLE tb_pagamento(
id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
data_pagamento DATE,
metodo_pagamento ENUM('PIX', 'Credito', 'Debito', 'Dinheiro'),
id_cliente INT,
id_servico INT,
FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente),
FOREIGN KEY (id_servico) REFERENCES tb_servicos (id_servico)
);

-- ######################################################################################## ALIMENTAÇÃO DAS TABELAS ########################################################################################

INSERT INTO tb_cliente (nome, cpf, data_cadastro, email) VALUES
('Ana Silva', '11111111111', '2024-01-01', 'ana.silva@example.com'),
('Bruno Souza', '22222222222', '2024-01-02', 'bruno.souza@example.com'),
('Carlos Oliveira', '33333333333', '2024-01-03', 'carlos.oliveira@example.com'),
('Daniela Costa', '44444444444', '2024-01-04', 'daniela.costa@example.com'),
('Eduardo Lima', '55555555555', '2024-01-05', 'eduardo.lima@example.com'),
('Fernanda Rocha', '66666666666', '2024-01-06', 'fernanda.rocha@example.com'),
('Gabriel Almeida', '77777777777', '2024-01-07', 'gabriel.almeida@example.com'),
('Heloísa Ferreira', '88888888888', '2024-01-08', 'heloisa.ferreira@example.com'),
('Igor Santos', '99999999999', '2024-01-09', 'igor.santos@example.com'),
('Juliana Ribeiro', '00000000000', '2024-01-10', 'juliana.ribeiro@example.com'),
('Lucas Mendes', '10101010101', '2024-01-11', 'lucas.mendes@example.com'),
('Mariana Castro', '20202020202', '2024-01-12', 'mariana.castro@example.com'),
('Nathan Dias', '30303030303', '2024-01-13', 'nathan.dias@example.com'),
('Olivia Martins', '40404040404', '2024-01-14', 'olivia.martins@example.com'),
('Pedro Moreira', '50505050505', '2024-01-15', 'pedro.moreira@example.com'),
('Quirina Nogueira', '60606060606', '2024-01-16', 'quirina.nogueira@example.com'),
('Rafael Teixeira', '70707070707', '2024-01-17', 'rafael.teixeira@example.com'),
('Sofia Carvalho', '80808080808', '2024-01-18', 'sofia.carvalho@example.com'),
('Thiago Pinto', '90909090909', '2024-01-19', 'thiago.pinto@example.com'),
('Ursula Vieira', '11111111110', '2024-01-20', 'ursula.vieira@example.com'),
('Vinicius Araujo', '22222222221', '2024-01-21', 'vinicius.araujo@example.com'),
('Wagner Borges', '33333333332', '2024-01-22', 'wagner.borges@example.com'),
('Xenia Santos', '44444444443', '2024-01-23', 'xenia.santos@example.com'),
('Yuri Barros', '55555555554', '2024-01-24', 'yuri.barros@example.com'),
('Zara Oliveira', '66666666665', '2024-01-25', 'zara.oliveira@example.com'),
('Alberto Costa', '77777777776', '2024-01-26', 'alberto.costa@example.com'),
('Bianca Souza', '88888888887', '2024-01-27', 'bianca.souza@example.com'),
('Caio Almeida', '99999999998', '2024-01-28', 'caio.almeida@example.com'),
('Diana Ferreira', '00000000009', '2024-01-29', 'diana.ferreira@example.com'),
('Enzo Santos', '10101010100', '2024-01-30', 'enzo.santos@example.com');
SELECT * FROM tb_cliente;

INSERT INTO tb_endereco_cliente (estado, cidade, rua, numero, id_cliente) VALUES
('DF', 'Brasília', 'Rua A', 101, 1),
('MG', 'Belo Horizonte', 'Rua B', 102, 2),
('GO', 'Goiânia', 'Rua C', 103, 3),
('DF', 'Brasília', 'Rua D', 104, 4),
('MG', 'Belo Horizonte', 'Rua E', 105, 5),
('GO', 'Goiânia', 'Rua F', 106, 6),
('DF', 'Brasília', 'Rua G', 107, 7),
('MG', 'Belo Horizonte', 'Rua H', 108, 8),
('GO', 'Goiânia', 'Rua I', 109, 9),
('DF', 'Brasília', 'Rua J', 110, 10),
('MG', 'Belo Horizonte', 'Rua K', 111, 11),
('GO', 'Goiânia', 'Rua L', 112, 12),
('DF', 'Brasília', 'Rua M', 113, 13),
('MG', 'Belo Horizonte', 'Rua N', 114, 14),
('GO', 'Goiânia', 'Rua O', 115, 15),
('DF', 'Brasília', 'Rua P', 116, 16),
('MG', 'Belo Horizonte', 'Rua Q', 117, 17),
('GO', 'Goiânia', 'Rua R', 118, 18),
('DF', 'Brasília', 'Rua S', 119, 19),
('MG', 'Belo Horizonte', 'Rua T', 120, 20),
('GO', 'Goiânia', 'Rua U', 121, 21),
('DF', 'Brasília', 'Rua V', 122, 22),
('MG', 'Belo Horizonte', 'Rua W', 123, 23),
('GO', 'Goiânia', 'Rua X', 124, 24),
('DF', 'Brasília', 'Rua Y', 125, 25),
('MG', 'Belo Horizonte', 'Rua Z', 126, 26),
('GO', 'Goiânia', 'Rua AA', 127, 27),
('DF', 'Brasília', 'Rua BB', 128, 28),
('MG', 'Belo Horizonte', 'Rua CC', 129, 29),
('GO', 'Goiânia', 'Rua DD', 130, 30);
SELECT * FROM tb_endereco_cliente;

INSERT INTO tb_telefone_cliente (contato, id_cliente) VALUES
('61987654321', 1),
('61987654322', 2),
('61987654323', 3),
('61987654324', 4),
('61987654325', 5),
('61987654326', 6),
('61987654327', 7),
('61987654328', 8),
('61987654329', 9),
('61987654330', 10),
('61987654331', 11),
('61987654332', 12),
('61987654333', 13),
('61987654334', 14),
('61987654335', 15),
('61987654336', 16),
('61987654337', 17),
('61987654338', 18),
('61987654339', 19),
('61987654340', 20),
('61987654341', 21),
('61987654342', 22),
('61987654343', 23),
('61987654344', 24),
('61987654345', 25),
('61987654346', 26),
('61987654347', 27),
('61987654348', 28),
('61987654349', 29),
('61987654350', 30);
SELECT * FROM tb_telefone_cliente;

INSERT INTO tb_fornecedor (nome, contato, cnpj) VALUES
('Fornecedor A', 'contatoA@example.com', '12345678000101'),
('Fornecedor B', 'contatoB@example.com', '23456789000102'),
('Fornecedor C', 'contatoC@example.com', '34567890000103'),
('Fornecedor D', 'contatoD@example.com', '45678901000104'),
('Fornecedor E', 'contatoE@example.com', '56789012000105'),
('Fornecedor F', 'contatoF@example.com', '67890123000106'),
('Fornecedor G', 'contatoG@example.com', '78901234000107'),
('Fornecedor H', 'contatoH@example.com', '89012345000108'),
('Fornecedor I', 'contatoI@example.com', '90123456000109'),
('Fornecedor J', 'contatoJ@example.com', '01234567000110'),
('Fornecedor K', 'contatoK@example.com', '12345678000111'),
('Fornecedor L', 'contatoL@example.com', '23456789000112'),
('Fornecedor M', 'contatoM@example.com', '34567890000113'),
('Fornecedor N', 'contatoN@example.com', '45678901000114'),
('Fornecedor O', 'contatoO@example.com', '56789012000115'),
('Fornecedor P', 'contatoP@example.com', '67890123000116'),
('Fornecedor Q', 'contatoQ@example.com', '78901234000117'),
('Fornecedor R', 'contatoR@example.com', '89012345000118'),
('Fornecedor S', 'contatoS@example.com', '90123456000119'),
('Fornecedor T', 'contatoT@example.com', '01234567000120'),
('Fornecedor U', 'contatoU@example.com', '12345678000121'),
('Fornecedor V', 'contatoV@example.com', '23456789000122'),
('Fornecedor W', 'contatoW@example.com', '34567890000123'),
('Fornecedor X', 'contatoX@example.com', '45678901000124'),
('Fornecedor Y', 'contatoY@example.com', '56789012000125'),
('Fornecedor Z', 'contatoZ@example.com', '67890123000126'),
('Fornecedor AA', 'contatoAA@example.com', '78901234000127'),
('Fornecedor BB', 'contatoBB@example.com', '89012345000128'),
('Fornecedor CC', 'contatoCC@example.com', '90123456000129'),
('Fornecedor DD', 'contatoDD@example.com', '01234567000130');
SELECT * FROM tb_fornecedor;

INSERT INTO tb_endereco_fornecedor (estado, cidade, rua, numero, id_fornecedor) VALUES
('DF', 'Brasília', 'R11 A', 101, 1),
('MG', 'Belo Horizonte', 'R52 B', 102, 2),
('GO', 'Goiânia', 'R53 C', 103, 3),
('DF', 'Brasília', 'R52 D', 104, 4),
('MG', 'Belo Horizonte', 'R51 E', 105, 5),
('GO', 'Goiânia', 'R52 F', 106, 6),
('DF', 'Brasília', 'R52 G', 107, 7),
('MG', 'Belo Horizonte', 'R51 H', 108, 8),
('GO', 'Goiânia', 'R53 I', 109, 9),
('DF', 'Brasília', 'R51 J', 110, 10),
('MG', 'Belo Horizonte', 'R53 K', 111, 11),
('GO', 'Goiânia', 'R52 L', 112, 12),
('DF', 'Brasília', 'R52 M', 113, 13),
('MG', 'Belo Horizonte', 'R51 N', 114, 14),
('GO', 'Goiânia', 'R53 O', 115, 15),
('DF', 'Brasília', 'R51 P', 116, 16),
('MG', 'Belo Horizonte', 'R51 Q', 117, 17),
('GO', 'Goiânia', 'R52 R', 118, 18),
('DF', 'Brasília', 'R53 S', 119, 19),
('MG', 'Belo Horizonte', 'R51 T', 120, 20),
('GO', 'Goiânia', 'R52 U', 121, 21),
('DF', 'Brasília', 'R52 V', 122, 22),
('MG', 'Belo Horizonte', 'R51 W', 123, 23),
('GO', 'Goiânia', 'R52 X', 124, 24),
('DF', 'Brasília', 'R51 Y', 125, 25),
('MG', 'Belo Horizonte', 'R51 Z', 126, 26),
('GO', 'Goiânia', 'R52 AA', 127, 27),
('DF', 'Brasília', 'R52 BB', 128, 28),
('MG', 'Belo Horizonte', 'R51 CC', 129, 29),
('GO', 'Goiânia', 'R52 DD', 130, 30);
SELECT * FROM tb_endereco_fornecedor;

INSERT INTO tb_pecas (nome, categoria, marca, preco, id_fornecedor) VALUES
('Peca A', 'Categoria A', 'Marca A', 100.00, 1),
('Peca B', 'Categoria B', 'Marca B', 150.00, 2),
('Peca C', 'Categoria C', 'Marca C', 200.00, 3),
('Peca D', 'Categoria D', 'Marca D', 250.00, 4),
('Peca E', 'Categoria E', 'Marca E', 300.00, 5),
('Peca F', 'Categoria F', 'Marca F', 350.00, 6),
('Peca G', 'Categoria G', 'Marca G', 400.00, 7),
('Peca H', 'Categoria H', 'Marca H', 450.00, 8),
('Peca I', 'Categoria I', 'Marca I', 500.00, 9),
('Peca J', 'Categoria J', 'Marca J', 550.00, 10),
('Peca K', 'Categoria K', 'Marca K', 600.00, 11),
('Peca L', 'Categoria L', 'Marca L', 650.00, 12),
('Peca M', 'Categoria M', 'Marca M', 700.00, 13),
('Peca N', 'Categoria N', 'Marca N', 750.00, 14),
('Peca O', 'Categoria O', 'Marca O', 800.00, 15),
('Peca P', 'Categoria P', 'Marca P', 850.00, 16),
('Peca Q', 'Categoria Q', 'Marca Q', 900.00, 17),
('Peca R', 'Categoria R', 'Marca R', 950.00, 18),
('Peca S', 'Categoria S', 'Marca S', 1000.00, 19),
('Peca T', 'Categoria T', 'Marca T', 1050.00, 20),
('Peca U', 'Categoria U', 'Marca U', 1100.00, 21),
('Peca V', 'Categoria V', 'Marca V', 1150.00, 22),
('Peca W', 'Categoria W', 'Marca W', 1200.00, 23),
('Peca X', 'Categoria X', 'Marca X', 1250.00, 24),
('Peca Y', 'Categoria Y', 'Marca Y', 1300.00, 25),
('Peca Z', 'Categoria Z', 'Marca Z', 1350.00, 26),
('Peca AA', 'Categoria AA', 'Marca AA', 1400.00, 27),
('Peca BB', 'Categoria BB', 'Marca BB', 1450.00, 28),
('Peca CC', 'Categoria CC', 'Marca CC', 1500.00, 29),
('Peca DD', 'Categoria DD', 'Marca DD', 1550.00, 30);
SELECT * FROM tb_pecas;

INSERT INTO tb_veiculos (modelo, marca, placa, cor, id_cliente) VALUES
('Modelo A', 'Marca A', 'ABC1234', 'Preto', 1),
('Modelo B', 'Marca B', 'DEF5678', 'Branco', 2),
('Modelo C', 'Marca C', 'GHI9012', 'Vermelho', 3),
('Modelo D', 'Marca D', 'JKL3456', 'Azul', 4),
('Modelo E', 'Marca E', 'MNO7890', 'Verde', 5),
('Modelo F', 'Marca F', 'PQR2345', 'Amarelo', 6),
('Modelo G', 'Marca G', 'STU6789', 'Cinza', 7),
('Modelo H', 'Marca H', 'VWX1234', 'Prata', 8),
('Modelo I', 'Marca I', 'YZA5678', 'Marrom', 9),
('Modelo J', 'Marca J', 'BCD9012', 'Laranja', 10),
('Modelo K', 'Marca K', 'EFG3456', 'Roxo', 11),
('Modelo L', 'Marca L', 'HIJ7890', 'Rosa', 12),
('Modelo M', 'Marca M', 'KLM2345', 'Dourado', 13),
('Modelo N', 'Marca N', 'NOP6789', 'Prata', 14),
('Modelo O', 'Marca O', 'QRS1234', 'Azul', 15),
('Modelo P', 'Marca P', 'TUV5678', 'Verde', 16),
('Modelo Q', 'Marca Q', 'WXY9012', 'Vermelho', 17),
('Modelo R', 'Marca R', 'ZAB3456', 'Branco', 18),
('Modelo S', 'Marca S', 'CDE7890', 'Preto', 19),
('Modelo T', 'Marca T', 'FGH2345', 'Cinza', 20),
('Modelo U', 'Marca U', 'IJK6789', 'Azul', 21),
('Modelo V', 'Marca V', 'LMN1234', 'Amarelo', 22),
('Modelo W', 'Marca W', 'OPQ5678', 'Marrom', 23),
('Modelo X', 'Marca X', 'RST9012', 'Dourado', 24),
('Modelo Y', 'Marca Y', 'UVW3456', 'Laranja', 25),
('Modelo Z', 'Marca Z', 'XYZ7890', 'Roxo', 26),
('Modelo AA', 'Marca AA', 'BCD2345', 'Rosa', 27),
('Modelo BB', 'Marca BB', 'EFG6789', 'Cinza', 28),
('Modelo CC', 'Marca CC', 'HIJ1234', 'Prata', 29),
('Modelo DD', 'Marca DD', 'KLM5678', 'Branco', 30);
SELECT * FROM tb_veiculos;

INSERT INTO tb_funcionario (nome, cpf, cargo, email) VALUES
('Funcionario A', '12345678901', 'Cargo A', 'funcionarioA@example.com'),
('Funcionario B', '23456789012', 'Cargo B', 'funcionarioB@example.com'),
('Funcionario C', '34567890123', 'Cargo C', 'funcionarioC@example.com'),
('Funcionario D', '45678901234', 'Cargo D', 'funcionarioD@example.com'),
('Funcionario E', '56789012345', 'Cargo E', 'funcionarioE@example.com'),
('Funcionario F', '67890123456', 'Cargo F', 'funcionarioF@example.com'),
('Funcionario G', '78901234567', 'Cargo G', 'funcionarioG@example.com'),
('Funcionario H', '89012345678', 'Cargo H', 'funcionarioH@example.com'),
('Funcionario I', '90123456789', 'Cargo I', 'funcionarioI@example.com'),
('Funcionario J', '01234567890', 'Cargo J', 'funcionarioJ@example.com');
SELECT * FROM tb_funcionario;

INSERT INTO tb_servicos (nome, descricao, custo_mdo, id_funcionario, id_pecas) VALUES
('Servico A', 'Descricao do Servico A', 100.00, 1, 1),
('Servico B', 'Descricao do Servico B', 150.00, 2, 2),
('Servico C', 'Descricao do Servico C', 200.00, 3, 3),
('Servico D', 'Descricao do Servico D', 250.00, 4, 4),
('Servico E', 'Descricao do Servico E', 300.00, 5, 5),
('Servico F', 'Descricao do Servico F', 350.00, 6, 6),
('Servico G', 'Descricao do Servico G', 400.00, 7, 7),
('Servico H', 'Descricao do Servico H', 450.00, 8, 8),
('Servico I', 'Descricao do Servico I', 500.00, 9, 9),
('Servico J', 'Descricao do Servico J', 550.00, 10, 10),
('Servico K', 'Descricao do Servico K', 600.00, 1, 11),
('Servico L', 'Descricao do Servico L', 650.00, 2, 12),
('Servico M', 'Descricao do Servico M', 700.00, 3, 13),
('Servico N', 'Descricao do Servico N', 750.00, 4, 14),
('Servico O', 'Descricao do Servico O', 800.00, 5, 15),
('Servico P', 'Descricao do Servico P', 850.00, 6, 16),
('Servico Q', 'Descricao do Servico Q', 900.00, 7, 17),
('Servico R', 'Descricao do Servico R', 950.00, 8, 18),
('Servico S', 'Descricao do Servico S', 1000.00, 9, 19),
('Servico T', 'Descricao do Servico T', 1050.00, 10, 20),
('Servico U', 'Descricao do Servico U', 1100.00, 1, 21),
('Servico V', 'Descricao do Servico V', 1150.00, 2, 22),
('Servico W', 'Descricao do Servico W', 1200.00, 3, 23),
('Servico X', 'Descricao do Servico X', 1250.00, 4, 24),
('Servico Y', 'Descricao do Servico Y', 1300.00, 5, 25),
('Servico Z', 'Descricao do Servico Z', 1350.00, 6, 26),
('Servico AA', 'Descricao do Servico AA', 1400.00, 7, 27),
('Servico BB', 'Descricao do Servico BB', 1450.00, 8, 28),
('Servico CC', 'Descricao do Servico CC', 1500.00, 9, 29),
('Servico DD', 'Descricao do Servico DD', 1550.00, 10, 30);
SELECT * FROM tb_servicos;

INSERT INTO tb_endereco_funcionario (estado, cidade, rua, numero, id_funcionario) VALUES
('DF', 'Brasília', 'Rua A', 101, 1),
('MG', 'Belo Horizonte', 'Rua B', 102, 2),
('GO', 'Goiânia', 'Rua C', 103, 3),
('DF', 'Brasília', 'Rua D', 104, 4),
('MG', 'Belo Horizonte', 'Rua E', 105, 5),
('GO', 'Goiânia', 'Rua F', 106, 6),
('DF', 'Brasília', 'Rua G', 107, 7),
('MG', 'Belo Horizonte', 'Rua H', 108, 8),
('GO', 'Goiânia', 'Rua I', 109, 9),
('DF', 'Brasília', 'Rua J', 110, 10);
SELECT * FROM tb_endereco_funcionario;

INSERT INTO tb_telefone_funcionario (numero, id_funcionario) VALUES
('61987654321', 1),
('61987654322', 2),
('61987654323', 3),
('61987654324', 4),
('61987654325', 5),
('61987654326', 6),
('61987654327', 7),
('61987654328', 8),
('61987654329', 9),
('61987654330', 10);
SELECT * FROM tb_telefone_funcionario;

INSERT INTO tb_pagamento (data_pagamento, metodo_pagamento, id_cliente, id_servico) VALUES
('2024-01-01', 'PIX', 1, 1),
('2024-01-02', 'Credito', 2, 2),
('2024-01-03', 'Debito', 3, 3),
('2024-01-04', 'Dinheiro', 4, 4),
('2024-01-05', 'PIX', 5, 5),
('2024-01-06', 'Credito', 6, 6),
('2024-01-07', 'Debito', 7, 7),
('2024-01-08', 'Dinheiro', 8, 8),
('2024-01-09', 'PIX', 9, 9),
('2024-01-10', 'Credito', 10, 10),
('2024-01-11', 'Debito', 11, 11),
('2024-01-12', 'Dinheiro', 12, 12),
('2024-01-13', 'PIX', 13, 13),
('2024-01-14', 'Credito', 14, 14),
('2024-01-15', 'Debito', 15, 15),
('2024-01-16', 'Dinheiro', 16, 16),
('2024-01-17', 'PIX', 17, 17),
('2024-01-18', 'Credito', 18, 18),
('2024-01-19', 'Debito', 19, 19),
('2024-01-20', 'Dinheiro', 20, 20),
('2024-01-21', 'PIX', 21, 21),
('2024-01-22', 'Credito', 22, 22),
('2024-01-23', 'Debito', 23, 23),
('2024-01-24', 'Dinheiro', 24, 24),
('2024-01-25', 'PIX', 25, 25),
('2024-01-26', 'Credito', 26, 26),
('2024-01-27', 'Debito', 27, 27),
('2024-01-28', 'Dinheiro', 28, 28),
('2024-01-29', 'PIX', 29, 29),
('2024-01-30', 'Credito', 30, 30);
SELECT * FROM tb_pagamento;

-- 1º Crie uma consulta SQL que forneça um relatório com os pagamentos realizados pelos clientes para os serviços, incluindo o nome do cliente, o nome do serviço, a data do pagamento e o método de pagamento.
SELECT c.nome AS nome_cliente, s.nome AS nome_servico, p.data_pagamento, p.metodo_pagamento
FROM tb_pagamento p JOIN tb_cliente c ON p.id_cliente = c.id_cliente
JOIN tb_servicos s ON p.id_servico = s.id_servico;
    
-- 2º Elabore uma consulta SQL para listar todos os fornecedores e as peças que eles fornecem, incluindo o nome do fornecedor, a peça e o preço.
SELECT f.nome AS nome_fornecedor, p.nome AS nome_peca, p.preco AS preco_peca
FROM tb_fornecedor f JOIN tb_pecas p ON f.id_fornecedor = p.id_fornecedor;
    
-- 3º Uma consulta SQL que forneça uma lista de todos os clientes e seus respectivos veículos, incluindo o modelo, a marca e a placa dos veículos.
SELECT c.nome AS nome_cliente, v.modelo AS modelo_veiculo, v.marca AS marca_veiculo, v.placa AS placa_veiculo
FROM tb_cliente c JOIN tb_veiculos v ON c.id_cliente = v.id_cliente;

-- 4º Objetivo: Encontrar quantas peças cada fornecedor forneceu.
SELECT f.nome AS fornecedor, COUNT(p.id_pecas) AS total_pecas
FROM tb_fornecedor f JOIN tb_pecas p ON f.id_fornecedor = p.id_fornecedor
GROUP BY f.id_fornecedor ORDER BY total_pecas DESC;

-- 5º Objetivo: Encontrar todos os clientes que possuem veículos de uma cor específica.
SELECT c.nome AS cliente, v.modelo AS veiculo, v.placa, v.cor
FROM tb_cliente c JOIN tb_veiculos v ON c.id_cliente = v.id_cliente
WHERE v.cor = 'Preto' ORDER BY c.nome;
    
-- 6º Objetivo: Listar o total de pagamentos realizados por cada cliente e o valor total gasto em serviços.
SELECT c.nome AS cliente, COUNT(p.id_pagamento) AS total_pagamentos, SUM(s.custo_mdo) AS total_gasto
FROM tb_cliente c JOIN tb_pagamento p ON c.id_cliente = p.id_cliente
JOIN tb_servicos s ON p.id_servico = s.id_servico
GROUP BY c.id_cliente ORDER BY total_gasto DESC;

-- 7º Realize uma consulta para mostrar o estado, cidade, rua e número do endereço de um cliente com o id_especifico.
SELECT estado, cidade, rua, numero 
FROM tb_endereco_cliente 
WHERE id_cliente = 5;

-- 8º Realize uma consulta que mostre o nome e o contato dos fornecedores que fornecem peças da categoria "Categoria A".
SELECT f.nome, f.contato
FROM tb_fornecedor f
JOIN tb_pecas p ON f.id_fornecedor = p.id_fornecedor
WHERE p.categoria = 'Categoria A';

-- 9º Realize uma consulta para mostrar os nomes dos clientes que possuem veículos de cor "Preto".
SELECT c.nome
FROM tb_cliente c
JOIN tb_veiculos v ON c.id_cliente = v.id_cliente;

-- 10 º Realize uma consulta que retorne todos os pagamentos realizados pelo cliente com id_cliente = 3, incluindo data do pagamento, método de pagamento e serviço prestado.
SELECT p.data_pagamento, p.metodo_pagamento, s.nome 
FROM tb_pagamento p
JOIN tb_servicos s ON p.id_servico = s.id_servico
WHERE p.id_cliente = 3;

-- 11º Mostrar uma lista de todos os clientes, juntamente com os modelos e as placas de seus veículos (caso possuam).
SELECT c.nome AS cliente_nome, v.modelo AS veiculo_modelo, v.placa AS veiculo_placa
FROM tb_cliente c
LEFT JOIN tb_veiculos v ON c.id_cliente = v.id_cliente;

-- 12 º Encontrar os fornecedores cujas peças têm preço médio superior a 800.
SELECT f.nome AS fornecedor_nome, AVG(p.preco) AS preco_medio
FROM tb_fornecedor f
JOIN tb_pecas p ON f.id_fornecedor = p.id_fornecedor
GROUP BY f.id_fornecedor
HAVING AVG(p.preco) > 800;

-- 13º Exibir todos os pagamentos realizados por cada cliente, incluindo o método de pagamento e o nome do serviço realizado.
SELECT c.nome AS cliente_nome, p.data_pagamento, p.metodo_pagamento, s.nome AS servico_nome
FROM tb_pagamento p
JOIN tb_cliente c ON p.id_cliente = c.id_cliente
JOIN tb_servicos s ON p.id_servico = s.id_servico;

-- 14º Listar os funcionários, juntamente com seus endereços e números de telefone.
SELECT f.nome AS funcionario_nome, e.estado AS endereco_estado, e.cidade AS endereco_cidade, e.rua AS endereco_rua, 
       e.numero AS endereco_numero, t.numero AS telefone_numero
FROM tb_funcionario f
JOIN tb_endereco_funcionario e ON f.id_funcionario = e.id_funcionario
JOIN tb_telefone_funcionario t ON f.id_funcionario = t.id_funcionario;

-- 15º Contabilizar quantos veículos cada cliente possui.
SELECT c.nome AS cliente_nome, COUNT(v.id_veiculo) AS quantidade_veiculos
FROM tb_cliente c
LEFT JOIN tb_veiculos v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente;



