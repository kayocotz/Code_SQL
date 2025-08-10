USE [CLIENTES]
GO

/****** Object:  StoredProcedure [dbo].[BuscarClientesPorEmail]    Script Date: 10/08/2025 10:47:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarClientesPorEmail]
    @Email VARCHAR(100)  
AS  
BEGIN  
    SELECT Nome, Email FROM Clientes WHERE Email = @Email  
END
GO


