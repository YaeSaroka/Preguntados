USE [master]
GO
/****** Object:  Database [PreguntORT]    Script Date: 3/8/2023 09:05:22 ******/
CREATE DATABASE [PreguntORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntORT', N'ON'
GO
ALTER DATABASE [PreguntORT] SET QUERY_STORE = OFF
GO
USE [PreguntORT]
GO
/****** Object:  User [alumno]    Script Date: 3/8/2023 09:05:22 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 3/8/2023 09:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 3/8/2023 09:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[idDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 3/8/2023 09:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[Enunciado] [varchar](200) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 3/8/2023 09:05:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (1, N'Ciencia y Tecnologia', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (2, N'Artes', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (3, N'Entretenimiento', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (4, N'Deporte', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (5, N'Geografia', NULL)
INSERT [dbo].[Categorias] ([idCategoria], [Nombre], [Foto]) VALUES (6, N'Historia', NULL)
GO
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (1, N'Facíl')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (2, N'Intermedio')
INSERT [dbo].[Dificultades] ([idDificultad], [Nombre]) VALUES (3, N'Difícil')
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Quién es?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿Cuál es el mamífero más grande conocido hasta la actualidad?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (3, 1, 1, N'¿Qué es un equino?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (4, 1, 1, N'¿Qué causa furor en Internet?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (5, 1, 1, N'¿Con qué otro nombre se conoce el ciclo del agua?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (6, 1, 2, N'¿En qué lugar del cuerpo se produce la insulina?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (7, 1, 2, N'¿Cuál de estas redes sociales es de ámbito laboral?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (8, 1, 2, N'¿Cómo se mide la fuerza del viento en el mar?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (9, 1, 2, N'¿Qué son las enzimas?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (10, 1, 2, N'¿Cuál es el símbolo de Bromo?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (11, 1, 3, N'¿Cuál de las sisguientes enfermedades ataca al higado?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (12, 1, 3, N'¿Cómo tomarías la sustancia alucinógena natural llamada ayahuasca?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (13, 1, 3, N'¿Qué cambio de estado ocurre en la sublimación?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (14, 1, 3, N'¿De qué color es la sangre de los peces?', NULL)
INSERT [dbo].[Preguntas] ([idPregunta], [idCategoria], [idDificultad], [Enunciado], [Foto]) VALUES (15, 1, 3, N'¿Qué se altera cuando nos damos un golpe en la cabeza que nos hace "ver las estrellas"?', NULL)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Larry Page', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Mark Zuckerberg', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Steve Jobs', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'Bill Gates', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Ballena Azul', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'Cachalote', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Elefante', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'Rinoceronte', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Una vaca', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Una antílope', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Una oveja', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Un caballo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'Los gatos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 2, N'Los ratones', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 4, 3, N'Los gansos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 4, 4, N'Los cangrejos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 5, 1, N'Ciclo natural', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 5, 2, N'Ciclo hidropónico', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 5, 3, N'Ciclo hidrológico', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 5, 4, N'Ciclo acuoso', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 6, 1, N'Páncreas', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 6, 2, N'Hígado', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 6, 3, N'Intestino', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 6, 4, N'Riñon', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 7, 1, N'Facebook', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 7, 2, N'Tuenti', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 7, 3, N'Jobfire', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 7, 4, N'Linkedin', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 8, 1, N'Pies', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 8, 2, N'Nudos', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 8, 3, N'Zancadas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 8, 4, N'Kilómetros por hora', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 9, 1, N'Células', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 9, 2, N'Clúcidos', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 9, 3, N'Hadas', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 9, 4, N'Proteínas', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 10, 1, N'No es un elemento', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 10, 2, N'B', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 10, 3, N'Br', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 10, 4, N'Bh', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 11, 1, N'Hepatitis', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 11, 2, N'Diabetes', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 11, 3, N'Artrósis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 11, 4, N'Cifoescoliosis', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 12, 1, N'Inhalada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 12, 2, N'Esnifada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 12, 3, N'Inyectada', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 12, 4, N'Ingerida', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 13, 1, N'De solido a liquido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 13, 2, N'De solido a gaseoso', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 13, 3, N'De gaseoso a liquido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 13, 4, N'De liquido a solido', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 14, 1, N'Verde oscuro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 14, 2, N'Marron oscuro', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 14, 3, N'Rojo', 1, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 14, 4, N'Azul', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 15, 1, N'El hipotalamo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 15, 2, N'El bulbo raquideo', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 15, 3, N'La pitutaria', 0, NULL)
INSERT [dbo].[Respuestas] ([idRespuesta], [idPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 15, 4, N'El nervio optico', 1, NULL)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultades] ([idDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas1] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas1]
GO
USE [master]
GO
ALTER DATABASE [PreguntORT] SET  READ_WRITE 
GO
