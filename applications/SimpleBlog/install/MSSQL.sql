USE [simpleblog]
GO
/****** Object:  ForeignKey [FK_comments_entries]    Script Date: 09/13/2010 14:45:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comments_entries]') AND parent_object_id = OBJECT_ID(N'[dbo].[comments]'))
ALTER TABLE [dbo].[comments] DROP CONSTRAINT [FK_comments_entries]
GO
/****** Object:  ForeignKey [FK_entries_users]    Script Date: 09/13/2010 14:45:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_entries_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[entries]'))
ALTER TABLE [dbo].[entries] DROP CONSTRAINT [FK_entries_users]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 09/13/2010 14:45:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comments_entries]') AND parent_object_id = OBJECT_ID(N'[dbo].[comments]'))
ALTER TABLE [dbo].[comments] DROP CONSTRAINT [FK_comments_entries]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_comments_time]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[comments] DROP CONSTRAINT [DF_comments_time]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comments]') AND type in (N'U'))
DROP TABLE [dbo].[comments]
GO
/****** Object:  Table [dbo].[entries]    Script Date: 09/13/2010 14:45:22 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_entries_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[entries]'))
ALTER TABLE [dbo].[entries] DROP CONSTRAINT [FK_entries_users]
GO
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_entries_time]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[entries] DROP CONSTRAINT [DF_entries_time]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[entries]') AND type in (N'U'))
DROP TABLE [dbo].[entries]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09/13/2010 14:45:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
DROP TABLE [dbo].[users]
GO
/****** Object:  Table [dbo].[users]    Script Date: 09/13/2010 14:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[users](
	[user_id] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[lastLogin] [datetime] NULL,
	[userType] [varchar](50) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [userType]) VALUES (N'F06CBFC1-095D-B78B-8047E098B7AFC039', N'Admin', N'Admin', N'admin', N'admin', CAST(0x00009DEA00000000 AS DateTime), N'admin')
INSERT [dbo].[users] ([user_id], [firstName], [lastName], [userName], [password], [lastLogin], [userType]) VALUES (N'ff8080812ad4674a012ae12b07f00028', N'Luis', N'Majano', N'luis', N'luis', NULL, N'user')
/****** Object:  Table [dbo].[entries]    Script Date: 09/13/2010 14:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[entries]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[entries](
	[entry_id] [varchar](50) NOT NULL,
	[entryBody] [text] NOT NULL,
	[author] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[time] [datetime] NULL CONSTRAINT [DF_entries_time]  DEFAULT (getdate()),
	[FK_userID] [varchar](50) NULL,
 CONSTRAINT [PK_entries] PRIMARY KEY CLUSTERED 
(
	[entry_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[entries] ([entry_id], [entryBody], [author], [title], [time], [FK_userID]) VALUES (N'4E0DCC23-1EC9-46DA-21DFC2AE547C4C7A', N'<p>&nbsp;test</p>', N'test', N'test', CAST(0x00009DE50114C840 AS DateTime), N'F06CBFC1-095D-B78B-8047E098B7AFC039')
INSERT [dbo].[entries] ([entry_id], [entryBody], [author], [title], [time], [FK_userID]) VALUES (N'4E0F56F5-1EC9-46DA-211AEE733CDA9785', N'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n<p>&nbsp;</p>\r\n<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. &nbsp;</p>', N'Henrik', N'Some Ipsum Text', CAST(0x00009DE50114C96C AS DateTime), N'F06CBFC1-095D-B78B-8047E098B7AFC039')
INSERT [dbo].[entries] ([entry_id], [entryBody], [author], [title], [time], [FK_userID]) VALUES (N'4E20F12B-1EC9-46DA-21EBE5CD8D8FA931', N'<p>&nbsp;tests</p>', N'tsets', N'test', CAST(0x00009DE50114CA98 AS DateTime), N'F06CBFC1-095D-B78B-8047E098B7AFC039')
INSERT [dbo].[entries] ([entry_id], [entryBody], [author], [title], [time], [FK_userID]) VALUES (N'F06CBFC1-095D-B78B-8047E098B7AFC034', N'<p>IN release 1.5, generics were added to Java. Before generics, you had to cast every object you read from a collection. If someone accidentally inserted an object of the wrong type, casts could fail at runtime. With generics, you tell the compiler what types of objects are permitted in each collection. The compiler inserts casts for you automatically and tells you at compile time if you try to insert an object of the wrong type. This results in programs that are both safer and clearer, but these benefits come with complications. This chapter tells you how to maximize the benefits and minimize the complications. For a more detailed treatment of this material, see Langer&rsquo;s tutorial [Langer08] or Naftalin and Wadler&rsquo;s book [Naftalin07].</p>', N'Luis Majano', N'Luis Majano Test', CAST(0x00009DE6011CD0E4 AS DateTime), N'F06CBFC1-095D-B78B-8047E098B7AFC039')
INSERT [dbo].[entries] ([entry_id], [entryBody], [author], [title], [time], [FK_userID]) VALUES (N'ff8080812ad4674a012ad948f06c001d', N'<p>Enterprise Architect ColdFusion Code Generation MDG Technology.<br />\r\n<br />\r\nThis project is based on the work of http://devnulled.com/content/2005/09/modified-coldfusion-template-for-enterprise-architect/<br />\r\n<br />\r\nI took that MDG technology and added ColdFusion 9 support for ORM entities, inheritance, interfaces and more.<br />\r\n<br />\r\nTo Install:<br />\r\n<br />\r\n* Close all projects<br />\r\n* Create a folder somewhere in your maching called MDGTechnologies.&nbsp; I have done mine in the desktop and I have dropped the templates there.<br />\r\n* On EA go to settings &gt; MDG Technologies.<br />\r\n* Click on Advanced and then click on add and choose Add Path..., then choose the directory you created<br />\r\n* Click ok and restart EA.&nbsp; Now coldfusion is available for any project<br />\r\n<br />\r\nTo Install the CF9 reference templates do the following:<br />\r\n<br />\r\n* Click on Tools &gt; Import Referecne Data and choose the cf9 templates (cf9CodeTemplates.xml)<br />\r\n<br />\r\nWhen you do code generation in UML, it will generate ColdFusion stubs. For ORM capabilities, you can add<br />\r\nthe &quot;alias&quot; property to create the column=&quot;&quot; in the cfproperty created.&nbsp; This goes the same for the <br />\r\nalias of the UML class it will translate to the table=&quot;&quot; in the cfcomponent tag.</p>', NULL, N'Hey Everybody!!', CAST(0x00009DE6010F6878 AS DateTime), N'F06CBFC1-095D-B78B-8047E098B7AFC039')
INSERT [dbo].[entries] ([entry_id], [entryBody], [author], [title], [time], [FK_userID]) VALUES (N'ff8080812ad4674a012ad975ed93001e', N'<p>Item 23: Don&rsquo;t use raw types in new code<br />\r\nFirst, a few terms. A class or interface whose declaration has one or more type parameters is a generic class or interface [JLS, 8.1.2, 9.1.2]. For example, as of release 1.5, the List interface has a single type parameter, E, representing the ele- ment type of the list. Technically the name of the interface is now List&lt;E&gt; (read &ldquo;list of E&rdquo;), but people often call it List for short. Generic classes and interfaces are collectively known as generic types.<br />\r\nEach generic type defines a set of parameterized types, which consist of the class or interface name followed by an angle-bracketed list of actual type parame- ters corresponding to the generic type&rsquo;s formal type parameters [JLS, 4.4, 4.5]. For example, List&lt;String&gt; (read &ldquo;list of string&rdquo;) is a parameterized type repre- senting a list whose elements are of type String. (String is the actual type parameter corresponding to the formal type parameter E.)<br />\r\nFinally, each generic type defines a raw type, which is the name of the generic type used without any accompanying actual type parameters [JLS, 4.8]. For exam-<br />\r\n109<br />\r\n110<br />\r\nCHAPTER 5&nbsp;&nbsp;&nbsp; GENERICS<br />\r\nple, the raw type corresponding to List&lt;E&gt; is List. Raw types behave as if all of the generic type information were erased from the type declaration. For all practi- cal purposes, the raw type List behaves the same way as the interface type List did before generics were added to the platform.</p>', NULL, N'Java Generics', CAST(0x00009DE6011CE728 AS DateTime), N'F06CBFC1-095D-B78B-8047E098B7AFC039')
/****** Object:  Table [dbo].[comments]    Script Date: 09/13/2010 14:45:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[comments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[comments](
	[comment_id] [varchar](50) NOT NULL,
	[entry_id] [varchar](50) NOT NULL,
	[comment] [text] NOT NULL,
	[time] [datetime] NOT NULL CONSTRAINT [DF_comments_time]  DEFAULT (getdate()),
	[author] [varchar](200) NULL,
	[authorEmail] [varchar](200) NULL,
	[authorURL] [varchar](255) NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad88ac6ee0013', N'F06CBFC1-095D-B78B-8047E098B7AFC034', N'This post rocks', CAST(0x00009DE600D65B64 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad88b06cb0014', N'F06CBFC1-095D-B78B-8047E098B7AFC034', N'What up homey', CAST(0x00009DE600D66F50 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad88bad6c0015', N'F06CBFC1-095D-B78B-8047E098B7AFC034', N'Yo yo yo, this post rocks', CAST(0x00009DE600D6A088 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad88c33bb0016', N'F06CBFC1-095D-B78B-8047E098B7AFC034', N'1234', CAST(0x00009DE600D6C98C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad88e87540017', N'F06CBFC1-095D-B78B-8047E098B7AFC034', N'Hello', CAST(0x00009DE600D77BAC AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad88ed8a20018', N'4E0F56F5-1EC9-46DA-211AEE733CDA9785', N'This post sucks!', CAST(0x00009DE600D79448 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad98401e70020', N'ff8080812ad4674a012ad975ed93001e', N'This is great', CAST(0x00009DE6012120CC AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad98417520021', N'ff8080812ad4674a012ad975ed93001e', N'another great comment', CAST(0x00009DE6012126A8 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ad98435bf0023', N'ff8080812ad4674a012ad975ed93001e', N'solid presentation', CAST(0x00009DE601213008 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ae117cad80026', N'ff8080812ad4674a012ad975ed93001e', N'WOW, you really rocked!', CAST(0x00009DE800500C94 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ae134347e0029', N'ff8080812ad4674a012ad975ed93001e', N'Man, finally I can show who I am', CAST(0x00009DE80058929C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[comments] ([comment_id], [entry_id], [comment], [time], [author], [authorEmail], [authorURL]) VALUES (N'ff8080812ad4674a012ae135dbad002b', N'ff8080812ad4674a012ad975ed93001e', N'Wow, now I see who posts this stuff', CAST(0x00009DE80059112C AS DateTime), N'Luis Majano', N'info@coldbox.org', N'www.luismajano.com')
/****** Object:  ForeignKey [FK_comments_entries]    Script Date: 09/13/2010 14:45:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comments_entries]') AND parent_object_id = OBJECT_ID(N'[dbo].[comments]'))
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_entries] FOREIGN KEY([entry_id])
REFERENCES [dbo].[entries] ([entry_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_comments_entries]') AND parent_object_id = OBJECT_ID(N'[dbo].[comments]'))
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_entries]
GO
/****** Object:  ForeignKey [FK_entries_users]    Script Date: 09/13/2010 14:45:22 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_entries_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[entries]'))
ALTER TABLE [dbo].[entries]  WITH CHECK ADD  CONSTRAINT [FK_entries_users] FOREIGN KEY([FK_userID])
REFERENCES [dbo].[users] ([user_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_entries_users]') AND parent_object_id = OBJECT_ID(N'[dbo].[entries]'))
ALTER TABLE [dbo].[entries] CHECK CONSTRAINT [FK_entries_users]
GO
