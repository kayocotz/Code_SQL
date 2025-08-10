CREATE TRIGGER trg_Endereco_Insert_Telefone
ON dbo.Enderecos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Telefones (ClienteID,DDD, Numero)
    SELECT i.ClienteID,'00', '9999-9999'
    FROM inserted i
    WHERE NOT EXISTS (
        SELECT 1
        FROM dbo.Telefones t
        WHERE t.ClienteID = i.ClienteID
          AND t.Numero = '9999-9999'
    );
END;
GO