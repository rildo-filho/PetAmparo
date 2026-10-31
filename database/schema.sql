-- Esquema conceitual inicial do PetAmparo
-- Será refinado e convertido em migrations do Django no PIE II.

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    perfil VARCHAR(20) NOT NULL,
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE animal (
    id_animal SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuario(id_usuario),
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(20) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    porte VARCHAR(20) NOT NULL,
    status VARCHAR(30) NOT NULL,
    data_resgate DATE NOT NULL,
    observacoes TEXT
);

CREATE TABLE adotante (
    id_adotante SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(120) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    aprovado BOOLEAN DEFAULT FALSE
);

CREATE TABLE adocao (
    id_adocao SERIAL PRIMARY KEY,
    id_animal INT NOT NULL REFERENCES animal(id_animal),
    id_adotante INT NOT NULL REFERENCES adotante(id_adotante),
    id_usuario INT NOT NULL REFERENCES usuario(id_usuario),
    data_solicitacao DATE NOT NULL,
    data_adocao DATE,
    status VARCHAR(30) NOT NULL,
    observacoes TEXT
);

CREATE TABLE doador (
    id_doador SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(120),
    telefone VARCHAR(20)
);

CREATE TABLE doacao (
    id_doacao SERIAL PRIMARY KEY,
    id_doador INT NOT NULL REFERENCES doador(id_doador),
    tipo VARCHAR(30) NOT NULL,
    valor DECIMAL(10,2),
    descricao TEXT NOT NULL,
    data_doacao DATE NOT NULL
);
