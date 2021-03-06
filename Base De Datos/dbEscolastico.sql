USE [DBESCOLASTICO]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 3/8/2020 23:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cedula] [varchar](15) NULL,
	[fecha_nacimiento] [date] NULL,
	[lugar_nacimiento] [varchar](50) NULL,
	[sexo] [nchar](1) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/8/2020 23:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idarea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[coordinador] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 3/8/2020 23:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[idcalificacion] [int] IDENTITY(1,1) NOT NULL,
	[valor] [decimal](4, 2) NULL,
	[fecha] [datetime] NULL,
	[unidad] [nchar](1) NULL,
	[idmatricula] [int] NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[idcalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 3/8/2020 23:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
	[minimoIntegrantes] [int] NULL,
	[maximoIntegrantes] [int] NULL,
	[instructor] [varchar](50) NULL,
	[lugarEnsayos] [varchar](100) NULL,
 CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 3/8/2020 23:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[idmateria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](75) NULL,
	[nrc] [nchar](5) NULL,
	[creditos] [smallint] NULL,
	[idarea] [int] NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[idmateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 3/8/2020 23:09:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[costo] [decimal](18, 2) NULL,
	[estado] [nchar](1) NULL,
	[tipo] [nchar](1) NULL,
	[idalumno] [int] NULL,
	[idmateria] [int] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (3, N'Denniss', N'Manotoa', N'01578451321', CAST(N'1994-02-26' AS Date), N'Riobamba', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (4, N'Daniel', N'Yáñez', N'0123465788', CAST(N'1996-05-16' AS Date), N'Riobamba', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1002, N'Álex', N'Montalvo', N'0200159487', CAST(N'1999-08-07' AS Date), N'Ambato', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1003, N'David', N'Vique', N'485126792', CAST(N'1997-10-19' AS Date), N'Guaranda', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1004, N'Jasson', N'Salguero', N'4567891231', CAST(N'1999-06-25' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1005, N'Ronny', N'Gil', N'78946578941', CAST(N'1995-12-19' AS Date), N'Cayambe', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2006, N'Roberto', N'Barahona', N'0123456798', CAST(N'1999-11-15' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2007, N'Jhonny', N'Moya', N'02132456789', CAST(N'1999-10-25' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2008, N'Jefferson', N'Herrera', N'01234897887', CAST(N'1997-10-25' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2010, N'Christian', N'Guanopatín', N'1234567980', NULL, NULL, N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2011, N'Luis Armando', N'Chicaiza', N'0145678918', NULL, NULL, N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2012, N'Alan', N'Oña', N'0214567897', CAST(N'2000-07-16' AS Date), N'Tulcán', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2013, N'Anita', N'Lopez', N'0123458971', CAST(N'2001-10-07' AS Date), N'Loja', N'M')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (4, N'Programación', N'Ing. Javier Montaluisa')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (5, N'Software', N'Dr. Edison Espinosa')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (6, N'IA', N'Dr. José Carrillo')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Club] ON 

INSERT [dbo].[Club] ([id], [nombre], [descripcion], [minimoIntegrantes], [maximoIntegrantes], [instructor], [lugarEnsayos]) VALUES (2, N'Futbol Americano', N'Deporte de primera categoría', 30, 100, N'Paul MMM', N'Espe')
SET IDENTITY_INSERT [dbo].[Club] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (4, N'Fundamentos de programación', N'7000 ', 10, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (5, N'Fundamentos de programación', N'7001 ', 10, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (6, N'Programación orientada a objetos', N'7002 ', 8, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (7, N'Programación orientada a objetos', N'7007 ', 10, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (8, N'Certificación I', N'7600 ', 4, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (1002, N'Lab', N'9000 ', 4, 5)
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (3, CAST(N'2020-06-18T10:51:06.533' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 3, 6)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (4, CAST(N'2020-06-18T10:56:42.810' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 4, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (5, NULL, NULL, NULL, N'S', 1002, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (6, CAST(N'2020-06-18T11:15:51.813' AS DateTime), CAST(196.00 AS Decimal(18, 2)), N'1', N'T', 1003, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (7, CAST(N'2020-06-18T11:16:05.127' AS DateTime), CAST(245.00 AS Decimal(18, 2)), N'1', N'T', 1004, 4)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (8, CAST(N'2020-06-18T11:36:29.770' AS DateTime), CAST(98.00 AS Decimal(18, 2)), N'1', N'S', 1005, 6)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (1002, CAST(N'2020-07-09T10:55:33.137' AS DateTime), CAST(49.00 AS Decimal(18, 2)), N'1', N'S', 1002, 8)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Matricula] FOREIGN KEY([idmatricula])
REFERENCES [dbo].[Matricula] ([idmatricula])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Matricula]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Area] FOREIGN KEY([idarea])
REFERENCES [dbo].[Area] ([idarea])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Area]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([idalumno])
REFERENCES [dbo].[Alumno] ([idalumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Materia] FOREIGN KEY([idmateria])
REFERENCES [dbo].[Materia] ([idmateria])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Materia]
GO
