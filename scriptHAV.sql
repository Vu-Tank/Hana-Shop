USE [master]
GO
/****** Object:  Database [Assignment_HuynhAnhVu]    Script Date: 1/19/2021 5:50:15 PM ******/
CREATE DATABASE [Assignment_HuynhAnhVu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_HuynhAnhVu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment_HuynhAnhVu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_HuynhAnhVu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment_HuynhAnhVu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_HuynhAnhVu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET QUERY_STORE = OFF
GO
USE [Assignment_HuynhAnhVu]
GO
/****** Object:  Table [dbo].[tblCategorys]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategorys](
	[categoryID] [varchar](10) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](20) NULL,
	[paymentID] [varchar](10) NULL,
	[orderDate] [datetime] NOT NULL,
	[totalPrice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPayments]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayments](
	[paymentID] [varchar](10) NOT NULL,
	[payName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](500) NOT NULL,
	[categoryID] [varchar](10) NULL,
	[description] [varchar](1000) NOT NULL,
	[imageName] [varchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[createDate] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblrecordUpdate]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblrecordUpdate](
	[recordID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](20) NULL,
	[productID] [int] NULL,
	[recordDate] [datetime] NOT NULL,
	[note] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[recordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 1/19/2021 5:50:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](20) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[roleID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'CD', N'Candy')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'DK', N'Drink')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'FD', N'Food')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentID], [orderDate], [totalPrice]) VALUES (1, N'user01', N'COD', CAST(N'2021-01-19T16:50:56.000' AS DateTime), 1212000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentID], [orderDate], [totalPrice]) VALUES (2, N'user01', N'COD', CAST(N'2021-01-19T16:51:38.000' AS DateTime), 45000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentID], [orderDate], [totalPrice]) VALUES (3, N'hanhvu0978', N'COD', CAST(N'2021-01-19T16:58:47.000' AS DateTime), 486000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [paymentID], [orderDate], [totalPrice]) VALUES (4, N'hanhvu0978', N'PayPal', CAST(N'2021-01-19T17:00:02.000' AS DateTime), 166500)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1, 1, 1, 11, 100000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (2, 1, 2, 1, 10000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (3, 1, 3, 1, 17000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (4, 1, 15, 1, 25000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (5, 1, 9, 2, 30000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (6, 2, 16, 3, 15000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (7, 3, 1, 1, 100000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (8, 3, 23, 1, 7000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (9, 3, 5, 12, 30000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (10, 3, 20, 1, 19000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (11, 4, 11, 1, 12500)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (12, 4, 1, 1, 100000)
INSERT [dbo].[tblOrderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (13, 4, 18, 1, 54000)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
INSERT [dbo].[tblPayments] ([paymentID], [payName]) VALUES (N'COD', N'Cash on delivery')
INSERT [dbo].[tblPayments] ([paymentID], [payName]) VALUES (N'PayPal', N'Via paypal')
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (1, N'Custas', N'FD', N'The Orion Egg Cream custas is a popular sponge cake with its delicious flavor from the crust to the sweet, soft and rich egg cream made from fresh eggs.', N'1.jpg', 110000, CAST(N'2021-01-14' AS Date), 98799999, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (2, N'Migita ginger candy', N'CD', N'Perfectly combines the sweetness of sugar and the spicy taste of fresh ginger, creating delicious candies, especially suitable on cold days.', N'2.jpg', 10000, CAST(N'2021-01-14' AS Date), 999, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (3, N'Migita mint candy', N'CD', N'The cool mint flavor is refreshing to enjoy. The product does not contain added sugar and preservatives.', N'3.jpg', 17000, CAST(N'2021-01-14' AS Date), 999, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (4, N'Dutch Lady Sugar Pasteurized Fresh Milk', N'DK', N'Dutch Lady is pasteurized milk is made from fresh milk, fortified with protein, phosphorus, Vitamin B2 and B12, and essential vitamins and minerals for the body. Pesticides, antibiotics as well as chemical colors should ensure safety for health.', N'4.jpg', 28500, CAST(N'2021-01-14' AS Date), 1000, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (5, N'Inex whole fresh milk without sugar', N'DK', N'Inex whole fresh milk is selected from dairy farms in Belgium with a temperate climate and a developed livestock industry. Cow is milk here is always appreciated for quality, undergoes the strict European production and quality control process, ensures no preservatives and growth hormones.', N'5.jpg', 30000, CAST(N'2021-01-14' AS Date), 488, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (6, N'Box of 48 boxes of TH true MILK chocolate pasteurized fresh milk', N'DK', N'TH true chocolate MILK pasteurized fresh milk is made from fresh cow is milk that is raised to strict standards on TH farms. Milk not only has a delicious taste but also contains many essential nutrients such as vitamins A, D, B1, B2, calcium ... good for bones and health.', N'6.jpg', 384000, CAST(N'2021-01-14' AS Date), 10, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (7, N'Pepsi Cola 1.5 liter', N'DK', N'CO2 saturated water, cane sugar, HFCS sugar, synthetic color, acidity regulator, caffeine, stabilizer, natural flavor mix.', N'7.jpg', 100000, CAST(N'2021-01-14' AS Date), 1000, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (8, N'Yumfood nutritional cereal', N'FD', N'Yumfood is one of the brands of cereals and oats that many people believe in. Yumfood oat products and cereals are imported directly from Australia with affordable prices and excellent quality.', N'8.jpg', 45000, CAST(N'2021-01-14' AS Date), 1000, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (9, N'Sunrise brown rice oats', N'FD', N'40% oats, 10% brown rice, non dairy creamer, sugar, calcium carbonate (170i), salt', N'9.jpg', 30000, CAST(N'2021-01-14' AS Date), 398, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (10, N'Sunrise 3-in-1 Glutinous Oats', N'FD', N'40% oats, 10% glutinous rice, non dairy creamer, sugar, calcium carbonate (170i), salt', N'10.jpg', 29000, CAST(N'2021-01-01' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (11, N'Whole grain cake Nestlé Milo Bar', N'FD', N'Cereal flour (34.2%) (whole wheat flour (gluten) (23.4%), cornstarch, rice flour], coating [skim milk powder (cows milk), palm oil, maltodextrin , sugar, minerals (calcium carbonate), lecithin (322 (i)) emulsifiers, natural flavors], sugar, glucose syrup, sweetened condensed milk (cows milk), humectants (422, 420) , reverse sugar syrup, vegetable oil (sunflower oil, palm oil), malt extract (containing gluten), skim milk powder (cows milk), cocoa powder, minerals (calcium carbonate, iron pyrophosphate) , salt, slimming cocoa powder, lechithin emulsifier (322 (i)), dextrose monohydrate, vitamins (B3, B5, B6, B9), stabilizer (399 (iii)), antioxidant (307b ).', N'11.jpg', 12500, CAST(N'2020-05-14' AS Date), 399, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (12, N'Monde Chocolate Chip biscuits', N'FD', N'Wheat flour, vegetable fat, chocolate chip (17.2%), sugar, palm sugar, foaming agent, milk powder, cocoa powder, salt, artificial vanilla flavor, lecithin emulsifier', N'12.jpg', 19000, CAST(N'2021-01-14' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (13, N'Pineapple juice Yooh', N'DK', N'Shake well before using. It tastes better when served cold. Keep in a cool and dry place, away from direct sunlight or high temperature.', N'13.jpg', 8000, CAST(N'2021-01-15' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (14, N'White Espresso NesCafe', N'DK', N'White Espresso NesCafe Gold Instant Coffee is a combination of two pure coffee beans, Robusta and Arabica, for a very strong flavor, twice as delicious. Products are roasted with European technology to create an attractive and strong coffee taste, making every experience more complete. Thick and smooth foam layer with milk ingredients from New Zealand & Australia.', N'14.jpg', 98000, CAST(N'2021-01-14' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (15, N'Fini Yogurt Jellies', N'CD', N'Glucose syrup, sugar, water, gelatine, yogurt powder (milk) 3%, quality adjustment acid', N'15.jpg', 25000, CAST(N'2021-01-14' AS Date), 399, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (16, N'Fres Barley barley mint candy', N'CD', N'The combination of cool mint and sweet barley, brings fresh breath and delight to enjoy. The product does not contain added sugar and preservatives.', N'16.jpg', 15000, CAST(N'2021-01-01' AS Date), 397, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (17, N'Kinder Joy', N'CD', N'Sugar, vegetable oil, 19.5% skim milk powder, 4% skim cocoa powder, wheat flour, toasted wheat germ, starch, barley malt, lecithin (soybean) emulsifier, oil vegetable, milk protein, natural flavoring (vanillin, hazelnut), porous substance (ammonium hydrogen carbonate, sodium hydrogen carbonate), salt.', N'17.jpg', 25000, CAST(N'2021-01-14' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (18, N'Play More', N'CD', N'Play More has a characteristic salty and sour taste, accompanied by a gentle cool taste from mint, helping you get fresh, refreshing breath, reducing bad breath and having positive effects if you are tasting. cough or sore throat.', N'18.jpg', 54000, CAST(N'2021-01-14' AS Date), 399, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (19, N'spearmint Mentos Pure Fresh', N'CD', N'The scent of mint provides a refreshing, refreshing breath when enjoyed. Product without sugar, suitable for dieters.', N'19.jpg', 30000, CAST(N'2021-01-14' AS Date), 400, 1)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (20, N'Sugus fruit flavor soft candy', N'CD', N'Sweet and sour fresh fruit flavor blends in the marshmallow, seductive aroma, stimulates all senses.', N'20.jpg', 19000, CAST(N'2021-01-14' AS Date), 399, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (21, N'Mentos mint', N'CD', N'Peppermint-flavored candies contain green tea extracts for a refreshing breath and a refreshing feeling when enjoyed. Sugar-free products are suitable for dieters.', N'21.jpg', 40000, CAST(N'2021-01-14' AS Date), 40, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (22, N'Warrior', N'DK', N'Shake gently before drinking, use immediately after opening. More delicious cold drink.', N'22.jpg', 15000, CAST(N'2021-01-11' AS Date), 4000, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (23, N'Lipovitan', N'DK', N'Caffeine, sugar, caramel, stevia & water, flavor enhancer, preservative, synthetic flavorings', N'23.jpg', 7000, CAST(N'2021-01-14' AS Date), 399, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (24, N'Monster Energy Ultra', N'DK', N'Shake gently before drinking, use immediately after opening. More delicious cold drink.', N'26.jpg', 25000, CAST(N'2021-01-14' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (25, N'Oreo cream chocolate', N'FD', N'Products containing flour and soybeans, produced on production lines containing milk and peanuts (peanuts).', N'24.jpg', 24000, CAST(N'2021-01-14' AS Date), 400, 0)
INSERT [dbo].[tblProducts] ([productID], [productName], [categoryID], [description], [imageName], [price], [createDate], [quantity], [status]) VALUES (26, N'Danisa ', N'FD', N'Danisa 681g butter biscuits are made from an original Danish recipe, with the finest ingredients, the finest ingredients, using premium flavored butter that contributes to a unique difference compared to other lines of butter biscuits.', N'25.jpg', 29000, CAST(N'2021-01-14' AS Date), 400, 0)
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
GO
SET IDENTITY_INSERT [dbo].[tblrecordUpdate] ON 

INSERT [dbo].[tblrecordUpdate] ([recordID], [userID], [productID], [recordDate], [note]) VALUES (1, N'admin2', 1, CAST(N'2021-01-19T17:01:19.000' AS DateTime), N'Update')
INSERT [dbo].[tblrecordUpdate] ([recordID], [userID], [productID], [recordDate], [note]) VALUES (2, N'admin2', 5, CAST(N'2021-01-19T17:01:45.000' AS DateTime), N'Delete')
INSERT [dbo].[tblrecordUpdate] ([recordID], [userID], [productID], [recordDate], [note]) VALUES (3, N'admin2', 19, CAST(N'2021-01-19T17:01:55.000' AS DateTime), N'Delete')
INSERT [dbo].[tblrecordUpdate] ([recordID], [userID], [productID], [recordDate], [note]) VALUES (4, N'admin2', 1, CAST(N'2021-01-19T17:48:34.000' AS DateTime), N'Update')
SET IDENTITY_INSERT [dbo].[tblrecordUpdate] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID]) VALUES (N'admin', N'Administrator', N'123456', N'AD')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID]) VALUES (N'admin2', N'Administrator', N'1', N'AD')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID]) VALUES (N'hanhvu0978', N'Huynh Anh Vu', N'123456789', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID]) VALUES (N'test', N'Test', N'123456', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID]) VALUES (N'user01', N'nguyen van loi', N'1', N'US')
INSERT [dbo].[tblUsers] ([userID], [userName], [password], [roleID]) VALUES (N'user02', N'anh vu', N'123456789', N'US')
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([paymentID])
REFERENCES [dbo].[tblPayments] ([paymentID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategorys] ([categoryID])
GO
ALTER TABLE [dbo].[tblrecordUpdate]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblrecordUpdate]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [Assignment_HuynhAnhVu] SET  READ_WRITE 
GO
