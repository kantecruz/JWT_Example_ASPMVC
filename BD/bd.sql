USE [Blogging]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 23/09/2019 11:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 23/09/2019 11:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [Url]) VALUES (1, N'http://blogs.msdn.com/dotnet')
INSERT [dbo].[Blog] ([BlogId], [Url]) VALUES (2, N'http://blogs.msdn.com/webdev')
INSERT [dbo].[Blog] ([BlogId], [Url]) VALUES (3, N'http://blogs.msdn.com/visualstudio')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [BlogId], [Content], [Title]) VALUES (2, 1, N'HOLA PRUEBA', N'HOLA')
INSERT [dbo].[Post] ([PostId], [BlogId], [Content], [Title]) VALUES (3, 2, N'HOLA 2 ', N'HOLA 2')
INSERT [dbo].[Post] ([PostId], [BlogId], [Content], [Title]) VALUES (4, 3, N'HOLA 4 ', N'HOLA 4')
SET IDENTITY_INSERT [dbo].[Post] OFF
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Blog_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([BlogId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Blog_BlogId]
GO
