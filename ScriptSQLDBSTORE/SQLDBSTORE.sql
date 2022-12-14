USE [master]
GO
/****** Object:  Database [DBSTORE]    Script Date: 10/11/2022 3:42:37 p. m. ******/
CREATE DATABASE [DBSTORE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSTORE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBSTORE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBSTORE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBSTORE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBSTORE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSTORE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSTORE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSTORE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSTORE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSTORE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSTORE] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSTORE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBSTORE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSTORE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSTORE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSTORE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSTORE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSTORE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSTORE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSTORE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSTORE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBSTORE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSTORE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSTORE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSTORE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSTORE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSTORE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSTORE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSTORE] SET RECOVERY FULL 
GO
ALTER DATABASE [DBSTORE] SET  MULTI_USER 
GO
ALTER DATABASE [DBSTORE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSTORE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSTORE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSTORE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBSTORE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBSTORE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBSTORE', N'ON'
GO
ALTER DATABASE [DBSTORE] SET QUERY_STORE = OFF
GO
USE [DBSTORE]
GO
/****** Object:  Table [dbo].[CLIENTS]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTS](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[IdentityCard] [varchar](30) NULL,
	[NameClient] [varchar](60) NULL,
	[SurnameClient] [varchar](60) NULL,
	[Phone] [numeric](12, 0) NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[NameProduct] [varchar](60) NULL,
	[UnitPrice] [decimal](30, 7) NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALES]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALES](
	[IdSales] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NULL,
	[IdClient] [int] NULL,
	[Amount] [int] NULL,
	[UnitPrice] [decimal](30, 7) NULL,
	[TotalValue] [decimal](30, 7) NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTS] ON 

INSERT [dbo].[CLIENTS] ([IdClient], [IdentityCard], [NameClient], [SurnameClient], [Phone], [RegistrationDate]) VALUES (1, N'1002406557', N'Juan Pablo', N'Chaparro', CAST(3224158574 AS Numeric(12, 0)), CAST(N'2022-11-08T23:41:16.007' AS DateTime))
INSERT [dbo].[CLIENTS] ([IdClient], [IdentityCard], [NameClient], [SurnameClient], [Phone], [RegistrationDate]) VALUES (2, N'1000458787', N'Jhon Edison', N'Garcia Garcia', CAST(3224168097 AS Numeric(12, 0)), CAST(N'2022-11-08T23:41:44.433' AS DateTime))
INSERT [dbo].[CLIENTS] ([IdClient], [IdentityCard], [NameClient], [SurnameClient], [Phone], [RegistrationDate]) VALUES (3, N'52745857', N'Lina', N'Hernandez', CAST(3135687845 AS Numeric(12, 0)), CAST(N'2022-11-08T23:41:47.930' AS DateTime))
SET IDENTITY_INSERT [dbo].[CLIENTS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 

INSERT [dbo].[PRODUCTS] ([IdProduct], [NameProduct], [UnitPrice], [RegistrationDate]) VALUES (3, N'Agua BRISA', CAST(2000.0000000 AS Decimal(30, 7)), CAST(N'2022-11-03T10:12:44.580' AS DateTime))
INSERT [dbo].[PRODUCTS] ([IdProduct], [NameProduct], [UnitPrice], [RegistrationDate]) VALUES (4, N'Colgate', CAST(2500.0000000 AS Decimal(30, 7)), CAST(N'2022-11-03T10:12:44.580' AS DateTime))
INSERT [dbo].[PRODUCTS] ([IdProduct], [NameProduct], [UnitPrice], [RegistrationDate]) VALUES (5, N'Arroz ROA', CAST(3500.0000000 AS Decimal(30, 7)), CAST(N'2022-11-03T10:12:44.580' AS DateTime))
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
GO
SET IDENTITY_INSERT [dbo].[SALES] ON 

INSERT [dbo].[SALES] ([IdSales], [IdProduct], [IdClient], [Amount], [UnitPrice], [TotalValue], [RegistrationDate]) VALUES (4, 3, 1, 5, CAST(1000.0000000 AS Decimal(30, 7)), CAST(5000.0000000 AS Decimal(30, 7)), CAST(N'2022-11-09T15:03:03.983' AS DateTime))
INSERT [dbo].[SALES] ([IdSales], [IdProduct], [IdClient], [Amount], [UnitPrice], [TotalValue], [RegistrationDate]) VALUES (5, 3, 1, 5, CAST(1000.0000000 AS Decimal(30, 7)), CAST(5000.0000000 AS Decimal(30, 7)), CAST(N'2022-11-09T15:03:04.497' AS DateTime))
INSERT [dbo].[SALES] ([IdSales], [IdProduct], [IdClient], [Amount], [UnitPrice], [TotalValue], [RegistrationDate]) VALUES (6, 3, 1, 5, CAST(1000.0000000 AS Decimal(30, 7)), CAST(5000.0000000 AS Decimal(30, 7)), CAST(N'2022-11-09T15:03:04.623' AS DateTime))
INSERT [dbo].[SALES] ([IdSales], [IdProduct], [IdClient], [Amount], [UnitPrice], [TotalValue], [RegistrationDate]) VALUES (7, 4, 1, 7, CAST(1500.0000000 AS Decimal(30, 7)), CAST(10500.0000000 AS Decimal(30, 7)), CAST(N'2022-11-10T13:48:23.957' AS DateTime))
INSERT [dbo].[SALES] ([IdSales], [IdProduct], [IdClient], [Amount], [UnitPrice], [TotalValue], [RegistrationDate]) VALUES (8, 3, 2, 7, CAST(2000.0000000 AS Decimal(30, 7)), CAST(14000.0000000 AS Decimal(30, 7)), CAST(N'2022-11-10T14:34:38.497' AS DateTime))
INSERT [dbo].[SALES] ([IdSales], [IdProduct], [IdClient], [Amount], [UnitPrice], [TotalValue], [RegistrationDate]) VALUES (9, 3, 1, 3, CAST(2000.0000000 AS Decimal(30, 7)), CAST(6000.0000000 AS Decimal(30, 7)), CAST(N'2022-11-10T15:02:01.243' AS DateTime))
SET IDENTITY_INSERT [dbo].[SALES] OFF
GO
ALTER TABLE [dbo].[CLIENTS] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[PRODUCTS] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[SALES] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[SALES]  WITH CHECK ADD  CONSTRAINT [fk_client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[CLIENTS] ([IdClient])
GO
ALTER TABLE [dbo].[SALES] CHECK CONSTRAINT [fk_client]
GO
ALTER TABLE [dbo].[SALES]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[PRODUCTS] ([IdProduct])
GO
ALTER TABLE [dbo].[SALES] CHECK CONSTRAINT [fk_product]
GO
/****** Object:  StoredProcedure [dbo].[usp_delete_client]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_delete_client](
@IdClient int
)
as
begin

delete from CLIENTS where IdClient = @IdClient

end

GO
/****** Object:  StoredProcedure [dbo].[usp_delete_product]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_delete_product](
@IdProduct int
)
as
begin

delete from PRODUCTS where IdProduct = @IdProduct

end

GO
/****** Object:  StoredProcedure [dbo].[usp_get_client]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_get_client](@IdClient int)
as
begin

select * from CLIENTS where IdClient = @IdClient
end

GO
/****** Object:  StoredProcedure [dbo].[usp_get_product]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_get_product](@IdProduct int)
as
begin

select * from PRODUCTS where IdProduct = @IdProduct
end

GO
/****** Object:  StoredProcedure [dbo].[usp_list_client]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_list_client]
as
begin

select * from CLIENTS
end


GO
/****** Object:  StoredProcedure [dbo].[usp_list_product]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_list_product]
as
begin

select * from PRODUCTS
end


GO
/****** Object:  StoredProcedure [dbo].[usp_list_shopping]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_list_shopping](
	@IdClient int
)
as
begin

select sal.IdProduct, pro.NameProduct, sum(sal.Amount) as TotalAmount, sal.UnitPrice, sum(sal.TotalValue) as TotalValue
from CLIENTS cl
inner join SALES sal on sal.IdClient = cl.IdClient
inner join PRODUCTS pro on pro.IdProduct = sal.IdProduct
where cl.IdClient = @IdClient group by sal.IdProduct, pro.NameProduct, sal.UnitPrice

end
GO
/****** Object:  StoredProcedure [dbo].[usp_modify_client]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_modify_client](
@IdClient int,
@IdentityCard bigint,
@NameClient varchar(60),
@SurnameClient varchar(60),
@Phone varchar(15)
)
as
begin

update CLIENTS set 
IdentityCard = @IdentityCard,
NameClient = @NameClient,
SurnameClient = @SurnameClient,
Phone = @Phone
where IdClient = @IdClient

end

GO
/****** Object:  StoredProcedure [dbo].[usp_modify_product]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_modify_product](
@IdProduct int,
@NameProduct varchar(60),
@UnitPrice decimal(30,7)
)
as
begin

update PRODUCTS set 
NameProduct = @NameProduct,
UnitPrice = @UnitPrice
where IdProduct = @IdProduct

end

GO
/****** Object:  StoredProcedure [dbo].[usp_register_client]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_register_client](
@IdentityCard bigint,
@NameClient varchar(60),
@SurnameClient varchar(60),
@Phone varchar(15)
)
as
begin

insert into CLIENTS(IdentityCard,NameClient,SurnameClient,Phone)
values
(
@IdentityCard,
@NameClient,
@SurnameClient,
@Phone
)

end


GO
/****** Object:  StoredProcedure [dbo].[usp_register_product]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_register_product](
@NameProduct varchar(60),
@UnitPrice decimal(30,7)
)
as
begin

insert into PRODUCTS(NameProduct,UnitPrice)
values
(
@NameProduct,
@UnitPrice
)

end


GO
/****** Object:  StoredProcedure [dbo].[usp_register_shopping]    Script Date: 10/11/2022 3:42:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--************************ PROCEDIMIENTOS PARA CREAR ************************--
create procedure [dbo].[usp_register_shopping](
	@IdProduct int,
	@IdClient int,
	@Amount int
)
as
begin

declare @Price decimal(30,7) = (select top 1 UnitPrice from PRODUCTS where IdProduct = @IdProduct)
declare @TotalValue decimal(30,7) = (@Price * @Amount)

insert into SALES (IdProduct, IdClient, Amount, UnitPrice, TotalValue)
values (
	@IdProduct,
	@IdClient,
	@Amount,
	@Price,
	@TotalValue
)

end




GO
USE [master]
GO
ALTER DATABASE [DBSTORE] SET  READ_WRITE 
GO
