USE [master]
GO
/****** Object:  Database [Softka]    Script Date: 13/01/2022 7:35:03 p. m. ******/
CREATE DATABASE [Softka]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Softka', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Softka.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Softka_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Softka_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Softka] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Softka].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Softka] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Softka] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Softka] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Softka] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Softka] SET ARITHABORT OFF 
GO
ALTER DATABASE [Softka] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Softka] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Softka] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Softka] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Softka] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Softka] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Softka] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Softka] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Softka] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Softka] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Softka] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Softka] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Softka] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Softka] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Softka] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Softka] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Softka] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Softka] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Softka] SET  MULTI_USER 
GO
ALTER DATABASE [Softka] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Softka] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Softka] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Softka] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Softka] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Softka] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Softka] SET QUERY_STORE = OFF
GO
USE [Softka]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/01/2022 7:35:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
	[Puntos] [int] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juegos]    Script Date: 13/01/2022 7:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juegos](
	[IdJuego] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[Estado] [bit] NOT NULL,
	[PuntosGanados] [int] NOT NULL,
 CONSTRAINT [PK_Juegos] PRIMARY KEY CLUSTERED 
(
	[IdJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 13/01/2022 7:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[TipoIdentificacion_FK] [int] NOT NULL,
	[Identificacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonasJuegos]    Script Date: 13/01/2022 7:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonasJuegos](
	[IdPersonaJuego] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona_FK] [int] NOT NULL,
	[IdJuego_FK] [int] NOT NULL,
	[IdPregunta_FK] [int] NULL,
	[IdRespuesta_FK] [int] NULL,
 CONSTRAINT [PK_PersonasJuegos] PRIMARY KEY CLUSTERED 
(
	[IdPersonaJuego] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 13/01/2022 7:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [varchar](100) NOT NULL,
	[IdCategoria_FK] [int] NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 13/01/2022 7:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[Respuesta] [varchar](50) NOT NULL,
	[IdPregunta_FK] [int] NOT NULL,
	[Correcta] [bit] NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposIdentificacion]    Script Date: 13/01/2022 7:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposIdentificacion](
	[IdTipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TiposIdentificacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Categoria], [Puntos]) VALUES (1, N'Muy Facil', 10)
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria], [Puntos]) VALUES (2, N'Facil', 50)
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria], [Puntos]) VALUES (3, N'Intermedio', 100)
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria], [Puntos]) VALUES (4, N'Intermedio-Alto', 150)
INSERT [dbo].[Categorias] ([IdCategoria], [Categoria], [Puntos]) VALUES (5, N'Avanzado', 200)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Juegos] ON 

INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (2, CAST(N'2022-01-12T09:00:25.897' AS DateTime), 1, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (4, CAST(N'2022-01-12T18:32:12.277' AS DateTime), 1, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (5, CAST(N'2022-01-13T07:47:57.267' AS DateTime), 1, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (6, CAST(N'2022-01-13T08:07:53.617' AS DateTime), 1, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (7, CAST(N'2022-01-13T09:21:37.797' AS DateTime), 1, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (8, CAST(N'2022-01-13T09:22:28.923' AS DateTime), 1, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (9, CAST(N'2022-01-13T09:26:35.660' AS DateTime), 1, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (10, CAST(N'2022-01-13T09:45:58.833' AS DateTime), 0, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (11, CAST(N'2022-01-13T09:47:08.057' AS DateTime), 0, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (12, CAST(N'2022-01-13T09:47:34.763' AS DateTime), 0, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (13, CAST(N'2022-01-13T09:48:14.517' AS DateTime), 1, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (14, CAST(N'2022-01-13T09:51:44.477' AS DateTime), 0, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (15, CAST(N'2022-01-13T09:52:05.253' AS DateTime), 0, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (16, CAST(N'2022-01-13T09:52:58.773' AS DateTime), 1, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (17, CAST(N'2022-01-13T09:54:08.153' AS DateTime), 0, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (18, CAST(N'2022-01-13T09:54:36.793' AS DateTime), 0, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (19, CAST(N'2022-01-13T09:57:55.823' AS DateTime), 0, 10)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (20, CAST(N'2022-01-13T09:58:22.007' AS DateTime), 0, 0)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (21, CAST(N'2022-01-13T09:58:40.937' AS DateTime), 0, 210)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (22, CAST(N'2022-01-13T10:00:31.190' AS DateTime), 1, 160)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (23, CAST(N'2022-01-13T10:03:45.553' AS DateTime), 0, 510)
INSERT [dbo].[Juegos] ([IdJuego], [FechaInicio], [Estado], [PuntosGanados]) VALUES (24, CAST(N'2022-01-13T19:30:54.980' AS DateTime), 0, 510)
SET IDENTITY_INSERT [dbo].[Juegos] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([IdPersona], [Nombres], [Apellidos], [Email], [TipoIdentificacion_FK], [Identificacion]) VALUES (1, N'Robert', N'Aroca', N'rbjt@gmail.com', 1, N'1075275041')
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[PersonasJuegos] ON 

INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (1, 1, 2, 0, 0)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (2, 1, 4, 0, 0)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (3, 1, 5, 0, 0)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (4, 1, 6, 0, 0)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (5, 1, 7, 2, 9)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (6, 1, 8, 3, 13)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (7, 1, 9, 1, 1)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (8, 1, 10, 16, 69)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (9, 1, 11, 7, 31)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (10, 1, 12, 6, 17)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (11, 1, 13, 4, 17)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (12, 1, 14, 2, 0)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (13, 1, 15, 2, 9)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (14, 1, 16, 0, 0)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (15, 1, 17, 10, 13)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (16, 1, 18, 6, 17)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (17, 1, 19, 10, 13)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (18, 1, 20, 6, 28)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (19, 1, 21, 25, 106)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (20, 1, 22, 25, 106)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (21, 1, 23, 23, 100)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (22, 1, 24, 4, 17)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (23, 1, 24, 8, 35)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (24, 1, 24, 14, 55)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (25, 1, 24, 21, 88)
INSERT [dbo].[PersonasJuegos] ([IdPersonaJuego], [IdPersona_FK], [IdJuego_FK], [IdPregunta_FK], [IdRespuesta_FK]) VALUES (26, 1, 24, 23, 100)
SET IDENTITY_INSERT [dbo].[PersonasJuegos] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (1, N'¿Cuál de los siguientes sería atraído por un imán?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (2, N'¿Cuántos colores tiene la bandera de Colombia?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (3, N'¿Cuál es el río más largo del mundo?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (4, N'¿Qué palabra aparece tradicionalmente en la pantalla al terminar un largometraje?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (5, N'¿Cuál es el país más grande del mundo?', 1)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (6, N'¿En qué año llegó Cristóbal Colón a América?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (7, N'¿Cuál es el idioma oficial de Brasil?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (8, N'¿Cuál fue el primer hombre en ir a la luna?', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (10, N'¿Una canción de cuna se canta para ayudar a los bebés a...', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (11, N'¿Un ejemplo de adverbio de lugar es:', 2)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (12, N'¿Cuándo terminó la II Guerra Mundial?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (14, N'¿Quién era el Dios romano de la guerra?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (15, N'¿Aproximadamente, qué porcentaje de la superficie de la Tierra es agua?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (16, N'¿Quién escribió La Odisea?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (17, N'¿Cuál es la obra más importante de la literatura en español?', 3)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (18, N'¿Cuál de estos planetas está más cercano al sol:', 4)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (19, N'¿Cómo se le denomina al centro de un átomo?', 4)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (20, N'¿Qué parte del cuerpo produce insulina?', 4)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (21, N'¿Quién pintó La noche estrellada?', 4)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (22, N'¿Una persona famélica esta:', 4)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (23, N'¿Cuántos corazones tienen los pulpos?', 5)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (24, N'¿Cuál es la única ciudad que está en dos continentes distintos?', 5)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (25, N'¿Quién es el padre del psicoanálisis?', 5)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (26, N'¿Cómo se llama la estrofa poética que está conformada por 10 versos de 8 sílabas cada uno?', 5)
INSERT [dbo].[Preguntas] ([IdPregunta], [Pregunta], [IdCategoria_FK]) VALUES (27, N'¿Quién compuso Los Conciertos de Brandeburgo?', 5)
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (1, N'A) Metal', 1, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (2, N'B) Plástico', 1, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (3, N'C ) Madera', 1, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (4, N'D) Papel', 1, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (6, N'A) 2', 2, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (9, N'B) 3', 2, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (11, N'C) 4', 2, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (12, N'D) 1', 2, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (13, N'A) El Amazonas', 3, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (14, N'B) Magdalena', 3, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (15, N'C) Nilo', 3, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (16, N'D) Hudson', 3, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (17, N'A) Fin', 4, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (18, N'B) Conclusión', 4, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (19, N'C) Final', 4, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (20, N'D) Acabó', 4, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (21, N'A)	China', 5, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (22, N'B)	 Rusia', 5, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (23, N'C)	 India', 5, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (24, N'D ) Colombia', 5, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (25, N'A) 1429', 6, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (26, N'B) 1492', 6, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (27, N'C) 1358', 6, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (28, N'D) 1592', 6, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (30, N'A) Brasileño', 7, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (31, N'B) Español', 7, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (32, N'C) Francés', 7, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (33, N'D) Portugués', 7, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (34, N'A) Louis Armstrong', 8, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (35, N'B) Neil Armstrong', 8, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (36, N'C) Michael Armstrong', 8, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (37, N'D) Lance Armstrong', 8, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (38, N'A) Despertar', 10, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (39, N'B) Dormir', 10, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (40, N'C) Comer', 10, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (41, N'D) Invertir sabiamente', 10, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (43, N'A) Tampoco.', 11, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (44, N'B) Ahora.', 11, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (45, N'C) Cerca.', 11, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (46, N'D) Mal.', 11, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (47, N'A) 1943', 12, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (48, N'B) 1947', 12, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (49, N'C) 1945', 12, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (50, N'D) 1876', 12, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (51, N'A) Ares', 14, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (53, N'B) Júpiter', 14, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (55, N'C) Marte', 14, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (56, N'D) Miércoles', 14, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (57, N'A) 70%', 15, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (58, N'B) 50%', 15, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (59, N'C) 45%', 15, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (60, N'D) 80%', 15, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (67, N'A) Homero', 16, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (68, N'B) Virgilio', 16, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (69, N'C) Cervantes', 16, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (70, N'D) Odín', 16, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (71, N'A) El Principito', 17, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (72, N'B) Don Quijote de la Mancha', 17, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (73, N'C) Cien años de soledad', 17, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (74, N'D) Juruparis', 17, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (76, N'A) Neptuno', 18, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (77, N'B) Urano', 18, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (78, N'C) Saturno', 18, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (79, N'D) Tierra', 18, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (80, N'A) Electrón', 19, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (81, N'B) Núcleo', 19, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (82, N'C) Protón', 19, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (83, N'D) Átomo', 19, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (84, N'A) El páncreas', 20, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (85, N'B) El bazo', 20, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (86, N'C) El hígado', 20, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (87, N'D) El timo', 20, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (88, N'A) Vincent van Gogh', 21, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (89, N'B) Rembrandt', 21, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (90, N'C) Velázquez', 21, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (91, N'D) Jose Rivera', 21, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (92, N'A) Irritable', 22, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (94, N'B) Hambrienta', 22, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (96, N'C) Furiosa', 22, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (97, N'D) Asustada', 22, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (98, N'A) 1', 23, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (99, N'B) Ninguno', 23, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (100, N'C) 3', 23, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (101, N'D) 2', 23, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (102, N'A Moscú', 24, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (103, N'B Estambul', 24, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (104, N'C Berlín', 24, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (105, N'D Tokio', 24, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (106, N'A Sigmund Freud', 25, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (107, N'B Carl Gustav JungL', 25, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (108, N'C Skinner', 25, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (109, N'D Emmanuel Kant', 25, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (110, N'A Décima espinela', 26, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (111, N'B Decasílabo', 26, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (112, N'C Decasílabo octagonal', 26, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (113, N'D Decámetro', 26, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (114, N'A Mozart', 27, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (115, N'B Beethoven', 27, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (116, N'C Bach', 27, 1)
GO
INSERT [dbo].[Respuestas] ([IdRespuesta], [Respuesta], [IdPregunta_FK], [Correcta]) VALUES (117, N'D Sagan', 27, 0)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposIdentificacion] ON 

INSERT [dbo].[TiposIdentificacion] ([IdTipoIdentificacion], [Tipo]) VALUES (1, N'CC')
SET IDENTITY_INSERT [dbo].[TiposIdentificacion] OFF
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Personas_TiposIdentificacion] FOREIGN KEY([TipoIdentificacion_FK])
REFERENCES [dbo].[TiposIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Personas_TiposIdentificacion]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria_FK])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
USE [master]
GO
ALTER DATABASE [Softka] SET  READ_WRITE 
GO
