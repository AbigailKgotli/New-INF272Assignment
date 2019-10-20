USE [master]
GO
/****** Object:  Database [JobItDB]    Script Date: 2019/10/03 00:59:43 ******/
CREATE DATABASE [JobItDB]
GO
ALTER DATABASE [JobItDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JobItDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JobItDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JobItDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JobItDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JobItDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JobItDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [JobItDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JobItDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JobItDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JobItDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JobItDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JobItDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JobItDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JobItDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JobItDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JobItDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JobItDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JobItDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JobItDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JobItDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JobItDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JobItDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JobItDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JobItDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JobItDB] SET  MULTI_USER 
GO
ALTER DATABASE [JobItDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JobItDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JobItDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JobItDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JobItDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JobItDB', N'ON'
GO
USE [JobItDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[ProvinceID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nchar](10) NULL,
	[PhoneNo] [nchar](10) NULL,
	[Email] [nchar](10) NULL,
	[Website] [varchar](50) NULL,
	[CompanyTypeID] [int] NULL,
	[UserID] [int] NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyType]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[CompanyType](
	[CompanyTypeID] [int] NOT NULL,
	[Description] [varchar](200) NOT NULL,
 CONSTRAINT [PK_CompanyType] PRIMARY KEY CLUSTERED 
(
	[CompanyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContractType]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContractType](
	[ContractTypeID] [int] IDENTITY(1,1)  NULL,
	[ContractType] [varchar](50) NULL,
 CONSTRAINT [PK_ContractTypeID] PRIMARY KEY CLUSTERED 
(
	[ContractTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[ContractType] ( ContractType)
 VALUES( 'Permanent'), ( 'Temporary');

/****** Object:  Table [dbo].[Job]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[JobID] [int] NOT NULL,
	[JobTitle] [nchar](10) NULL,
	[Salary] [int] NULL,
	[DateAdded] [date] NULL,
	[ExpiryDate] [date] NULL,
	[CriminalRecord] [nchar](10) NULL,
	[ContractTypeID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT INTO [dbo].[Job] (JobTitle, Salary, DateAdded, ExpiryDate, CriminalRecord, ContractTypeID,CompanyID, CityID)
VALUES ( 'Secretary' , 5000, (convert(date, 23/09/2019, 30/11/2019)), 'None', 'Permanent', 'Private' , 'Pretoria'),
       ( 'Shop Manager' , 8000,(convert(date, 26/09/2019, 30/11/2019)), 'None', 'Permanent', 'Private' , 'Johannesburg');
        
/****** Object:  Table [dbo].[JobQualification]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobQualification](
	[JobQualificationID] [int] IDENTITY(1,1) NOT NULL,
	[JobID] [int] NOT NULL,
	[QualificationID] [int] NOT NULL,
 CONSTRAINT [PK_JobQualification] PRIMARY KEY CLUSTERED 
(
	[JobQualificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Language]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[Language]( Description)
VALUES ('English'), ( 'Afrikaans'), ( 'Sepedi'), ( 'IsiZulu'), (' Xhosa'), ( 'Setswana'),('Venda'), ( 'Tsonga'), ('Ndebele');
/****** Object:  Table [dbo].[Person]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonName] [varchar](50) NULL,
	[PersonSurname] [varchar](50) NULL,
	[PersonCell] [varchar](50) NULL,
	[PersonEmail] [varchar](50) NULL,
	[CriminalRecord] [varchar](50) NULL,
	[UserID] [int]  NULL,
	[JobID] [int]  NULL,
	[CityID] [int]  NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[Person](  PersonName, PersonSurname, PersonCell, PersonEmail, CriminalRecord )
VALUES ( 'Mark', 'VanWyk','0893561782','mark.van@yahoo.com', 'None'),
       ( 'Lay', 'Sel','0727685993','sel@yahoo.com', 'None')
/****** Object:  Table [dbo].[PersonLanguage]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonLanguage](
	[PersonLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
 CONSTRAINT [PK_PersonLanguage] PRIMARY KEY CLUSTERED 
(
	[PersonLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonQualification]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonQualification](
	[PersonQualificationID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[QualificationID] [int] NOT NULL,
 CONSTRAINT [PK_PersonQualification] PRIMARY KEY CLUSTERED 
(
	[PersonQualificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonSkill]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonSkill](
	[PersonSkillID] [int] NOT NULL,
	[PersonID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [PK_PersonSkill] PRIMARY KEY CLUSTERED 
(
	[PersonSkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Province]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceName] [varchar](50) NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[Province]( ProvinceName)
VALUES ( 'Eastern Cape'),('Free State'),('Gauteng'),( 'KwaZulu-Natal'), ('Limpopo'),('Mpumalanga'),( 'Northern Cape'),('North West'),('Western Cape');
/****** Object:  Table [dbo].[Qualification]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Qualification](
	[QualificationID] [int] IDENTITY(1,1) NOT NULL,
	[QualificationDescription] [varchar](50) NULL,
 CONSTRAINT [PK_Qualification] PRIMARY KEY CLUSTERED 
(
	[QualificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[Qualification] ( QualificationDescription)
VALUES ( 'Master degree in HR'), ('2  years experience in retail');
/****** Object:  Table [dbo].[Skill]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Skill](
	[SkillID] [int] IDENTITY(1,1) NOT NULL,
	[SkillDescription] [varchar](50) NULL,
 CONSTRAINT [PK_Skill] PRIMARY KEY CLUSTERED 
(
	[SkillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[Skill] ( SkillDescription)
VALUES ('Administrative, Business, and Finance'),( 'Leadership and Management');
/****** Object:  Table [dbo].[User]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[UserTypeID] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT INTO [dbo].[User](UserTypeID,Username, UserPassword)
VALUES (1, 'markvan','vanmark2')
/****** Object:  Table [dbo].[UserType]    Script Date: 2019/10/03 00:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT INTO [dbo].[UserType](Description)
VALUES ( 'Person'), ('Company');
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Province]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_City]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_CompanyType] FOREIGN KEY([CompanyTypeID])
REFERENCES [dbo].[CompanyType] ([CompanyTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_CompanyType]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_User]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_City]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Company]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_ContractType] FOREIGN KEY([ContractTypeID])
REFERENCES [dbo].[ContractType] ([ContractTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_ContractType]
GO
ALTER TABLE [dbo].[JobQualification]  WITH CHECK ADD  CONSTRAINT [FK_JobQualification_Job] FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([JobID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobQualification] CHECK CONSTRAINT [FK_JobQualification_Job]
GO
ALTER TABLE [dbo].[JobQualification]  WITH CHECK ADD  CONSTRAINT [FK_JobQualification_Qualification] FOREIGN KEY([QualificationID])
REFERENCES [dbo].[Qualification] ([QualificationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobQualification] CHECK CONSTRAINT [FK_JobQualification_Qualification]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_City]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_User]
GO
ALTER TABLE [dbo].[PersonLanguage]  WITH CHECK ADD  CONSTRAINT [FK_PersonLanguage_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Language] ([LanguageID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonLanguage] CHECK CONSTRAINT [FK_PersonLanguage_Language]
GO
ALTER TABLE [dbo].[PersonLanguage]  WITH CHECK ADD  CONSTRAINT [FK_PersonLanguage_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonLanguage] CHECK CONSTRAINT [FK_PersonLanguage_Person]
GO
ALTER TABLE [dbo].[PersonQualification]  WITH CHECK ADD  CONSTRAINT [FK_PersonQualification_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonQualification] CHECK CONSTRAINT [FK_PersonQualification_Person]
GO
ALTER TABLE [dbo].[PersonQualification]  WITH CHECK ADD  CONSTRAINT [FK_PersonQualification_Qualification] FOREIGN KEY([QualificationID])
REFERENCES [dbo].[Qualification] ([QualificationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonQualification] CHECK CONSTRAINT [FK_PersonQualification_Qualification]
GO
ALTER TABLE [dbo].[PersonSkill]  WITH CHECK ADD  CONSTRAINT [FK_PersonSkill_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonSkill] CHECK CONSTRAINT [FK_PersonSkill_Person]
GO
ALTER TABLE [dbo].[PersonSkill]  WITH CHECK ADD  CONSTRAINT [FK_PersonSkill_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skill] ([SkillID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PersonSkill] CHECK CONSTRAINT [FK_PersonSkill_Skill]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserType] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([UserTypeID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserType]
GO
USE [master]
GO
ALTER DATABASE [JobItDB] SET  READ_WRITE 
GO
