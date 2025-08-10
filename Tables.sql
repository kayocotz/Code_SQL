
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[Email] [varchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[Telefone] [varchar](20) COLLATE Latin1_General_CI_AS NULL,
	[DataCadastro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Clientes__DataCa__36B12243]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Clientes] ADD  DEFAULT (getdate()) FOR [DataCadastro]
END

GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Enderecos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Enderecos](
	[EnderecoID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[Logradouro] [varchar](150) COLLATE Latin1_General_CI_AS NOT NULL,
	[Numero] [varchar](10) COLLATE Latin1_General_CI_AS NULL,
	[Bairro] [varchar](100) COLLATE Latin1_General_CI_AS NULL,
	[Cidade] [varchar](100) COLLATE Latin1_General_CI_AS NOT NULL,
	[Estado] [varchar](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[CEP] [varchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
	[TipoEndereco] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EnderecoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Enderecos__Clien__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enderecos]'))
ALTER TABLE [dbo].[Enderecos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
ON DELETE CASCADE
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Enderecos__TipoE__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[Enderecos]'))
ALTER TABLE [dbo].[Enderecos]  WITH CHECK ADD CHECK  (([TipoEndereco]='Outro' OR [TipoEndereco]='Comercial' OR [TipoEndereco]='Residencial'))
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pedidos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Pedidos](
	[ID_Pedido] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[Produto] [nvarchar](100) COLLATE Latin1_General_CI_AS NULL,
	[DataPedido] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Pedidos__Cliente__656C112C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Pedidos]'))
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Telefones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Telefones](
	[TelefoneID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[DDD] [char](2) COLLATE Latin1_General_CI_AS NOT NULL,
	[Numero] [nvarchar](10) COLLATE Latin1_General_CI_AS NOT NULL,
	[TipoTelefone] [nvarchar](20) COLLATE Latin1_General_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TelefoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Telefones__Clien__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Telefones]'))
ALTER TABLE [dbo].[Telefones]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
ON DELETE CASCADE
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__Telefones__TipoT__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Telefones]'))
ALTER TABLE [dbo].[Telefones]  WITH CHECK ADD CHECK  (([TipoTelefone]='Trabalho' OR [TipoTelefone]='Residencial' OR [TipoTelefone]='Celular'))
GO

