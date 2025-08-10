SET NOCOUNT ON;

DECLARE @i INT = 1;

WHILE @i <= 1000
BEGIN
    INSERT INTO Clientes (Nome, Email) 
    VALUES 
    (
        CONCAT('Cliente ', @i),  -- Nome dinâmico
        CONCAT('cliente', @i, '@email.com') -- Garante que todos os clientes tenham email
    );

    SET @i = @i + 1;
END;