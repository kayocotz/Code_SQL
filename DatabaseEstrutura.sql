--Criar DATABASE
CREATE DATABASE CLIENTES
GO
-- Criar tabela de Clientes
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataCadastro DATETIME DEFAULT GETDATE()
);

-- Criar tabela de Endereços
CREATE TABLE Enderecos (
    EnderecoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    Logradouro VARCHAR(150) NOT NULL,
    Numero VARCHAR(10) NULL,
    Bairro VARCHAR(100) NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    TipoEndereco VARCHAR(50) CHECK (TipoEndereco IN ('Residencial', 'Comercial', 'Outro')) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID) ON DELETE CASCADE
);
-- Criar tabela de Telefones
CREATE TABLE Telefones (
    TelefoneID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    DDD CHAR(2) NOT NULL,
    Numero NVARCHAR(10) NOT NULL,
    TipoTelefone NVARCHAR(20) CHECK (TipoTelefone IN ('Celular', 'Residencial', 'Trabalho')) NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID) ON DELETE CASCADE
);