SET NOCOUNT ON;

DECLARE @i INT = 1;
DECLARE @ClienteID INT;
DECLARE @DDD INT;
DECLARE @Numero BIGINT;
DECLARE @TipoTelefone NVARCHAR(20);

-- Loop para inserir mais de 5000 telefones
WHILE @i <= 5000
BEGIN
    -- Seleciona um ClienteID aleatório existente na tabela Clientes
    SELECT TOP 1 @ClienteID = ClienteID 
    FROM Clientes 
    ORDER BY NEWID();  -- NEWID() garante que o ID seja aleatório e existente
    
    -- Gera um DDD aleatório entre 11 e 90
    SET @DDD = FLOOR(RAND() * 80) + 11;
    
    -- Gera um número de telefone aleatório
    SET @Numero = FLOOR(RAND() * 900000000 + 100000000);
    
    -- Define um tipo de telefone aleatório
    SET @TipoTelefone = 
        CASE FLOOR(RAND() * 3) 
            WHEN 0 THEN 'Celular' 
            WHEN 1 THEN 'Trabalho' 
            ELSE 'Residencial' 
        END;

    -- Insere o telefone na tabela Telefones
    INSERT INTO Telefones (ClienteID, DDD, Numero, TipoTelefone)
    VALUES (@ClienteID, @DDD, @Numero, @TipoTelefone);

    -- Incrementa o contador
    SET @i = @i + 1;
END;