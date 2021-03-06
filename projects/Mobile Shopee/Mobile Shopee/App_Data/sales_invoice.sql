/****** Object:  ForeignKey [FK_BillDetails_SaleMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BillDetails_SaleMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[BillDetails]'))
ALTER TABLE [dbo].[BillDetails] DROP CONSTRAINT [FK_BillDetails_SaleMaster]
GO
/****** Object:  ForeignKey [FK_ItemDetails_ItemMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemDetails_ItemMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemDetails]'))
ALTER TABLE [dbo].[ItemDetails] DROP CONSTRAINT [FK_ItemDetails_ItemMaster]
GO
/****** Object:  ForeignKey [FK_ItemDetails_ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemDetails_ModelMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemDetails]'))
ALTER TABLE [dbo].[ItemDetails] DROP CONSTRAINT [FK_ItemDetails_ModelMaster]
GO
/****** Object:  ForeignKey [FK_PurchaseDetails_ItemMaster1]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseDetails_ItemMaster1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]'))
ALTER TABLE [dbo].[PurchaseDetails] DROP CONSTRAINT [FK_PurchaseDetails_ItemMaster1]
GO
/****** Object:  ForeignKey [FK_PurchaseDetails_ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseDetails_ModelMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]'))
ALTER TABLE [dbo].[PurchaseDetails] DROP CONSTRAINT [FK_PurchaseDetails_ModelMaster]
GO
/****** Object:  ForeignKey [FK_PurchaseDetails_PurchaseMaster1]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseDetails_PurchaseMaster1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]'))
ALTER TABLE [dbo].[PurchaseDetails] DROP CONSTRAINT [FK_PurchaseDetails_PurchaseMaster1]
GO
/****** Object:  ForeignKey [FK_PurchaseMaster_SupplierMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseMaster_SupplierMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseMaster]'))
ALTER TABLE [dbo].[PurchaseMaster] DROP CONSTRAINT [FK_PurchaseMaster_SupplierMaster]
GO
/****** Object:  ForeignKey [FK_SaleDetails_ItemMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleDetails_ItemMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleDetails]'))
ALTER TABLE [dbo].[SaleDetails] DROP CONSTRAINT [FK_SaleDetails_ItemMaster]
GO
/****** Object:  ForeignKey [FK_SaleDetails_ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleDetails_ModelMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleDetails]'))
ALTER TABLE [dbo].[SaleDetails] DROP CONSTRAINT [FK_SaleDetails_ModelMaster]
GO
/****** Object:  ForeignKey [FK_SaleDetails_SaleMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleDetails_SaleMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleDetails]'))
ALTER TABLE [dbo].[SaleDetails] DROP CONSTRAINT [FK_SaleDetails_SaleMaster]
GO
/****** Object:  ForeignKey [FK_SaleMaster_CustomerMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleMaster_CustomerMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleMaster]'))
ALTER TABLE [dbo].[SaleMaster] DROP CONSTRAINT [FK_SaleMaster_CustomerMaster]
GO
/****** Object:  Table [dbo].[BillDetails]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillDetails]') AND type in (N'U'))
DROP TABLE [dbo].[BillDetails]
GO
/****** Object:  Table [dbo].[SaleDetails]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleDetails]') AND type in (N'U'))
DROP TABLE [dbo].[SaleDetails]
GO
/****** Object:  Table [dbo].[SaleMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleMaster]') AND type in (N'U'))
DROP TABLE [dbo].[SaleMaster]
GO
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]') AND type in (N'U'))
DROP TABLE [dbo].[PurchaseDetails]
GO
/****** Object:  Table [dbo].[PurchaseMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseMaster]') AND type in (N'U'))
DROP TABLE [dbo].[PurchaseMaster]
GO
/****** Object:  Table [dbo].[ItemDetails]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemDetails]') AND type in (N'U'))
DROP TABLE [dbo].[ItemDetails]
GO
/****** Object:  Table [dbo].[SupplierMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SupplierMaster]') AND type in (N'U'))
DROP TABLE [dbo].[SupplierMaster]
GO
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminLogin]') AND type in (N'U'))
DROP TABLE [dbo].[AdminLogin]
GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerMaster]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerMaster]
GO
/****** Object:  Table [dbo].[MobileDesc]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MobileDesc]') AND type in (N'U'))
DROP TABLE [dbo].[MobileDesc]
GO
/****** Object:  Table [dbo].[ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelMaster]') AND type in (N'U'))
DROP TABLE [dbo].[ModelMaster]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemMaster]') AND type in (N'U'))
DROP TABLE [dbo].[ItemMaster]
GO
/****** Object:  Table [dbo].[ItemMaster]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemMaster](
	[ItemNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_ItemMaster] PRIMARY KEY CLUSTERED 
(
	[ItemNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I001', N'Nokia')
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I002', N'Samsung')
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I003', N'Sony Ericssion')
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I004', N'Reliance')
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I005', N'Nokia Music express')
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I006', N'Smart')
INSERT [dbo].[ItemMaster] ([ItemNo], [ItemName]) VALUES (N'I007', N'Tata Indicom')
/****** Object:  Table [dbo].[ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModelMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ModelMaster](
	[ModelId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ModelName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_model] PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[ModelMaster] ([ModelId], [ModelName]) VALUES (N'M001', N'Z550i')
INSERT [dbo].[ModelMaster] ([ModelId], [ModelName]) VALUES (N'M002', N'N 20')
/****** Object:  Table [dbo].[MobileDesc]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MobileDesc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MobileDesc](
	[MNo] [int] IDENTITY(1,1) NOT NULL,
	[MobileName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Model] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price] [numeric](18, 2) NULL,
	[BatteryBackup] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InternalMemory] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalMemory] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[BlueTooth] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[InfraRed] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Guarantee] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_MobileDesc] PRIMARY KEY CLUSTERED 
(
	[MNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[MobileDesc] ON
INSERT [dbo].[MobileDesc] ([MNo], [MobileName], [Model], [Price], [BatteryBackup], [InternalMemory], [ExternalMemory], [BlueTooth], [InfraRed], [Guarantee]) VALUES (1, N'Nokia', N'N36', CAST(10000.00 AS Numeric(18, 2)), N'6 Hours', N'512 MB', N'2 GB', N'Yes', N'Yes', N'2 Years')
INSERT [dbo].[MobileDesc] ([MNo], [MobileName], [Model], [Price], [BatteryBackup], [InternalMemory], [ExternalMemory], [BlueTooth], [InfraRed], [Guarantee]) VALUES (2, N'Nokia', N'N46', CAST(8000.00 AS Numeric(18, 2)), N'5 Hours', N'512 MB', N'1 GB', N'Yes', N'No', N'2 Years')
INSERT [dbo].[MobileDesc] ([MNo], [MobileName], [Model], [Price], [BatteryBackup], [InternalMemory], [ExternalMemory], [BlueTooth], [InfraRed], [Guarantee]) VALUES (3, N'Sony Ericission', N'Z550i', CAST(8000.00 AS Numeric(18, 2)), N'3 Hours', N'1 GB', N'3 GB', N'No', N'No', N'3 Years')
SET IDENTITY_INSERT [dbo].[MobileDesc] OFF
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerMaster](
	[CustNo] [int] NOT NULL,
	[CustName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobNo] [numeric](10, 0) NULL,
 CONSTRAINT [PK_customer_master] PRIMARY KEY CLUSTERED 
(
	[CustNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[CustomerMaster] ([CustNo], [CustName], [Address], [State], [City], [MobNo]) VALUES (1, N'Sujeet', N'sss', N'sdfsfs', N'fsdfsf', CAST(5345353535 AS Numeric(10, 0)))
/****** Object:  Table [dbo].[AdminLogin]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AdminLogin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AdminLogin](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Password] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
END
GO
INSERT [dbo].[AdminLogin] ([UserId], [UserName], [Password]) VALUES (1, N'admin', N'admin')
INSERT [dbo].[AdminLogin] ([UserId], [UserName], [Password]) VALUES (2, N'anshu', N'ignou')
/****** Object:  Table [dbo].[SupplierMaster]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SupplierMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SupplierMaster](
	[SupplierCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SupplierName] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Address] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[City] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MobNo] [numeric](18, 0) NULL,
	[Fax] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Email] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_vendor_master] PRIMARY KEY CLUSTERED 
(
	[SupplierCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[SupplierMaster] ([SupplierCode], [SupplierName], [Address], [City], [State], [MobNo], [Fax], [Email]) VALUES (N'SUP001', N'Rajesh Gupta', N'Maango', N'Jamshedpur', N'Jharkhand', CAST(9570456324 AS Numeric(18, 0)), N'674555', N'rajesh@yahoo.com')
/****** Object:  Table [dbo].[ItemDetails]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ItemDetails](
	[ItemNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ModelId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ReorderQty] [int] NULL,
	[TotalQtyPurchase] [int] NULL,
	[TotalQtySale] [int] NULL,
	[CostRate] [numeric](18, 2) NULL,
	[SaleRate] [numeric](18, 2) NULL,
	[StockInHand] [int] NULL
)
END
GO
INSERT [dbo].[ItemDetails] ([ItemNo], [ModelId], [ReorderQty], [TotalQtyPurchase], [TotalQtySale], [CostRate], [SaleRate], [StockInHand]) VALUES (N'I002', N'M002', 1, 2, 0, CAST(4567.00 AS Numeric(18, 2)), CAST(5000.00 AS Numeric(18, 2)), 2)
INSERT [dbo].[ItemDetails] ([ItemNo], [ModelId], [ReorderQty], [TotalQtyPurchase], [TotalQtySale], [CostRate], [SaleRate], [StockInHand]) VALUES (N'I004', N'M001', 2, 3, 2, CAST(3000.00 AS Numeric(18, 2)), CAST(4000.00 AS Numeric(18, 2)), 1)
/****** Object:  Table [dbo].[PurchaseMaster]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseMaster](
	[PurOrdNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PurOrdDate] [datetime] NULL,
	[SupplierCode] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_PurchaseMaster] PRIMARY KEY CLUSTERED 
(
	[PurOrdNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[PurchaseMaster] ([PurOrdNo], [PurOrdDate], [SupplierCode]) VALUES (N'P001', CAST(0x00009F4A00000000 AS DateTime), N'SUP001')
/****** Object:  Table [dbo].[PurchaseDetails]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PurchaseDetails](
	[SlNo] [int] NOT NULL,
	[PurOrdNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ModelId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Qty] [int] NULL,
	[Rate] [numeric](18, 2) NULL,
	[Amount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_PurchaseDetails] PRIMARY KEY CLUSTERED 
(
	[SlNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[PurchaseDetails] ([SlNo], [PurOrdNo], [ItemNo], [ModelId], [Qty], [Rate], [Amount]) VALUES (1, N'P001', N'I002', N'M002', 2, CAST(4567.00 AS Numeric(18, 2)), CAST(9134.00 AS Numeric(18, 2)))
INSERT [dbo].[PurchaseDetails] ([SlNo], [PurOrdNo], [ItemNo], [ModelId], [Qty], [Rate], [Amount]) VALUES (2, N'P001', N'I004', N'M001', 3, CAST(3000.00 AS Numeric(18, 2)), CAST(9000.00 AS Numeric(18, 2)))
/****** Object:  Table [dbo].[SaleMaster]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleMaster]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SaleMaster](
	[ChallanNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ChallanDate] [datetime] NULL,
	[CustNo] [int] NOT NULL,
 CONSTRAINT [PK_SaleMaster_1] PRIMARY KEY CLUSTERED 
(
	[ChallanNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[SaleMaster] ([ChallanNo], [ChallanDate], [CustNo]) VALUES (N'CH001', CAST(0x00009F4200000000 AS DateTime), 1)
/****** Object:  Table [dbo].[SaleDetails]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaleDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SaleDetails](
	[SlNo] [int] NOT NULL,
	[ChallanNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ItemNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ModelId] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Qty] [int] NULL,
	[Rate] [numeric](18, 2) NULL,
	[Amount] [numeric](18, 2) NULL,
 CONSTRAINT [PK_SaleDetails] PRIMARY KEY CLUSTERED 
(
	[SlNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[SaleDetails] ([SlNo], [ChallanNo], [ItemNo], [ModelId], [Qty], [Rate], [Amount]) VALUES (1, N'CH001', N'I004', N'M001', 1, CAST(4000.00 AS Numeric(18, 2)), CAST(4000.00 AS Numeric(18, 2)))
INSERT [dbo].[SaleDetails] ([SlNo], [ChallanNo], [ItemNo], [ModelId], [Qty], [Rate], [Amount]) VALUES (2, N'CH001', N'I004', N'M001', 1, CAST(4000.00 AS Numeric(18, 2)), CAST(4000.00 AS Numeric(18, 2)))
/****** Object:  Table [dbo].[BillDetails]    Script Date: 08/15/2011 19:57:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BillDetails](
	[BillNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BillDate] [datetime] NULL,
	[ChallanNo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_BillDetails] PRIMARY KEY CLUSTERED 
(
	[BillNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[BillDetails] ([BillNo], [BillDate], [ChallanNo]) VALUES (N'BL20118001', CAST(0x00009F4000000000 AS DateTime), N'CH001')
/****** Object:  ForeignKey [FK_BillDetails_SaleMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BillDetails_SaleMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[BillDetails]'))
ALTER TABLE [dbo].[BillDetails]  WITH CHECK ADD  CONSTRAINT [FK_BillDetails_SaleMaster] FOREIGN KEY([ChallanNo])
REFERENCES [dbo].[SaleMaster] ([ChallanNo])
GO
ALTER TABLE [dbo].[BillDetails] CHECK CONSTRAINT [FK_BillDetails_SaleMaster]
GO
/****** Object:  ForeignKey [FK_ItemDetails_ItemMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemDetails_ItemMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemDetails]'))
ALTER TABLE [dbo].[ItemDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemDetails_ItemMaster] FOREIGN KEY([ItemNo])
REFERENCES [dbo].[ItemMaster] ([ItemNo])
GO
ALTER TABLE [dbo].[ItemDetails] CHECK CONSTRAINT [FK_ItemDetails_ItemMaster]
GO
/****** Object:  ForeignKey [FK_ItemDetails_ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ItemDetails_ModelMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[ItemDetails]'))
ALTER TABLE [dbo].[ItemDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemDetails_ModelMaster] FOREIGN KEY([ModelId])
REFERENCES [dbo].[ModelMaster] ([ModelId])
GO
ALTER TABLE [dbo].[ItemDetails] CHECK CONSTRAINT [FK_ItemDetails_ModelMaster]
GO
/****** Object:  ForeignKey [FK_PurchaseDetails_ItemMaster1]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseDetails_ItemMaster1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]'))
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_ItemMaster1] FOREIGN KEY([ItemNo])
REFERENCES [dbo].[ItemMaster] ([ItemNo])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_ItemMaster1]
GO
/****** Object:  ForeignKey [FK_PurchaseDetails_ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseDetails_ModelMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]'))
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_ModelMaster] FOREIGN KEY([ModelId])
REFERENCES [dbo].[ModelMaster] ([ModelId])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_ModelMaster]
GO
/****** Object:  ForeignKey [FK_PurchaseDetails_PurchaseMaster1]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseDetails_PurchaseMaster1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseDetails]'))
ALTER TABLE [dbo].[PurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseDetails_PurchaseMaster1] FOREIGN KEY([PurOrdNo])
REFERENCES [dbo].[PurchaseMaster] ([PurOrdNo])
GO
ALTER TABLE [dbo].[PurchaseDetails] CHECK CONSTRAINT [FK_PurchaseDetails_PurchaseMaster1]
GO
/****** Object:  ForeignKey [FK_PurchaseMaster_SupplierMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseMaster_SupplierMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[PurchaseMaster]'))
ALTER TABLE [dbo].[PurchaseMaster]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseMaster_SupplierMaster] FOREIGN KEY([SupplierCode])
REFERENCES [dbo].[SupplierMaster] ([SupplierCode])
GO
ALTER TABLE [dbo].[PurchaseMaster] CHECK CONSTRAINT [FK_PurchaseMaster_SupplierMaster]
GO
/****** Object:  ForeignKey [FK_SaleDetails_ItemMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleDetails_ItemMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleDetails]'))
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetails_ItemMaster] FOREIGN KEY([ItemNo])
REFERENCES [dbo].[ItemMaster] ([ItemNo])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [FK_SaleDetails_ItemMaster]
GO
/****** Object:  ForeignKey [FK_SaleDetails_ModelMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleDetails_ModelMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleDetails]'))
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetails_ModelMaster] FOREIGN KEY([ModelId])
REFERENCES [dbo].[ModelMaster] ([ModelId])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [FK_SaleDetails_ModelMaster]
GO
/****** Object:  ForeignKey [FK_SaleDetails_SaleMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleDetails_SaleMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleDetails]'))
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [FK_SaleDetails_SaleMaster] FOREIGN KEY([ChallanNo])
REFERENCES [dbo].[SaleMaster] ([ChallanNo])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [FK_SaleDetails_SaleMaster]
GO
/****** Object:  ForeignKey [FK_SaleMaster_CustomerMaster]    Script Date: 08/15/2011 19:57:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SaleMaster_CustomerMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[SaleMaster]'))
ALTER TABLE [dbo].[SaleMaster]  WITH CHECK ADD  CONSTRAINT [FK_SaleMaster_CustomerMaster] FOREIGN KEY([CustNo])
REFERENCES [dbo].[CustomerMaster] ([CustNo])
GO
ALTER TABLE [dbo].[SaleMaster] CHECK CONSTRAINT [FK_SaleMaster_CustomerMaster]
GO
