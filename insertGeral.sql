-- Inserindo 10 clientes
INSERT INTO Clientes (Nome, Email, Telefone)
VALUES 
    ('João Silva', 'joao.silva@email.com', '(11) 98765-4321'),
    ('Maria Oliveira', 'maria.oliveira@email.com', '(21) 98876-5432'),
    ('Carlos Santos', 'carlos.santos@email.com', '(31) 99987-6543'),
    ('Ana Costa', 'ana.costa@email.com', '(41) 98712-3456'),
    ('Fernando Lima', 'fernando.lima@email.com', '(51) 98123-4567'),
    ('Juliana Mendes', 'juliana.mendes@email.com', '(61) 99654-3210'),
    ('Roberto Farias', 'roberto.farias@email.com', '(71) 99876-2345'),
    ('Patrícia Souza', 'patricia.souza@email.com', '(81) 98765-7890'),
    ('Gustavo Nunes', 'gustavo.nunes@email.com', '(91) 99999-9999'),
    ('Carla Ribeiro', 'carla.ribeiro@email.com', '(95) 98888-8888');

-- Inserindo 10 endereços associados aos clientes
INSERT INTO Enderecos (ClienteID, Logradouro, Numero, Bairro, Cidade, Estado, CEP, TipoEndereco)
VALUES 
    (1, 'Rua das Flores', '123', 'Centro', 'São Paulo', 'SP', '01010-000', 'Residencial'),
    (2, 'Av. Brasil', '456', 'Copacabana', 'Rio de Janeiro', 'RJ', '22041-001', 'Residencial'),
    (3, 'Rua Minas Gerais', '789', 'Savassi', 'Belo Horizonte', 'MG', '30112-000', 'Comercial'),
    (4, 'Rua XV de Novembro', '321', 'Centro', 'Curitiba', 'PR', '80010-000', 'Residencial'),
    (5, 'Avenida Ipiranga', '111', 'Centro Histórico', 'Porto Alegre', 'RS', '90010-000', 'Comercial'),
    (6, 'Rua das Palmeiras', '222', 'Asa Sul', 'Brasília', 'DF', '70297-400', 'Residencial'),
    (7, 'Alameda Santos', '333', 'Jardins', 'São Paulo', 'SP', '01419-001', 'Comercial'),
    (8, 'Rua Boa Viagem', '444', 'Boa Viagem', 'Recife', 'PE', '51020-000', 'Residencial'),
    (9, 'Av. Nazaré', '555', 'Marco', 'Belém', 'PA', '66060-000', 'Residencial'),
    (10, 'Rua das Andorinhas', '666', 'Centro', 'Boa Vista', 'RR', '69301-000', 'Comercial');
-- Cliente 2 (Maria Oliveira) - 6 telefones
INSERT INTO Telefones (ClienteID, DDD, Numero, TipoTelefone)
VALUES
    (2, '21', '988765432', 'Celular'),
    (2, '21', '32324567', 'Trabalho'),
    (2, '21', '40041234', 'Trabalho'),
    (2, '21', '22331122', 'Residencial'),
    (2, '21', '966554433', 'Celular'),
    (2, '21', '977665544', 'Celular');

-- Cliente 5 (Fernando Lima) - 7 telefones
INSERT INTO Telefones (ClienteID, DDD, Numero, TipoTelefone)
VALUES
    (5, '51', '981234567', 'Celular'),
    (5, '51', '33221144', 'Residencial'),
    (5, '51', '40025555', 'Trabalho'),
    (5, '51', '988877766', 'Celular'),
    (5, '51', '966332211', 'Trabalho'),
    (5, '51', '933221144', 'Residencial'),
    (5, '51', '955443322', 'Celular');

-- Cliente 8 (Patrícia Souza) - 6 telefones
INSERT INTO Telefones (ClienteID, DDD, Numero, TipoTelefone)
VALUES
    (8, '81', '987657890', 'Celular'),
    (8, '81', '40028922', 'Trabalho'),
    (8, '81', '31115678', 'Residencial'),
    (8, '81', '955667788', 'Celular'),
    (8, '81', '922334455', 'Trabalho'),
    (8, '81', '911223344', 'Residencial');