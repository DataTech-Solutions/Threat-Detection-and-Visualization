

/****** Object:  Table [dbo].[Calendar]    Script Date: 8/31/2022 3:43:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Calendar](
                [CalendarDate] [datetime] NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[ClassLookup]    Script Date: 8/31/2022 3:43:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClassLookup](
                [Class] [nvarchar](200) NULL,
                [Category] [nvarchar](200) NULL,
                [Technology] [nvarchar](200) NULL,
                [Field] [nvarchar](200) NULL,
                [IdentificationLogic] [nvarchar](200) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DataIngestionLog]    Script Date: 8/31/2022 3:44:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DataIngestionLog](
                [IngestionDate] [datetime] NULL,
                [Pipeline] [nvarchar](100) NULL,
                [Description] [nvarchar](500) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DataIngestionLog] ADD  DEFAULT (dateadd(hour,(4),getdate())) FOR [IngestionDate]
GO


/****** Object:  Table [dbo].[DataIngestionSummary]    Script Date: 8/31/2022 3:44:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DataIngestionSummary](
                [IngestionDate] [datetime] NULL,
                [Pipeline] [nvarchar](100) NULL,
                [Procedure] [nvarchar](100) NULL,
                [Table] [nvarchar](100) NULL,
                [RecordsIngested] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DataIngestionSummary] ADD  DEFAULT (dateadd(hour,(4),getdate())) FOR [IngestionDate]
GO

/****** Object:  Table [dbo].[DimAssetClass]    Script Date: 8/31/2022 3:45:56 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAssetClass](
                [ClassKey] [int] IDENTITY(1,1) NOT NULL,
                [Class] [nvarchar](max) NOT NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [ClassKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimAssetCMDB]    Script Date: 8/31/2022 3:46:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAssetCMDB](
                [AssetKey] [int] IDENTITY(1,1) NOT NULL,
                [HostName] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [AssetKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimAssetTenable]    Script Date: 8/31/2022 3:46:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAssetTenable](
                [AssetKey] [int] IDENTITY(1,1) NOT NULL,
                [IPAddress] [nvarchar](max) NULL,
                [MACAddress] [nvarchar](max) NULL,
                [DNSName] [nvarchar](max) NULL,
                [NetBIOSName] [nvarchar](max) NULL,
                [HostName] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [AssetKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimBusinessCriticality]    Script Date: 8/31/2022 3:46:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBusinessCriticality](
                [BusinessCriticalityKey] [int] IDENTITY(1,1) NOT NULL,
                [Criticality] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [BusinessCriticalityKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimBusinessService]    Script Date: 8/31/2022 3:47:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimBusinessService](
                [BusinessServiceKey] [int] IDENTITY(1,1) NOT NULL,
                [BusinessService] [nvarchar](200) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [BusinessServiceKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimCalendarDate]    Script Date: 8/31/2022 3:47:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCalendarDate](
                [DateKey] [int] IDENTITY(1,1) NOT NULL,
                [TheDate] [datetime] NULL,
                [TheDay] [int] NULL,
                [TheDayName] [nvarchar](20) NULL,
                [ TheWeek] [int] NULL,
                [TheISOWeek] [int] NULL,
                [TheDayOfWeek] [int] NULL,
                [TheMonth] [int] NULL,
                [TheMonthName] [nvarchar](20) NULL,
                [TheQuarter] [int] NULL,
                [TheYear] [int] NULL,
                [TheFirstOfMonth] [date] NULL,
                [TheLastOfYear] [date] NULL,
                [TheDayOfYear] [int] NULL,
                [CalendarDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
                [DateKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimCategory]    Script Date: 8/31/2022 3:47:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCategory](
                [CategoryKey] [int] IDENTITY(1,1) NOT NULL,
                [Category] [nvarchar](200) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [CategoryKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimDate]    Script Date: 8/31/2022 3:48:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDate](
                [DateKey] [int] IDENTITY(1,1) NOT NULL,
                [TheDate] [datetime] NOT NULL,
                [TheDay] [int] NOT NULL,
                [TheDayName] [nvarchar](20) NOT NULL,
                [ TheWeek] [int] NOT NULL,
                [TheISOWeek] [int] NOT NULL,
                [TheDayOfWeek] [int] NOT NULL,
                [TheMonth] [int] NOT NULL,
                [TheMonthName] [nvarchar](20) NOT NULL,
                [TheQuarter] [int] NOT NULL,
                [TheYear] [int] NOT NULL,
                [TheFirstOfMonth] [date] NOT NULL,
                [TheLastOfYear] [date] NOT NULL,
                [TheDayOfYear] [int] NOT NULL,
                [CalendarDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
                [DateKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DimDepartment]    Script Date: 8/31/2022 3:48:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDepartment](
                [DepartmentKey] [int] IDENTITY(1,1) NOT NULL,
                [Department] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [DepartmentKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimDeviceType]    Script Date: 8/31/2022 3:49:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDeviceType](
                [DeviceKey] [int] IDENTITY(1,1) NOT NULL,
                [DeviceType] [nvarchar](max) NULL,
                [CreatedOn] [datetime] NULL,
                [UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [DeviceKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimEmployee]    Script Date: 8/31/2022 3:49:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimEmployee](
                [EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
                [EmployeeName] [nvarchar](200) NULL,
                [CreatedOn] [datetime] NULL,
                [UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [EmployeeKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimExploitable]    Script Date: 8/31/2022 3:51:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimExploitable](
                [ExploitableKey] [int] IDENTITY(1,1) NOT NULL,
                [Exploitable] [nvarchar](max) NULL,
                [CreatedOn] [datetime] NULL,
                [UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [ExploitableKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimExploitsFramework]    Script Date: 8/31/2022 3:52:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimExploitsFramework](
                [ExploitFrameworkKey] [int] IDENTITY(1,1) NOT NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [ExploitFrameworkDescription] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [ExploitFrameworkKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimGroupCompany]    Script Date: 8/31/2022 3:52:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimGroupCompany](
                [GroupCompanyKey] [int] IDENTITY(1,1) NOT NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [GroupCompanyKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimGroupCompanyCMDB]    Script Date: 8/31/2022 3:52:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimGroupCompanyCMDB](
                [GroupCompanyKey] [int] IDENTITY(1,1) NOT NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [GroupCompanyKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimIPAddress]    Script Date: 8/31/2022 3:53:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimIPAddress](
                [IPAddressKey] [int] IDENTITY(1,1) NOT NULL,
                [IPAddress] [nvarchar](200) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [IPAddressKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimPlugin]    Script Date: 8/31/2022 3:53:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimPlugin](
                [PluginKey] [int] IDENTITY(1,1) NOT NULL,
                [Plugin] [int] NULL,
                [PluginName] [nvarchar](max) NULL,
                [FamilyName] [nvarchar](max) NULL,
                [PluginPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [RiskCategory] [nvarchar](max) NULL,
                [CVEID] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [CreatedOn] [datetime] NULL,
                [UpdatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [PluginKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimRiskFactor]    Script Date: 8/31/2022 3:53:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimRiskFactor](
                [RiskFactorKey] [int] IDENTITY(1,1) NOT NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [RiskFactorKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimSeverity]    Script Date: 8/31/2022 3:54:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSeverity](
                [SeverityKey] [int] IDENTITY(1,1) NOT NULL,
                [Severity] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [SeverityKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimSubCategory]    Script Date: 8/31/2022 3:54:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSubCategory](
                [SubCategoryKey] [int] IDENTITY(1,1) NOT NULL,
                [SubCategory] [nvarchar](200) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [SubCategoryKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[DimSupportGroup]    Script Date: 8/31/2022 3:54:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSupportGroup](
                [SupportGroupKey] [int] IDENTITY(1,1) NOT NULL,
                [SupportGroupName] [nvarchar](max) NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
                [SupportGroupKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[FactCMDB]    Script Date: 8/31/2022 3:55:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactCMDB](
                [ClassKey] [int] NOT NULL,
                [AssetKey] [int] NOT NULL,
                [GroupCompanyKey] [int] NOT NULL,
                [OwnedByKey] [int] NOT NULL,
                [BusinessCriticalityKey] [int] NOT NULL,
                [IPAddressKey] [int] NOT NULL,
                [CategoryKey] [int] NOT NULL,
                [SubCategoryKey] [int] NOT NULL,
                [BusinessServiceKey] [int] NOT NULL,
                [AssetCount] [int] NOT NULL,
                [UpdatedOn] [datetime] NULL,
                [CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_AssetKey] FOREIGN KEY([AssetKey])
REFERENCES [dbo].[DimAssetCMDB] ([AssetKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_AssetKey]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_BusinessCritkey] FOREIGN KEY([BusinessCriticalityKey])
REFERENCES [dbo].[DimBusinessCriticality] ([BusinessCriticalityKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_BusinessCritkey]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_BusinessServicekey] FOREIGN KEY([BusinessServiceKey])
REFERENCES [dbo].[DimBusinessService] ([BusinessServiceKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_BusinessServicekey]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_Categorykey] FOREIGN KEY([CategoryKey])
REFERENCES [dbo].[DimCategory] ([CategoryKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_Categorykey]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_ClassKey] FOREIGN KEY([ClassKey])
REFERENCES [dbo].[DimAssetClass] ([ClassKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_ClassKey]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_GroupCompanykeyCMDB] FOREIGN KEY([GroupCompanyKey])
REFERENCES [dbo].[DimGroupCompanyCMDB] ([GroupCompanyKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_GroupCompanykeyCMDB]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_IPAddresskey] FOREIGN KEY([IPAddressKey])
REFERENCES [dbo].[DimIPAddress] ([IPAddressKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_IPAddresskey]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_ownedby] FOREIGN KEY([OwnedByKey])
REFERENCES [dbo].[DimEmployee] ([EmployeeKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_ownedby]
GO

ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_SubCategorykey] FOREIGN KEY([SubCategoryKey])
REFERENCES [dbo].[DimSubCategory] ([SubCategoryKey])
GO

ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_SubCategorykey]
GO


/****** Object:  Table [dbo].[FactTenableCompliances]    Script Date: 8/31/2022 3:55:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactTenableCompliances](
                [SeverityKey] [int] NOT NULL,
                [GroupCompanyKey] [int] NOT NULL,
                [PluginKey] [int] NOT NULL,
                [ExploitableKey] [int] NOT NULL,
                [RiskFactorKey] [int] NOT NULL,
                [ExploitsFrameworkKey] [int] NOT NULL,
                [AssetKey] [int] NOT NULL,
                [VulnerabilitiesCount] [int] NOT NULL,
                [UpdatedOn] [datetime] NOT NULL,
                [CreatedOn] [datetime] NOT NULL,
                [SnapshotDateKey] [int] NOT NULL,
                [FirstDiscoveredDateKey] [int] NOT NULL,
                [LastDiscoveredDateKey] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [assetcompl] FOREIGN KEY([AssetKey])
REFERENCES [dbo].[DimAssetTenable] ([AssetKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [assetcompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [exptcompl] FOREIGN KEY([ExploitableKey])
REFERENCES [dbo].[DimExploitable] ([ExploitableKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [exptcompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [exptfrmwrkcompl] FOREIGN KEY([ExploitsFrameworkKey])
REFERENCES [dbo].[DimExploitsFramework] ([ExploitFrameworkKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [exptfrmwrkcompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [gccompl] FOREIGN KEY([GroupCompanyKey])
REFERENCES [dbo].[DimGroupCompany] ([GroupCompanyKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [gccompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [plugcompl] FOREIGN KEY([PluginKey])
REFERENCES [dbo].[DimPlugin] ([PluginKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [plugcompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [riskcompl] FOREIGN KEY([RiskFactorKey])
REFERENCES [dbo].[DimRiskFactor] ([RiskFactorKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [riskcompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [severitycompl] FOREIGN KEY([SeverityKey])
REFERENCES [dbo].[DimSeverity] ([SeverityKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [severitycompl]
GO

ALTER TABLE [dbo].[FactTenableCompliances]  WITH CHECK ADD  CONSTRAINT [snapshotdatecompl] FOREIGN KEY([SnapshotDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactTenableCompliances] CHECK CONSTRAINT [snapshotdatecompl]
GO


/****** Object:  Table [dbo].[FactTenableVulnerabilities]    Script Date: 8/31/2022 3:56:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FactTenableVulnerabilities](
                [SeverityKey] [int] NOT NULL,
                [GroupCompanyKey] [int] NOT NULL,
                [PluginKey] [int] NOT NULL,
                [ExploitableKey] [int] NOT NULL,
                [RiskFactorKey] [int] NOT NULL,
                [ExploitsFrameworkKey] [int] NOT NULL,
                [AssetKey] [int] NOT NULL,
                [VulnerabilitiesCount] [int] NOT NULL,
                [UpdatedOn] [datetime] NOT NULL,
                [CreatedOn] [datetime] NOT NULL,
                [SnapshotDateKey] [int] NOT NULL,
                [FirstDiscoveredDateKey] [int] NOT NULL,
                [LastDiscoveredDateKey] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [asset] FOREIGN KEY([AssetKey])
REFERENCES [dbo].[DimAssetTenable] ([AssetKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [asset]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [expt] FOREIGN KEY([ExploitableKey])
REFERENCES [dbo].[DimExploitable] ([ExploitableKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [expt]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [exptfrmwrk] FOREIGN KEY([ExploitsFrameworkKey])
REFERENCES [dbo].[DimExploitsFramework] ([ExploitFrameworkKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [exptfrmwrk]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [firstdiscovereddate] FOREIGN KEY([FirstDiscoveredDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [firstdiscovereddate]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [firstdiscovereddatecompl] FOREIGN KEY([FirstDiscoveredDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [firstdiscovereddatecompl]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [gc] FOREIGN KEY([GroupCompanyKey])
REFERENCES [dbo].[DimGroupCompany] ([GroupCompanyKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [gc]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [lastdiscovereddate] FOREIGN KEY([LastDiscoveredDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [lastdiscovereddate]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [lastdiscovereddatecompl] FOREIGN KEY([LastDiscoveredDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [lastdiscovereddatecompl]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [plug] FOREIGN KEY([PluginKey])
REFERENCES [dbo].[DimPlugin] ([PluginKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [plug]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [risk] FOREIGN KEY([RiskFactorKey])
REFERENCES [dbo].[DimRiskFactor] ([RiskFactorKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [risk]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [severity] FOREIGN KEY([SeverityKey])
REFERENCES [dbo].[DimSeverity] ([SeverityKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [severity]
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities]  WITH CHECK ADD  CONSTRAINT [snapshotdate] FOREIGN KEY([SnapshotDateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO

ALTER TABLE [dbo].[FactTenableVulnerabilities] CHECK CONSTRAINT [snapshotdate]
GO


/****** Object:  Table [dbo].[MitigatedCompliance]    Script Date: 8/31/2022 3:56:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MitigatedCompliance](
                [IP] [nvarchar](20) NULL,
                [HostName] [nvarchar](200) NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [class] [nchar](50) NULL,
                [Category] [nchar](50) NULL,
                [plugin] [int] NULL,
                [PluginName] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [InsertDate] [varchar](10) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[NewVulnerabilityandCompliance]    Script Date: 8/31/2022 3:58:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NewVulnerabilityandCompliance](
                [IP] [nvarchar](20) NULL,
                [HostName] [nvarchar](200) NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [class] [nvarchar](50) NULL,
                [Category] [nvarchar](50) NULL,
                [plugin] [int] NULL,
                [PluginName] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [DMZIndicator] [nvarchar](5) NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [InsertDate] [date] NOT NULL,
                [RecordType] [varchar](50) NOT NULL,
                [BusinessService] [nchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[ServiceNowCMDB]    Script Date: 8/31/2022 3:59:10 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ServiceNowCMDB](
                [asset_display_value] [nvarchar](max) NULL,
                [asset_tag_display_value] [nvarchar](max) NULL,
                [assigned_display_value] [datetime2](7) NULL,
                [assigned_to_display_value] [nvarchar](max) NULL,
                [assignment_group_display_value] [nvarchar](max) NULL,
                [attestation_score_display_value] [nvarchar](max) NULL,
                [attested_by_display_value] [nvarchar](max) NULL,
                [attested_date_display_value] [nvarchar](max) NULL,
                [attested_display_value] [bit] NULL,
                [attributes_display_value] [nvarchar](max) NULL,
                [can_print_display_value] [bit] NULL,
                [category_display_value] [nvarchar](max) NULL,
                [change_control_display_value] [nvarchar](max) NULL,
                [checked_in_display_value] [nvarchar](max) NULL,
                [checked_out_display_value] [nvarchar](max) NULL,
                [comments_display_value] [nvarchar](max) NULL,
                [company_display_value] [nvarchar](max) NULL,
                [correlation_id_display_value] [nvarchar](max) NULL,
                [cost_cc_display_value] [nvarchar](max) NULL,
                [cost_center_display_value] [nvarchar](max) NULL,
                [cost_display_value] [smallint] NULL,
                [delivery_date_display_value] [nvarchar](max) NULL,
                [department_display_value] [nvarchar](max) NULL,
                [discovery_source_display_value] [nvarchar](max) NULL,
                [dns_domain_display_value] [nvarchar](max) NULL,
                [due_display_value] [nvarchar](max) NULL,
                [due_in_display_value] [nvarchar](max) NULL,
                [duplicate_of_display_value] [nvarchar](max) NULL,
                [environment_display_value] [nvarchar](max) NULL,
                [fault_count_display_value] [bit] NULL,
                [first_discovered_display_value] [nvarchar](max) NULL,
                [fqdn_display_value] [nvarchar](max) NULL,
                [gl_account_display_value] [nvarchar](max) NULL,
                [install_date_display_value] [nvarchar](max) NULL,
                [install_status_display_value] [nvarchar](max) NULL,
                [invoice_number_display_value] [nvarchar](max) NULL,
                [ip_address_display_value] [nvarchar](max) NULL,
                [justification_display_value] [nvarchar](max) NULL,
                [last_discovered_display_value] [nvarchar](max) NULL,
                [lease_id_display_value] [nvarchar](max) NULL,
                [life_cycle_stage_display_value] [nvarchar](max) NULL,
                [life_cycle_stage_status_display_value] [nvarchar](max) NULL,
                [location_display_value] [nvarchar](max) NULL,
                [mac_address_display_value] [nvarchar](max) NULL,
                [maintenance_schedule_display_value] [nvarchar](max) NULL,
                [managed_by_display_value] [nvarchar](max) NULL,
                [managed_by_group_display_value] [nvarchar](max) NULL,
                [manufacturer_display_value] [nvarchar](max) NULL,
                [model_id_display_value] [nvarchar](max) NULL,
                [model_number_display_value] [nvarchar](max) NULL,
                [monitor_display_value] [bit] NULL,
                [name_display_value] [nvarchar](max) NULL,
                [operational_status_display_value] [nvarchar](max) NULL,
                [order_date_display_value] [nvarchar](max) NULL,
                [owned_by_display_value] [nvarchar](max) NULL,
                [po_number_display_value] [int] NULL,
                [purchase_date_display_value] [nvarchar](max) NULL,
                [schedule_display_value] [nvarchar](max) NULL,
                [serial_number_display_value] [nvarchar](max) NULL,
                [short_description_display_value] [nvarchar](max) NULL,
                [skip_sync_display_value] [bit] NULL,
                [start_date_display_value] [nvarchar](max) NULL,
                [subcategory_display_value] [nvarchar](max) NULL,
                [support_group_display_value] [nvarchar](max) NULL,
                [supported_by_display_value] [nvarchar](max) NULL,
                [sys_class_name_display_value] [nvarchar](max) NULL,
                [sys_class_path_display_value] [nvarchar](max) NULL,
                [sys_created_by_display_value] [nvarchar](max) NULL,
                [sys_created_on_display_value] [datetime2](7) NULL,
                [sys_domain_display_value] [nvarchar](max) NULL,
                [sys_domain_path_display_value] [nvarchar](max) NULL,
                [sys_id_display_value] [nvarchar](max) NULL,
                [sys_mod_count_display_value] [smallint] NULL,
                [sys_tags_display_value] [nvarchar](max) NULL,
                [sys_updated_by_display_value] [nvarchar](max) NULL,
                [sys_updated_on_display_value] [datetime2](7) NULL,
                [u_additional_feature_display_value] [bit] NULL,
                [u_application_details_display_value] [nvarchar](max) NULL,
                [u_availability_status_display_value] [nvarchar](max) NULL,
                [u_building_display_value] [nvarchar](max) NULL,
                [u_business_criticality_display_value] [nvarchar](max) NULL,
                [u_business_owner_display_value] [nvarchar](max) NULL,
                [u_business_service_display_value] [nvarchar](max) NULL,
                [u_camera_display_value] [bit] NULL,
                [u_category_custom_display_value] [nvarchar](max) NULL,
                [u_category_display_value] [nvarchar](max) NULL,
                [u_ci_owner_display_value] [nvarchar](max) NULL,
                [u_classification_display_value] [nvarchar](max) NULL,
                [u_comments_display_value] [nvarchar](max) NULL,
                [u_cumulative_update_display_value] [nvarchar](max) NULL,
                [u_decommission_time_display_value] [nvarchar](max) NULL,
                [u_description_custom_display_value] [nvarchar](max) NULL,
                [u_description_display_value] [nvarchar](max) NULL,
                [u_device_category_display_value] [nvarchar](max) NULL,
                [u_device_criticality_display_value] [nvarchar](max) NULL,
                [u_device_custodian_display_value] [nvarchar](max) NULL,
                [u_device_owner_display_value] [nvarchar](max) NULL,
                [u_device_subcategory_display_value] [nvarchar](max) NULL,
                [u_device_type_display_value] [nvarchar](max) NULL,
                [u_end_of_support_display_value] [nvarchar](max) NULL,
                [u_environment_display_value] [nvarchar](max) NULL,
                [u_finance_asset_tag_display_value] [nvarchar](max) NULL,
                [u_floor_display_value] [nvarchar](max) NULL,
                [u_instance_name_display_value] [nvarchar](max) NULL,
                [u_management_ip_address_display_value] [nvarchar](max) NULL,
                [u_network_connectivity_display_value] [nvarchar](max) NULL,
                [u_opco_display_value] [nvarchar](max) NULL,
                [u_product_type_display_value] [nvarchar](max) NULL,
                [u_rack_height_display_value] [nvarchar](max) NULL,
                [u_recommended_display_value] [nvarchar](max) NULL,
                [u_required_display_value] [nvarchar](max) NULL,
                [u_room_display_value] [nvarchar](max) NULL,
                [u_server_type_display_value] [nvarchar](max) NULL,
                [u_service_manager_display_value] [nvarchar](max) NULL,
                [u_service_pack_display_value] [nvarchar](max) NULL,
                [u_size_display_value] [nvarchar](max) NULL,
                [u_source_display_value] [nvarchar](max) NULL,
                [u_sub_category_display_value] [nvarchar](max) NULL,
                [u_sub_type_display_value] [nvarchar](max) NULL,
                [u_subscriber_company_display_value] [nvarchar](max) NULL,
                [u_support_model_display_value] [nvarchar](max) NULL,
                [u_support_source_display_value] [nvarchar](max) NULL,
                [u_touch_screen_display_value] [bit] NULL,
                [u_type_display_value] [nvarchar](max) NULL,
                [u_update_recommended_display_value] [bit] NULL,
                [u_used_for_display_value] [nvarchar](max) NULL,
                [u_version_display_value] [nvarchar](max) NULL,
                [u_version_name_display_value] [nvarchar](max) NULL,
                [unverified_display_value] [bit] NULL,
                [vendor_display_value] [nvarchar](max) NULL,
                [warranty_expiration_display_value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_ServiceNowCMDB]    Script Date: 8/31/2022 4:01:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_ServiceNowCMDB](
                [asset_display_value] [nvarchar](max) NULL,
                [asset_tag_display_value] [nvarchar](max) NULL,
                [assigned_display_value] [datetime2](7) NULL,
                [assigned_to_display_value] [nvarchar](max) NULL,
                [assignment_group_display_value] [nvarchar](max) NULL,
                [attestation_score_display_value] [nvarchar](max) NULL,
                [attested_by_display_value] [nvarchar](max) NULL,
                [attested_date_display_value] [nvarchar](max) NULL,
                [attested_display_value] [bit] NULL,
                [attributes_display_value] [nvarchar](max) NULL,
                [can_print_display_value] [bit] NULL,
                [category_display_value] [nvarchar](max) NULL,
                [change_control_display_value] [nvarchar](max) NULL,
                [checked_in_display_value] [nvarchar](max) NULL,
                [checked_out_display_value] [nvarchar](max) NULL,
                [comments_display_value] [nvarchar](max) NULL,
                [company_display_value] [nvarchar](max) NULL,
                [correlation_id_display_value] [nvarchar](max) NULL,
                [cost_cc_display_value] [nvarchar](max) NULL,
                [cost_center_display_value] [nvarchar](max) NULL,
                [cost_display_value] [smallint] NULL,
                [delivery_date_display_value] [nvarchar](max) NULL,
                [department_display_value] [nvarchar](max) NULL,
                [discovery_source_display_value] [nvarchar](max) NULL,
                [dns_domain_display_value] [nvarchar](max) NULL,
                [due_display_value] [nvarchar](max) NULL,
                [due_in_display_value] [nvarchar](max) NULL,
                [duplicate_of_display_value] [nvarchar](max) NULL,
                [environment_display_value] [nvarchar](max) NULL,
                [fault_count_display_value] [bit] NULL,
                [first_discovered_display_value] [nvarchar](max) NULL,
                [fqdn_display_value] [nvarchar](max) NULL,
                [gl_account_display_value] [nvarchar](max) NULL,
                [install_date_display_value] [nvarchar](max) NULL,
                [install_status_display_value] [nvarchar](max) NULL,
                [invoice_number_display_value] [nvarchar](max) NULL,
                [ip_address_display_value] [nvarchar](max) NULL,
                [justification_display_value] [nvarchar](max) NULL,
                [last_discovered_display_value] [nvarchar](max) NULL,
                [lease_id_display_value] [nvarchar](max) NULL,
                [life_cycle_stage_display_value] [nvarchar](max) NULL,
                [life_cycle_stage_status_display_value] [nvarchar](max) NULL,
                [location_display_value] [nvarchar](max) NULL,
                [mac_address_display_value] [nvarchar](max) NULL,
                [maintenance_schedule_display_value] [nvarchar](max) NULL,
                [managed_by_display_value] [nvarchar](max) NULL,
                [managed_by_group_display_value] [nvarchar](max) NULL,
                [manufacturer_display_value] [nvarchar](max) NULL,
                [model_id_display_value] [nvarchar](max) NULL,
                [model_number_display_value] [nvarchar](max) NULL,
                [monitor_display_value] [bit] NULL,
                [name_display_value] [nvarchar](max) NULL,
                [operational_status_display_value] [nvarchar](max) NULL,
                [order_date_display_value] [nvarchar](max) NULL,
                [owned_by_display_value] [nvarchar](max) NULL,
                [po_number_display_value] [int] NULL,
                [purchase_date_display_value] [nvarchar](max) NULL,
                [schedule_display_value] [nvarchar](max) NULL,
                [serial_number_display_value] [nvarchar](max) NULL,
                [short_description_display_value] [nvarchar](max) NULL,
                [skip_sync_display_value] [bit] NULL,
                [start_date_display_value] [nvarchar](max) NULL,
                [subcategory_display_value] [nvarchar](max) NULL,
                [support_group_display_value] [nvarchar](max) NULL,
                [supported_by_display_value] [nvarchar](max) NULL,
                [sys_class_name_display_value] [nvarchar](max) NULL,
                [sys_class_path_display_value] [nvarchar](max) NULL,
                [sys_created_by_display_value] [nvarchar](max) NULL,
                [sys_created_on_display_value] [datetime2](7) NULL,
                [sys_domain_display_value] [nvarchar](max) NULL,
                [sys_domain_path_display_value] [nvarchar](max) NULL,
                [sys_id_display_value] [nvarchar](max) NULL,
                [sys_mod_count_display_value] [smallint] NULL,
                [sys_tags_display_value] [nvarchar](max) NULL,
                [sys_updated_by_display_value] [nvarchar](max) NULL,
                [sys_updated_on_display_value] [datetime2](7) NULL,
                [u_additional_feature_display_value] [bit] NULL,
                [u_application_details_display_value] [nvarchar](max) NULL,
                [u_availability_status_display_value] [nvarchar](max) NULL,
                [u_building_display_value] [nvarchar](max) NULL,
                [u_business_criticality_display_value] [nvarchar](max) NULL,
                [u_business_owner_display_value] [nvarchar](max) NULL,
                [u_business_service_display_value] [nvarchar](max) NULL,
                [u_camera_display_value] [bit] NULL,
                [u_category_custom_display_value] [nvarchar](max) NULL,
                [u_category_display_value] [nvarchar](max) NULL,
                [u_ci_owner_display_value] [nvarchar](max) NULL,
                [u_classification_display_value] [nvarchar](max) NULL,
                [u_comments_display_value] [nvarchar](max) NULL,
                [u_cumulative_update_display_value] [nvarchar](max) NULL,
                [u_decommission_time_display_value] [nvarchar](max) NULL,
                [u_description_custom_display_value] [nvarchar](max) NULL,
                [u_description_display_value] [nvarchar](max) NULL,
                [u_device_category_display_value] [nvarchar](max) NULL,
                [u_device_criticality_display_value] [nvarchar](max) NULL,
                [u_device_custodian_display_value] [nvarchar](max) NULL,
                [u_device_owner_display_value] [nvarchar](max) NULL,
                [u_device_subcategory_display_value] [nvarchar](max) NULL,
                [u_device_type_display_value] [nvarchar](max) NULL,
                [u_end_of_support_display_value] [nvarchar](max) NULL,
                [u_environment_display_value] [nvarchar](max) NULL,
                [u_finance_asset_tag_display_value] [nvarchar](max) NULL,
                [u_floor_display_value] [nvarchar](max) NULL,
                [u_instance_name_display_value] [nvarchar](max) NULL,
                [u_management_ip_address_display_value] [nvarchar](max) NULL,
                [u_network_connectivity_display_value] [nvarchar](max) NULL,
                [u_opco_display_value] [nvarchar](max) NULL,
                [u_product_type_display_value] [nvarchar](max) NULL,
                [u_rack_height_display_value] [nvarchar](max) NULL,
                [u_recommended_display_value] [nvarchar](max) NULL,
                [u_required_display_value] [nvarchar](max) NULL,
                [u_room_display_value] [nvarchar](max) NULL,
                [u_server_type_display_value] [nvarchar](max) NULL,
                [u_service_manager_display_value] [nvarchar](max) NULL,
                [u_service_pack_display_value] [nvarchar](max) NULL,
                [u_size_display_value] [nvarchar](max) NULL,
                [u_source_display_value] [nvarchar](max) NULL,
                [u_sub_category_display_value] [nvarchar](max) NULL,
                [u_sub_type_display_value] [nvarchar](max) NULL,
                [u_subscriber_company_display_value] [nvarchar](max) NULL,
                [u_support_model_display_value] [nvarchar](max) NULL,
                [u_support_source_display_value] [nvarchar](max) NULL,
                [u_touch_screen_display_value] [bit] NULL,
                [u_type_display_value] [nvarchar](max) NULL,
                [u_update_recommended_display_value] [bit] NULL,
                [u_used_for_display_value] [nvarchar](max) NULL,
                [u_version_display_value] [nvarchar](max) NULL,
                [u_version_name_display_value] [nvarchar](max) NULL,
                [unverified_display_value] [bit] NULL,
                [vendor_display_value] [nvarchar](max) NULL,
                [warranty_expiration_display_value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_SoftwareVulnerabilitiesByMachine]    Script Date: 8/31/2022 4:02:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_SoftwareVulnerabilitiesByMachine](
                [odatacontext] [nvarchar](max) NULL,
                [id] [nvarchar](max) NULL,
                [deviceId] [nvarchar](max) NULL,
                [rbacGroupId] [int] NULL,
                [rbacGroupName] [nvarchar](max) NULL,
                [deviceName] [nvarchar](max) NULL,
                [osPlatform] [nvarchar](max) NULL,
                [osVersion] [nvarchar](max) NULL,
                [osArchitecture] [nvarchar](max) NULL,
                [softwareVendor] [nvarchar](max) NULL,
                [softwareName] [nvarchar](max) NULL,
                [softwareVersion] [nvarchar](max) NULL,
                [cveId] [nvarchar](max) NULL,
                [vulnerabilitySeverityLevel] [nvarchar](max) NULL,
                [recommendedSecurityUpdate] [nvarchar](max) NULL,
                [recommendedSecurityUpdateId] [nvarchar](max) NULL,
                [recommendedSecurityUpdateUrl] [nvarchar](max) NULL,
                [diskPaths] [nvarchar](max) NULL,
                [registryPaths] [nvarchar](max) NULL,
                [lastSeenTimestamp] [datetime2](7) NULL,
                [firstSeenTimestamp] [datetime2](7) NULL,
                [endOfSupportStatus] [nvarchar](max) NULL,
                [endOfSupportDate] [nvarchar](max) NULL,
                [exploitabilityLevel] [nvarchar](max) NULL,
                [recommendationReference] [nvarchar](max) NULL,
                [cvssScore] [float] NULL,
                [securityUpdateAvailable] [bit] NULL,
                [odatanextLink] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_TenableInfoSnapshot]    Script Date: 8/31/2022 4:02:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_TenableInfoSnapshot](
                [type] [nvarchar](max) NULL,
                [error_msg] [nvarchar](max) NULL,
                [timestamp] [int] NULL,
                [Plugin] [int] NULL,
                [ip] [nvarchar](max) NULL,
                [MACAddress] [nvarchar](max) NULL,
                [DNSName] [nvarchar](max) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](max) NULL,
                [severity] [int] NULL,
                [returnedRecords] [int] NULL,
                [endOffset] [int] NULL,
                [startOffset] [int] NULL,
                [matchingDataElementCount] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [uuid] [nvarchar](max) NULL,
                [Protocol] [nvarchar](max) NULL,
                [PluginName] [nvarchar](max) NULL,
                [FirstDiscovered] [int] NULL,
                [LastObserved] [int] NULL,
                [Exploit] [bit] NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso ] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity ] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore ] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore ] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [vulnPubDate] [int] NULL,
                [patchPubDate] [int] NULL,
                [pluginModDate] [int] NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [IPAddress] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [HostUniqueness] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [KeyDrivers] [nvarchar](max) NULL,
                [Uniqueness] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [dataFormat] [nvarchar](max) NULL,
                [pluginInfo] [nvarchar](max) NULL,
                [totalRecords] [int] NULL,
                [CVEID] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [pluginPubDate] [int] NULL,
                [PluginPublicationDate] [datetime] NULL,
                [timestampDATE] [datetime] NULL,
                [FirstDiscoveredDATE] [datetime] NULL,
                [LastObservedDATE] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [IngestionDate] [datetime] NULL,
                [RecordType] [nvarchar](50) NULL,
                [HostName] [nvarchar](200) NULL,
                [DMZIndicator] [nvarchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_TenablePatched]    Script Date: 8/31/2022 4:03:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_TenablePatched](
                [type] [nvarchar](max) NULL,
                [error_msg] [nvarchar](max) NULL,
                [timestamp] [int] NULL,
                [Plugin] [int] NULL,
                [ip] [nvarchar](max) NULL,
                [MACAddress] [nvarchar](max) NULL,
                [DNSName] [nvarchar](max) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](max) NULL,
                [severity] [int] NULL,
                [returnedRecords] [int] NULL,
                [endOffset] [int] NULL,
                [startOffset] [int] NULL,
                [matchingDataElementCount] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [uuid] [nvarchar](max) NULL,
                [Protocol] [nvarchar](max) NULL,
                [PluginName] [nvarchar](max) NULL,
                [FirstDiscovered] [int] NULL,
                [LastObserved] [int] NULL,
                [Exploit] [bit] NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso ] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity ] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore ] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore ] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [vulnPubDate] [int] NULL,
                [patchPubDate] [int] NULL,
                [pluginModDate] [int] NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [IPAddress] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [HostUniqueness] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [KeyDrivers] [nvarchar](max) NULL,
                [Uniqueness] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [dataFormat] [nvarchar](max) NULL,
                [pluginInfo] [nvarchar](max) NULL,
                [totalRecords] [int] NULL,
                [CVEID] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [pluginPubDate] [int] NULL,
                [PluginPublicationDate] [datetime] NULL,
                [timestampDATE] [datetime] NULL,
                [FirstDiscoveredDATE] [datetime] NULL,
                [LastObservedDATE] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [IngestionDate] [datetime] NULL,
                [RecordType] [nvarchar](50) NULL,
                [HostName] [nvarchar](200) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [BusinessService] [nchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_TenableSnapshot]    Script Date: 8/31/2022 4:03:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_TenableSnapshot](
                [type] [nvarchar](max) NULL,
                [error_msg] [nvarchar](max) NULL,
                [timestamp] [int] NULL,
                [Plugin] [int] NULL,
                [ip] [nvarchar](max) NULL,
                [MACAddress] [nvarchar](max) NULL,
                [DNSName] [nvarchar](max) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](max) NULL,
                [severity] [int] NULL,
                [returnedRecords] [int] NULL,
                [endOffset] [int] NULL,
                [startOffset] [int] NULL,
                [matchingDataElementCount] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [uuid] [nvarchar](max) NULL,
                [Protocol] [nvarchar](max) NULL,
                [PluginName] [nvarchar](max) NULL,
                [FirstDiscovered] [int] NULL,
                [LastObserved] [int] NULL,
                [Exploit] [bit] NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso ] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity ] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore ] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore ] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [vulnPubDate] [int] NULL,
                [patchPubDate] [int] NULL,
                [pluginModDate] [int] NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [IPAddress] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [HostUniqueness] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [KeyDrivers] [nvarchar](max) NULL,
                [Uniqueness] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [dataFormat] [nvarchar](max) NULL,
                [pluginInfo] [nvarchar](max) NULL,
                [totalRecords] [int] NULL,
                [CVEID] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [pluginPubDate] [int] NULL,
                [PluginPublicationDate] [datetime] NULL,
                [timestampDATE] [datetime] NULL,
                [FirstDiscoveredDATE] [datetime] NULL,
                [LastObservedDATE] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [IngestionDate] [datetime] NULL,
                [RecordType] [nvarchar](50) NULL,
                [HostName] [nvarchar](200) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [ComplianceGroup] [nvarchar](300) NULL,
                [ISOIndicator] [nchar](10) NULL,
                [NESAIndicator] [nchar](10) NULL,
                [class] [nchar](100) NULL,
                [Category] [nvarchar](100) NULL,
                [Technology] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_TenableVuln7to14thJune]    Script Date: 8/31/2022 4:04:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_TenableVuln7to14thJune](
                [type] [nvarchar](max) NULL,
                [error_msg] [nvarchar](max) NULL,
                [timestamp] [int] NULL,
                [Plugin] [int] NULL,
                [ip] [nvarchar](max) NULL,
                [MACAddress] [nvarchar](max) NULL,
                [DNSName] [nvarchar](max) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](max) NULL,
                [severity] [int] NULL,
                [returnedRecords] [int] NULL,
                [endOffset] [int] NULL,
                [startOffset] [int] NULL,
                [matchingDataElementCount] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [uuid] [nvarchar](max) NULL,
                [Protocol] [nvarchar](max) NULL,
                [PluginName] [nvarchar](max) NULL,
                [FirstDiscovered] [int] NULL,
                [LastObserved] [int] NULL,
                [Exploit] [bit] NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso ] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity ] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore ] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore ] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [vulnPubDate] [int] NULL,
                [patchPubDate] [int] NULL,
                [pluginModDate] [int] NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [IPAddress] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [HostUniqueness] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [KeyDrivers] [nvarchar](max) NULL,
                [Uniqueness] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [dataFormat] [nvarchar](max) NULL,
                [pluginInfo] [nvarchar](max) NULL,
                [totalRecords] [int] NULL,
                [CVEID] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [pluginPubDate] [int] NULL,
                [PluginPublicationDate] [datetime] NULL,
                [timestampDATE] [datetime] NULL,
                [FirstDiscoveredDATE] [datetime] NULL,
                [LastObservedDATE] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [IngestionDate] [datetime] NULL,
                [RecordType] [nvarchar](50) NULL,
                [HostName] [nvarchar](200) NULL,
                [DMZIndicator] [nvarchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[STG_VulnerabilityTickets]    Script Date: 8/31/2022 4:04:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STG_VulnerabilityTickets](
                [IP] [nvarchar](20) NOT NULL,
                [Hostname] [nvarchar](200) NULL,
                [PlugIn] [int] NOT NULL,
                [Port] [int] NOT NULL,
                [Protocol] [nvarchar](10) NOT NULL,
                [Severity] [nvarchar](10) NOT NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploitability] [varchar](20) NOT NULL,
                [CVEID] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [RepositoryName] [nvarchar](100) NOT NULL,
                [GroupCompany] [nvarchar](50) NOT NULL,
                [Zone] [nvarchar](10) NOT NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [ScanDate] [datetime] NULL,
                [RequestType] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[TenableComplianceScans]    Script Date: 8/31/2022 4:04:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenableComplianceScans](
                [IPAddress] [nvarchar](max) NULL,
                [MACAddress] [nvarchar](max) NULL,
                [HostName] [nvarchar](max) NULL,
                [PluginName] [nvarchar](max) NULL,
                [RiskCategory] [nvarchar](max) NULL,
                [Severity] [nvarchar](max) NULL,
                [Exploitable] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [GroupCompany] [nvarchar](max) NULL,
                [Scan Date] [datetime] NULL,
                [FirstDiscoveredDate] [date] NULL,
                [VulnerabilitiesCount] [int] NOT NULL,
                [CMDB_HostName] [nvarchar](max) NULL,
                [BusinessService] [nvarchar](200) NULL,
                [Category] [nvarchar](200) NULL,
                [CmdbClass] [nvarchar](max) NULL,
                [Criticality] [nvarchar](max) NULL,
                [CMDB_GroupCompany] [nvarchar](max) NULL,
                [CMDB_IPAddress] [nvarchar](200) NULL,
                [OwnedBy] [nvarchar](200) NULL,
                [SubCategory] [nvarchar](200) NULL,
                [AssetCount] [int] NULL,
                [Zone] [nvarchar](50) NULL,
                [RecordType] [varchar](10) NOT NULL,
                [Class] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[TenableComplianceSnapshot]    Script Date: 8/31/2022 4:05:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenableComplianceSnapshot](
                [PlugIn] [int] NULL,
                [IP] [nvarchar](20) NULL,
                [MACAddress] [nvarchar](100) NULL,
                [DNSName] [nvarchar](200) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](200) NULL,
                [severity] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [Protocol] [nvarchar](50) NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploit] [varchar](50) NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [CVEID] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [PluginInfo] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [PluginPublicationDate] [datetime] NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [RecordType] [nvarchar](20) NULL,
                [InsertDateTimeStamp] [datetime] NULL,
                [UpdateDate] [datetime] NULL,
                [HostName] [nvarchar](200) NULL,
                [InsertDate] [date] NULL,
                [ISOIndicator] [nchar](10) NULL,
                [NESAIndicator] [nchar](10) NULL,
                [Class] [nchar](50) NULL,
                [Category] [nchar](50) NULL,
                [Technology] [nchar](50) NULL,
                [ComplianceGroup] [nvarchar](300) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[tenablecompliancesnapshotarchived]    Script Date: 8/31/2022 4:15:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tenablecompliancesnapshotarchived](
                [PlugIn] [int] NULL,
                [IP] [nvarchar](20) NULL,
                [MACAddress] [nvarchar](100) NULL,
                [DNSName] [nvarchar](200) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](200) NULL,
                [severity] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [Protocol] [nvarchar](50) NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploit] [varchar](50) NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [CVEID] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [PluginInfo] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [PluginPublicationDate] [datetime] NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [RecordType] [nvarchar](20) NULL,
                [InsertDateTimeStamp] [datetime] NULL,
                [UpdateDate] [datetime] NULL,
                [HostName] [nvarchar](200) NULL,
                [InsertDate] [date] NULL,
                [ISOIndicator] [nchar](10) NULL,
                [NESAIndicator] [nchar](10) NULL,
                [class] [nvarchar](200) NULL,
                [category] [nvarchar](200) NULL,
                [technology] [nvarchar](200) NULL,
                [ComplianceGroup] [nchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[TenableInfoSnapshot]    Script Date: 8/31/2022 4:16:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenableInfoSnapshot](
                [PlugIn] [int] NULL,
                [IP] [nvarchar](20) NULL,
                [MACAddress] [nvarchar](100) NULL,
                [DNSName] [nvarchar](200) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](200) NULL,
                [severity] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [Protocol] [nvarchar](50) NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploit] [varchar](50) NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [CVEID] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [PluginInfo] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [PluginPublicationDate] [datetime] NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [RecordType] [nvarchar](20) NULL,
                [InsertDateTimestamp] [datetime] NULL,
                [UpdateDate] [datetime] NULL,
                [HostName] [nvarchar](200) NULL,
                [InsertDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[TenableISOComplianceGroup]    Script Date: 8/31/2022 4:16:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenableISOComplianceGroup](
                [ComplianceGroup] [nvarchar](300) NULL,
                [IsoReference] [nvarchar](500) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[TenablePatched]    Script Date: 8/31/2022 4:16:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenablePatched](
                [PlugIn] [int] NULL,
                [IP] [nvarchar](20) NULL,
                [MACAddress] [nvarchar](100) NULL,
                [DNSName] [nvarchar](200) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](200) NULL,
                [severity] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [Protocol] [nvarchar](50) NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploit] [varchar](50) NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [CVEID] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [PluginInfo] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [PluginPublicationDate] [datetime] NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [RecordType] [nvarchar](20) NULL,
                [InsertDate] [datetime] NULL,
                [UpdateDate] [datetime] NULL,
                [HostName] [nvarchar](200) NULL,
                [BusinessService] [nchar](200) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[TenableVulnerabilitiesSnapshot]    Script Date: 8/31/2022 4:17:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenableVulnerabilitiesSnapshot](
                [PlugIn] [int] NULL,
                [IP] [nvarchar](20) NULL,
                [MACAddress] [nvarchar](100) NULL,
                [DNSName] [nvarchar](200) NULL,
                [Port] [int] NULL,
                [NetBIOSName] [nvarchar](200) NULL,
                [severity] [int] NULL,
                [SeverityID] [int] NULL,
                [SeverityName] [nvarchar](max) NULL,
                [SeverityDescription] [nvarchar](max) NULL,
                [MitigatedFlag] [bit] NULL,
                [RiskAccepted] [bit] NULL,
                [RiskRecasted] [bit] NULL,
                [Protocol] [nvarchar](50) NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploit] [varchar](50) NULL,
                [ExploitEase] [nvarchar](max) NULL,
                [ExploitFrameworks] [nvarchar](max) NULL,
                [Synopsis] [nvarchar](max) NULL,
                [SeeAlso] [nvarchar](max) NULL,
                [RiskFactor] [nvarchar](max) NULL,
                [StigSeverity] [nvarchar](max) NULL,
                [VulnerabilityPriorityRating] [float] NULL,
                [vprContext] [nvarchar](max) NULL,
                [CVSSV2BaseScore] [float] NULL,
                [CVSSV2TemporalScore] [float] NULL,
                [CVSSV2Vector] [nvarchar](max) NULL,
                [CVSSV3BaseScore] [float] NULL,
                [CVSSV3Vector] [nvarchar](max) NULL,
                [CPE] [nvarchar](max) NULL,
                [CVEID] [nvarchar](max) NULL,
                [BID] [nvarchar](max) NULL,
                [CheckType] [nvarchar](max) NULL,
                [Version] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [OperatingSystem] [nvarchar](max) NULL,
                [RiskRecastedRuleComment] [nvarchar](max) NULL,
                [RiskAcceptedRuleComment] [nvarchar](max) NULL,
                [ACRScore] [nvarchar](max) NULL,
                [FamilyID] [int] NULL,
                [FamilyName] [nvarchar](max) NULL,
                [FamilyType] [nvarchar](max) NULL,
                [RepositoryID] [int] NULL,
                [RepositoryName] [nvarchar](max) NULL,
                [RepositoryDescription] [nvarchar](max) NULL,
                [PluginInfo] [nvarchar](max) NULL,
                [Description] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [PluginPublicationDate] [datetime] NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [VulnPublicationDate] [datetime] NULL,
                [PatchPublicationDate] [datetime] NULL,
                [PluginModificationDate] [datetime] NULL,
                [GroupCompany] [nvarchar](50) NULL,
                [DMZIndicator] [nvarchar](10) NULL,
                [RecordType] [nvarchar](20) NULL,
                [InsertDateTimestamp] [datetime] NULL,
                [UpdateDate] [datetime] NULL,
                [HostName] [nvarchar](200) NULL,
                [InsertDate] [date] NULL,
                [Class] [nchar](50) NULL,
                [Category] [nchar](50) NULL,
                [Technology] [nchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


/****** Object:  Table [dbo].[VulnerabilityTickets]    Script Date: 8/31/2022 4:20:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VulnerabilityTickets](
                [IP] [nvarchar](20) NOT NULL,
                [Hostname] [nvarchar](200) NULL,
                [PlugIn] [int] NOT NULL,
                [Port] [int] NOT NULL,
                [Protocol] [nvarchar](10) NOT NULL,
                [Severity] [nvarchar](10) NOT NULL,
                [PluginName] [nvarchar](max) NULL,
                [Exploitability] [varchar](20) NOT NULL,
                [CVEID] [nvarchar](max) NULL,
                [PluginOutput] [nvarchar](max) NULL,
                [Solution] [nvarchar](max) NULL,
                [RepositoryName] [nvarchar](100) NOT NULL,
                [GroupCompany] [nvarchar](50) NOT NULL,
                [Zone] [nvarchar](10) NOT NULL,
                [FirstDiscoveredDate] [datetime] NULL,
                [LastObservedDate] [datetime] NULL,
                [ScanDate] [datetime] NULL,
                [TicketNumber] [nvarchar](20) NULL,
                [TicketStatus] [nvarchar](100) NULL,
                [TicketDate] [datetime] NULL,
                [UpdateDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  StoredProcedure [dbo].[DimCalDate]    Script Date: 8/31/2022 6:12:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[DimCalDate]
AS
BEGIN

DECLARE @StartDate  date = '20000101';

DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 100, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
DimDate AS
(
  SELECT
    TheDate         = CONVERT(date, d),
    TheDay          = DATEPART(DAY,       d),
    TheDayName      = DATENAME(WEEKDAY,   d),
    TheWeek         = DATEPART(WEEK,      d),
    TheISOWeek      = DATEPART(ISO_WEEK,  d),
    TheDayOfWeek    = DATEPART(WEEKDAY,   d),
    TheMonth        = DATEPART(MONTH,     d),
    TheMonthName    = DATENAME(MONTH,     d),
    TheQuarter      = DATEPART(Quarter,   d),
    TheYear         = DATEPART(YEAR,      d),
    TheFirstOfMonth = DATEFROMPARTS(YEAR(d), MONTH(d), 1),
    TheLastOfYear   = DATEFROMPARTS(YEAR(d), 12, 31),
    TheDayOfYear    = DATEPART(DAYOFYEAR, d),
                CalendarDate = CONVERT(date, d)
  FROM d
)
SELECT * FROM DimDate
  ORDER BY TheDate
  OPTION (MAXRECURSION 0);

END;

/****** Object:  StoredProcedure [dbo].[SP_LoadDefenderData]    Script Date: 8/31/2022 6:13:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
ALTER PROCEDURE [dbo].[SP_LoadDefenderData]
AS
BEGIN

                                -- Insert from Staging table into final Defender Machines table

select count(*) from STG_DefenderMachines where healthStatus='active'



UPDATE STG_DefenderMachines
                                SET GroupCompany = 
                                                                                                             
																											   CASE  
                                                                                                                WHEN (rbacGroupName like '%CompanyA%') THEN 'A'
                                                                                                                WHEN (rbacGroupName like '%CompanyB%') THEN 'B'
                                                                                                                WHEN (rbacGroupName like '%CompanyC%') THEN 'C'
                                                                                                                WHEN (rbacGroupName like '%CompanyD%') THEN 'D'
                                                                                                                WHEN (rbacGroupName like '%CompanyE%') THEN 'E'
                                                                                                                WHEN (rbacGroupName like '%CompanyF%') THEN 'F'
                                                                                                                WHEN (rbacGroupName like '%CompanyG%') THEN 'G'
                                                                                                                WHEN (rbacGroupName like '%CompanyH%') THEN 'H'
                                                                                                                WHEN (rbacGroupName like '%CompanyI%') THEN 'I'
                                                                                                                WHEN (rbacGroupName like '%CompanyJ%') THEN 'J'
                                                                                                                
                                                                                                                END

                                  WHERE [healthStatus] = 'Active'

TRUNCATE TABLE DefenderMachines
INSERT INTO DefenderMachines([aadDeviceId]
      ,[agentVersion]
      ,[computerDnsName]
      ,[defenderAvStatus]
      ,[deviceValue]
      ,[exposureLevel]
      ,[firstSeen]
      ,[healthStatus]
      ,[id]
      ,[isAadJoined]
      ,[lastExternalIpAddress]
      ,[lastIpAddress]
      ,[lastSeen]
      ,[managedBy]
      ,[managedByStatus]
      ,[onboardingStatus]
      ,[osArchitecture]
      ,[osBuild]
      ,[osPlatform]
      ,[osProcessor]
      ,[osVersion]
      ,[rbacGroupName]
      ,[riskScore]
      ,[version]
      ,[ipAddress]
      ,[macAddress]
      ,[operationalStatus]
      ,[type]
      ,[cloudProvider]
      ,[resourceId]
      ,[subscriptionId]
      ,[vmId]
                  ,[InsertDateTimestamp]
                  ,[UpdateDateTimestamp]
                  ,[InsertDate]) 
SELECT [aadDeviceId]
      ,[agentVersion]
      ,[computerDnsName]
      ,[defenderAvStatus]
      ,[deviceValue]
      ,[exposureLevel]
      ,[firstSeen]
      ,[healthStatus]
      ,[id]
      ,[isAadJoined]
      ,[lastExternalIpAddress]
      ,[lastIpAddress]
      ,[lastSeen]
      ,[managedBy]
      ,[managedByStatus]
      ,[onboardingStatus]
      ,[osArchitecture]
      ,[osBuild]
      ,[osPlatform]
      ,[osProcessor]
      ,[osVersion]
      ,[rbacGroupName]
      ,[riskScore]
      ,[version]
      ,[ipAddress]
      ,[macAddress]
      ,[operationalStatus]
      ,[type]
      ,[cloudProvider]
      ,[resourceId]
      ,[subscriptionId]
      ,[vmId]
                  ,[InsertDateTimestamp]
                  ,[UpdateDateTimestamp]
                  ,[InsertDate]
  FROM [dbo].[STG_DefenderMachines]

  truncate table [DefenderVulnerabilities]
  INSERT INTO [dbo].[DefenderVulnerabilities]
           ([id]
           ,[description]
           ,[severity]
           ,[cvssV3]
           ,[exposedMachines]
           ,[publicExploit]
           ,[exploitVerified]
           ,[exploitInKit]
           ,[InsertDateTimeStamp]
           ,[UpdateDateTimeStamp]
                                   ,InsertDate)
  SELECT [id]
           ,[description]
           ,[severity]
           ,[cvssV3]
           ,[exposedMachines]
           ,[publicExploit]
           ,[exploitVerified]
           ,[exploitInKit]
                                   ,[InsertDateTimeStamp]
           ,[UpdateDateTimeStamp]
                                   ,InsertDate
  FROM [dbo].[STG_DefenderVulnerabilities]


  INSERT INTO [dbo].[DefenderMachineVulnerabilities]
           ([cveId]
           ,[id]
           ,[machineId]
           ,[productVendor]
           ,[productName]
           ,[productVersion]
           ,[severity]
           ,[InsertDateTimeStamp]
           ,[UpdateDateTimeStamp]
                                   ,[InsertDate])
                SELECT distinct [cveId]
           ,[id]
           ,[machineId]
           ,[productVendor]
           ,[productName]
           ,[productVersion]
           ,[severity]
                                   ,[InsertDateTimeStamp]
           ,[UpdateDateTimeStamp]
                                   ,[InsertDate]
                FROM STG_DefenderMachineVulnerabilities

                UPDATE dv
                SET dv.Solution=tvs.Solution
    FROM DefenderVulnerabilities dv,TenableVulnerabilitiesSnapshot tvs
                where dv.id =tvs.cveId

END

/****** Object:  StoredProcedure [dbo].[SP_LoadCMDBDimensionFactTables]    Script Date: 8/31/2022 6:13:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =======================================================
-- Author: KPMG
-- Create Date: 06/10/2022
-- Description: Stored Procedure for ServiceNow CMDB data
-- =======================================================


ALTER Procedure [dbo].[SP_LoadCMDBDimensionFactTables]
  AS

BEGIN

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Procedure SP_LoadCMDBDimensionFactTables Started')

                                /*** STEP 1: Drop all the constraints of FactCMDB table ***/
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_AssetKey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_ClassKey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_BusinessCritkey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_ownedby];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_IPAddresskey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_Categorykey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_SubCategorykey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_BusinessServiceKey];
                                ALTER TABLE [dbo].[FactCMDB] DROP CONSTRAINT [CNSTR_GroupCompanykeyCMDB];

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Dropped the constraints of the table FactCMDB')

                                /*** STEP 2: Delete data inside FactCMDB table ***/
                                BEGIN
                                                                TRUNCATE TABLE FactCMDB
                                END;
                                
------------------------------------- DimAssetCMDB -------------------------------------
                
                                /*** STEP 3: Delete data inside DimAssetCMDB table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimAssetCMDB
                                END;
                                
                                /*** STEP 4: Load data in DimAssetCMDB table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimAssetCMDB ([HostName], CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [name_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [name_display_value] IS NOT NUll
                                                                                  AND [name_display_value] !=''                                                  
                                END;

-------------------------------------- DimIPAddress -------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimAssetCMDB')

                                /*** STEP 5: Delete data inside DimIPAddress table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimIPAddress
                                END;
                                
                                /*** STEP 6: Load data in DimIPAddress table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimIPAddress ([IPAddress], CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [ip_address_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [ip_address_display_value] IS NOT NUll
                                                                                  AND [ip_address_display_value] !=''                                                       
                                END;
                                
-------------------------------------- DimCategory ---------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimIPAddress')

                                /*** STEP 7: Delete data inside DimCategory table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimCategory
                                END;
                                
                                /*** STEP 8: Load data in DimCategory table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimCategory ([Category], CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [category_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [category_display_value] IS NOT NUll
                                                                                  AND [category_display_value] !=''
                                END;

-------------------------------------- DimSubCategory -------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimCategory')

                                /*** STEP 9: Delete data inside DimSubCategory table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimSubCategory
                                END;
                                
                                /*** STEP 10: Load data in DimSubCategory table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimSubCategory ([subCategory], CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [subcategory_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [subcategory_display_value] IS NOT NUll
                                                                                  AND [subcategory_display_value] !=''                                                                                                                     
                                END;

------------------------------------- DimBusinessService ------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimSubCategory')

                                /*** STEP 11: Delete data inside DimBusinessService table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimBusinessService
                                END;
                                
                                /*** STEP 12: Load data in DimBusinessService table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimBusinessService (BusinessService, CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [u_business_service_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [u_business_service_display_value] IS NOT NULL
                                                                                  AND [u_business_service_display_value] !=''
                                END;

------------------------------------- DimBusinessCriticality ---------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimBusinessService')

                                /*** STEP 13: Delete data inside DimBusinessCriticality table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimBusinessCriticality
                                END;
                                
                                /*** STEP 14: Load data in DimBusinessCriticality table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimBusinessCriticality (Criticality, CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [u_business_criticality_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [u_business_criticality_display_value] IS NOT NULL
                                                                                  AND [u_business_criticality_display_value] !=''
                                END;
                                
-------------------------------------- DimAssetClass -----------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimBusinessCriticality')

                                /*** STEP 15: Delete data inside DimAssetClass table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimAssetClass
                                END;
                                
                                /*** STEP 16: Load data in DimAssetClass table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimAssetClass (Class, CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT [sys_class_name_display_value], GETDATE(), GETDATE()
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE [sys_class_name_display_value] IS NOT NULL                                                                                        
                                                                                  AND [sys_class_name_display_value] !=''                                                                                              
                                END;
                                
---------------------------------------- DimEmployee -------------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimAssetClass')

                                /*** STEP 17: Delete data inside DimEmployee table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimEmployee
                                END;
                                
                                /*** STEP 18: Load data in DimEmployee table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimEmployee (EmployeeName, CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT tmp.*, GETDATE(), GETDATE() 
                                                                FROM
                                                                (SELECT DISTINCT owned_by_display_value
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE owned_by_display_value IS NOT NULL
                                                                                  AND owned_by_display_value !=''
                                                                UNION All
                                                                SELECT DISTINCT managed_by_display_value
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE managed_by_display_value IS NOT NULL
                                                                                  AND managed_by_display_value !=''
                                                                ) tmp
                                END;

------------------------------------- DimGroupCompanyCMDB --------------------------------------
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DimEmployee')

                                /*** STEP 19: Delete data inside DimGroupCompany table ***/
                                BEGIN
                                                                TRUNCATE TABLE  DimGroupCompanyCMDB
                                END;
                                
                                /*** STEP 20: Load data in DimGroupCompany table from ServiceNowCMDB table ***/
                                BEGIN
                                                                INSERT INTO DimGroupCompanyCMDB (GroupCompany, CreatedOn, UpdatedOn)
                                                                SELECT DISTINCT u_opco_display_value, GETDATE(), GETDATE() 
                                                                FROM ServiceNowCMDB cmdb
                                                                WHERE u_opco_display_value IS NOT NULL
                                                                                  AND u_opco_display_value !=''
                                END;
                                
-------------------------------------------------------------------------------------------------

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into Dimension table DIMGroupCompanyCMDB')

                                /*** STEP 21: Restore all the constraints of FactCMDB table ***/
                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_AssetKey] FOREIGN KEY([AssetKey])
                                REFERENCES [dbo].[DimAssetCMDB] ([AssetKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_AssetKey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_ClassKey] FOREIGN KEY([ClassKey])
                                REFERENCES [dbo].[DimAssetClass] ([ClassKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_ClassKey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_BusinessCritkey] FOREIGN KEY([BusinessCriticalityKey])
                                REFERENCES [dbo].[DimBusinessCriticality] ([BusinessCriticalityKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_BusinessCritkey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_ownedby] FOREIGN KEY([OwnedByKey])
                                REFERENCES [dbo].[DimEmployee] ([EmployeeKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_ownedby];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_IPAddresskey] FOREIGN KEY([IPAddressKey])
                                REFERENCES [dbo].[DimIPAddress] ([IPAddressKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_IPAddresskey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_Categorykey] FOREIGN KEY([CategoryKey])
                                REFERENCES [dbo].[DimCategory] ([CategoryKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_Categorykey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_SubCategorykey] FOREIGN KEY([SubCategoryKey])
                                REFERENCES [dbo].[DimSubCategory] ([SubCategoryKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_SubCategorykey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_BusinessServicekey] FOREIGN KEY([BusinessServiceKey])
                                REFERENCES [dbo].[DimBusinessService] ([BusinessServiceKey]);
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_BusinessServiceKey];

                                ALTER TABLE [dbo].[FactCMDB]  WITH CHECK ADD  CONSTRAINT [CNSTR_GroupCompanykeyCMDB] FOREIGN KEY([GroupCompanyKey])
                                REFERENCES [dbo].[DIMGroupCompanyCMDB] ([GroupCompanyKey])
                                ALTER TABLE [dbo].[FactCMDB] CHECK CONSTRAINT [CNSTR_GroupCompanykeyCMDB]

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Created the Foreign Key Constraints for the Fact table FactCMDB')

                                /*** STEP 21: Load data in FactCMDB table from ServiceNowCMDB table by joining with all the relevant dimension tables ***/
                                BEGIN
                                                                INSERT INTO FactCMDB (AssetKey, IPAddressKey, CategoryKey, SubCategoryKey, GroupCompanyKey,
                                                                BusinessCriticalityKey, ClassKey, OwnedByKey, BusinessServiceKey, CreatedOn, UpdatedOn, AssetCount)
                                                                SELECT DISTINCT dimasset.AssetKey, dimipaddress.IPAddressKey, dimcateg.CategoryKey, dimsubcateg.SubCategoryKey, dimgc.GroupCompanyKey,
                                                                dimbuscriticality.BusinessCriticalityKey, dimassetclass.ClassKey,dimemp.EmployeeKey, dimbusservice.BusinessServiceKey, GETDATE() [CreatedOn], GETDATE() [UpdatedOn], COUNT(*) [Count] 
                                                                FROM ServiceNowCMDB cmdb 
                                                                                LEFT JOIN DimAssetCMDB dimasset ON cmdb.[name_display_value]  = dimasset.HostName
                                                                                LEFT JOIN DimIPAddress dimipaddress ON cmdb.[ip_address_display_value]  = dimipaddress.IPAddress
                                                                                LEFT JOIN DimCategory dimcateg ON cmdb.category_display_value=dimcateg.Category
                                                                                LEFT JOIN DimSubCategory dimsubcateg ON cmdb.subcategory_display_value=dimsubcateg.SubCategory
                                                                                LEFT JOIN DimGroupCompanyCMDB dimgc ON cmdb.u_opco_display_value = dimgc.GroupCompany
                                                                                LEFT JOIN DimBusinessCriticality dimbuscriticality ON cmdb.u_business_criticality_display_value=dimbuscriticality.Criticality
                                                                                LEFT JOIN DimAssetClass dimassetclass ON cmdb.sys_class_name_display_value=dimassetclass.Class 
                                                                                LEFT JOIN DimEmployee dimemp ON cmdb.owned_by_display_value = dimemp.EmployeeName
                                                                                LEFT JOIN DimBusinessService dimbusservice ON cmdb.u_business_service_display_value = dimbusservice.BusinessService
                                                                GROUP BY dimasset.AssetKey, dimipaddress.IPAddressKey, dimcateg.CategoryKey, dimsubcateg.SubCategoryKey, dimgc.GroupCompanyKey, 
                                                                dimbuscriticality.BusinessCriticalityKey, dimassetclass.ClassKey, dimemp.EmployeeKey, dimbusservice.BusinessServiceKey
                                END;

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Loaded data into the Fact table FactCMDB')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Service Now CMDB','Procedure SP_LoadCMDBDimensionFactTables Completed')

END;

/****** Object:  StoredProcedure [dbo].[SP_LoadTenableDimensionFactTables]    Script Date: 8/31/2022 6:13:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =======================================================
-- Author: KPMG
-- Create Date: 06/10/2022
-- Description: Stored Procedure for loading Data Model Tenable Vulnerabilities and Compliances data
-- =======================================================

ALTER   Procedure [dbo].[SP_LoadTenableDimensionFactTables]                                                                                                                                                                                                                                                                
AS                                                                                                                                                                                                                                                                           
BEGIN                                                                                                                                                   
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Procedure SP_LoadTenableDimensionFactTables Started')
                                                                                                                
---------------------------------------- DimRiskFactor ----------------------------------------         
                                                                                                                                                                                                                                                                                
                                                                                                                                                                                                                                                
                                
                                /*** Load data in DimRiskFactor table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                     
                                BEGIN                                   
                                                                INSERT INTO DimRiskFactor ([RiskFactor], [UpdatedOn], CreatedOn)                                                                                                                        
                                                                SELECT DISTINCT [RiskFactor], GETDATE(), GETDATE()                                                                                                      
                                                                FROM STG_TenableSnapshot vuln                                                                                                                            
                                                                WHERE [RiskFactor] IS NOT NULL                                                                                                                              
                                                                AND [RiskFactor] !=''                                                                                                                       
                                                                AND 1=1                                                                                                                               
                                                                AND not exists(                                                                                                                 
                                                                                SELECT 1                                               
                                                                                FROM DimRiskFactor dimRisk                                     
                                                                                WHERE dimRisk.RiskFactor = vuln.RiskFactor                                       
                                                                                )                              
                                END;                                                                                                                                                      
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimRiskFactor loaded')

                                /*** Update data in DimRiskFactor table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                
                                BEGIN                                   
                                                                UPDATE DimRiskFactor                                                                                                                  
                                                                SET DimRiskFactor.RiskFactor = r.RiskFactor,
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimRiskFactor dimRisk                                                                                                                     
                                                                JOIN(                                                                                                                     
                                                                                SELECT DISTINCT [RiskFactor]                                                                                      
                                                                                FROM STG_TenableSnapshot vuln            
                                                                                ) r                                                                            
                                                                ON r.RiskFactor = dimRisk.RiskFactor
                                END;                      
                                
                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimRiskFactor',(SELECT count(*) FROM DimRiskFactor))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimRiskFactor loaded')
---------------------------------------- DimGroupCompany ----------------------------------------                                                                                                                              
                                                                                                                                                                                                
                                                                                
                                /*** Load data in DimGroupCompany table from STG_TenableSnapshot table ***/
                                BEGIN                                                                                                                                                   
                                                                INSERT INTO DimGroupCompany( GroupCompany, UpdatedOn, CreatedOn)                                                                                                         
                                                                SELECT DISTINCT [GroupCompany] , GETDATE(), GETDATE()                                                                                                          
                                                                FROM STG_TenableSnapshot vuln                                                                                                            
                                                                WHERE [GroupCompany] IS NOT NULL                                                                                                   
                                                                AND [GroupCompany] !=''                                                                                                           
                                                                AND 1=1                                                                                                               
                                                                AND not exists(                                                                                                 
                                                                                SELECT 1                               
                                                                                FROM DimGroupCompany dimGC                            
                                                                                WHERE dimGC.GroupCompany = vuln.GroupCompany                   
                                                                                )                              
                                END;                                                                                                                                                      
                                                                                                                                                                                                                                                                                
                                /*** Update data in DimGroupCompany table from STG_TenableSnapshot table ***/                                                                                                                                                                                                     
                                BEGIN                                                                                                                                                   
                                                                UPDATE DimGroupCompany                                                                                                      
                                                                SET DimGroupCompany.GroupCompany = r.GroupCompany,
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimGroupCompany dimGC                                                                                                            
                                                                JOIN(                                                                                                     
                                                                                SELECT DISTINCT [GroupCompany]                                                                                                          
                                                                                FROM STG_TenableSnapshot vuln            
                                                                                ) r                                                                                            
                                                                ON r.GroupCompany = dimGC.GroupCompany                                                                                                   
                                END;                                                                                                                                                      

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimGroupCompany',(SELECT count(*) FROM DimGroupCompany))
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimGroupCompany loaded')

----------------------------------------- DimPlugin --------------------------------------------                                                                                                                          
                                                                                                                                                                                

                                /*** Load data in DimPlugin table from STG_TenableSnapshot table ***/
                                BEGIN                                                                                                                                                   
                                                                INSERT INTO DimPlugin ([Plugin], [PluginName],[FamilyName],[PluginPublicationDate]                                                                                                                
                                                                ,[PluginModificationDate],[RiskCategory], [CVEID],[VulnerabilityPriorityRating], UpdatedOn, CreatedOn)                                                                                                              
                                                                SELECT [Plugin], [PluginName],[FamilyName],[PluginPublicationDate]                                                                                                      
                                                                ,[PluginModificationDate],[Synopsis],[CVEID],[VulnerabilityPriorityRating], GETDATE() [UpdatedOn], GETDATE() [CreatedOn] 
                                                                FROM (
                                                                                SELECT [Plugin], [PluginName], [FamilyName], [PluginPublicationDate], [PluginModificationDate], [Synopsis],
                                                                                [CVEID], [VulnerabilityPriorityRating], GETDATE() [UpdatedOn], GETDATE() [CreatedOn],
                                                                                ROW_NUMBER() OVER (PARTITION BY plugin ORDER BY PluginModificationDate DESC) AS rn
                                                                                FROM STG_TenableSnapshot vuln
                                                                                )t
                                                                                WHERE t.rn=1                                                                                    
                                                                AND [Plugin] IS NOT NULL                                                                                                            
                                                                AND [PluginName] IS NOT NULL
                                                                /*AND [FamilyName] IS NOT NULL                                                                                                           
                                                                AND [PluginPublicationDate] IS NOT NULL                                                                                                             
                                                                AND [PluginModificationDate] IS NOT NULL
                                                                AND [Synopsis] IS NOT NULL
                                                                AND [CVEID] IS NOT NULL             */                                                                                                                                                           
                                                                AND [Plugin] !=''                                                                                                               
                                                                AND [PluginName] !=''                                                                                                   
                                                /*           AND [FamilyName] !=''                                                                                                  
                                                                AND [PluginPublicationDate] !=''                                                                                                               
                                                                AND [PluginModificationDate] !=''            
                                                                AND [Synopsis] !=''
                                                                AND [CVEID] !=''*/                                                                           
                                                                AND 1=1                                                                                                               
                                                                AND not exists(                                                                                                 
                                                                                SELECT 1                                                               
                                                                                FROM DimPlugin dimP                                                   
                                                                                WHERE dimP.Plugin = t.Plugin                                                    
                                                                                /*AND dimP.PluginName = t.PluginName                                                             
                                                                                AND dimP.FamilyName = t.FamilyName                                                 
                                                                                AND dimP.PluginPublicationDate = t.PluginPublicationDate                                                           
                                                                                AND dimP.PluginModificationDate = t.PluginModificationDate
                                                                                AND dimP.RiskCategory = t.Synopsis
                                                                                AND dimP.CVEID = t.CVEID                           
                                                                                AND dimP.VulnerabilityPriorityRating = t.VulnerabilityPriorityRating*/
                                                                                )                                              
                                END;                                                                                                                                                      

                                /*** Update data in DimPlugin table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                        
                                BEGIN                                                                                                                                                   
                                                                UPDATE DimPlugin                                                                                                                          
                                                                SET DimPlugin.Plugin = r.Plugin,                                                                                                 
                                                                                DimPlugin.FamilyName = r.FamilyName,                                                                                                               
                                                                                DimPlugin.PluginPublicationDate= r.PluginPublicationDate,                                                                                                          
                                                                                DimPlugin.PluginModificationDate= r.PluginModificationDate,
                                                                                DimPlugin.RiskCategory = r.Synopsis,
                                                                                DimPlugin.CVEID= r.CVEID,
                                                                                DimPlugin.VulnerabilityPriorityRating = r.VulnerabilityPriorityRating,
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimPlugin dimP                                                                                                                   
                                                                JOIN(                                                                                                                     
                                                                                SELECT * FROM (
                                                                                                SELECT [Plugin], [PluginName],[FamilyName],[PluginPublicationDate]                                                                                                                
                                                                                                ,[PluginModificationDate],[Synopsis],[CVEID],[VulnerabilityPriorityRating], GETDATE() [UpdatedOn], GETDATE() [CreatedOn],
                                                                                                ROW_NUMBER() OVER (PARTITION BY plugin ORDER BY PluginModificationDate DESC) AS rn
                                                                                                FROM STG_TenableSnapshot vuln
                                                                                                )t             )r                                                                                             
                                                                ON r.Plugin = dimP.Plugin                                                                                                                             
                                                /*           AND r.PluginName = dimP.PluginName                                                                                                                  
                                                                AND r.FamilyName = dimP.FamilyName                                                                                                                
                                                                AND r.PluginPublicationDate = dimP.PluginPublicationDate                                                                                                                          
                                                                AND r.PluginModificationDate = dimP.PluginModificationDate
                                                                AND r.Synopsis = dimP.RiskCategory
                                                                AND r.CVEID = dimP.CVEID          
                                                                AND r.VulnerabilityPriorityRating = dimP.VulnerabilityPriorityRating         */                                                                                                                                                                                                                                                                                                                           
                                END;                                                                                                                                                      

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimPlugin',(SELECT count(*) FROM DimPlugin))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimPlugin loaded')

----------------------------------------- DimAssetTenable --------------------------------------------                                                                                                                                                                                                                                            
                                
                                
                                /*** Load data in DimAssetTenable table from STG_TenableSnapshot table ***/                                                                                                                                                                
                                BEGIN                                                                                                                                                   
                                                                INSERT INTO DimAssetTenable ([IPAddress],[HostName], UpdatedOn, CreatedOn)                                                                                                                                                
                                                                SELECT distinct [IP],[HostName], GETDATE() [UpdatedOn], GETDATE() [CreatedOn] 
                                                                FROM STG_TenableSnapshot t
                                                                WHERE                                                                                                                                 
                                                                [IP] IS NOT NULL                                                                                                                                                                                                                                                                                               
                                                                AND [HostName] IS NOT NULL                                                                                                                                    
                                                                AND [IP] !=''                                                                                                                                                                                                                                                                                                                                        
                                                                AND [HostName] !=''                                                                                                                                      
                                                                AND 1=1                                                                                                                                               
                                                                AND not exists(                                                                                                                                 
                                                                                SELECT 1                                                                                               
                                                                                FROM DimAssetTenable dimAT                                                                                 
                                                                                WHERE dimAT.IPAddress = t.[IP]                                                                                               
                                                                                )                                                                                                                                                                                                                                                                                              
                                END;                                                                                                                                                      

                                /*** Update data in DimAssetTenable table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                                          
                                BEGIN                                                                                                                                                   
                                                                UPDATE                DimAssetTenable                                                                                                                            
                                                                SET DimAssetTenable.IPAddress = r.[IP],                                                                                                                
                                                                                DimAssetTenable.HostName = r.HostName,                                                                                                                        
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimAssetTenable dimAT                                                                                                                                 
                                                                JOIN(                                                                                                                                     
                                                                                                SELECT distinct [IP],[HostName],GETDATE() [UpdatedOn], GETDATE() [CreatedOn]
                                                                                                FROM STG_TenableSnapshot
                                                                                                ) r                                                                                                                                            
                                                                ON r.[IP] = dimAT.IPAddress                                                                                                                                       
                                                /*           AND r.MACAddress = dimAT.MACAddress                                                                                                                                            
                                                                AND r.HostName=dimAT.HostName                                                                                                                                       
                                                                AND r.NetBIOSName = dimAT.NetBIOSName      
                                                                AND r.DNSName = dimAT.DNSName       */                                                                                                           
                                END;                                                                                                                                                      

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimAssetTenable',(SELECT count(*) FROM DimAssetTenable))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimAssetTenable loaded')


------------------------------------------ DimSeverity --------------------------------------------                                                                                                                                                                                                                                     
                                
                                                                
                                /*** Load data in DimSeverity table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                                          
                                BEGIN                                                                                                                                                   
                                                                INSERT INTO DimSeverity (Severity, UpdatedOn, CreatedOn)                                                                                                                                       
                                                                SELECT DISTINCT [SeverityName] , GETDATE(), GETDATE()                                                                                                                                             
                                                                FROM STG_TenableSnapshot vuln                                                                                                                                            
                                                                WHERE [SeverityName] IS NOT NULL                                                                                                                                       
                                                                AND [SeverityName] !=''                                                                                                                                               
                                                                AND 1=1                                                                                                                                               
                                                                AND not exists(                                                                                                                                 
                                                                                SELECT 1                                                                                               
                                                                                FROM DimSeverity dimS                                                                                               
                                                                                WHERE dimS.Severity = vuln.SeverityName                                                                                          
                                                                                )                                                                                              
                                END;                                                                                                                                                      

                                /*** Update data in DimSeverity table from STG_TenableSnapshot table ***/
                                BEGIN                                                                                                                                                   
                                                                UPDATE DimSeverity                                                                                                                      
                                                                SET DimSeverity.Severity = r.SeverityName, 
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimSeverity dimS                                                                                                                               
                                                                JOIN(                                                                                                                     
                                                                                SELECT DISTINCT [SeverityName]                                                                                                                              
                                                                                FROM STG_TenableSnapshot vuln            
                                                                                ) r                                                                                                            
                                                                ON r.SeverityName = dimS.Severity                                                                                                                         
                                END;                                                                                                                                                      
                                
                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimSeverity',(SELECT count(*) FROM DimSeverity))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimSeverity loaded')

---------------------------------------- DimExploitsFramework ------------------------------------------                                                                                                                                                                                                                     
                                
                                
                                /*** Load data in DimExploitsFramework table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                                                                                    
                                BEGIN                                                                                                                                                   
                                                                INSERT INTO DimExploitsFramework ([ExploitFrameworks], [ExploitFrameworkDescription], UpdatedOn, CreatedOn)                                                                                                                                              
                                                                SELECT [ExploitEase], [ExploitFrameworks], GETDATE() [UpdatedOn], GETDATE() [CreatedOn] 
                                                                FROM (
                                                                                SELECT distinct [ExploitEase], [ExploitFrameworks], GETDATE() [UpdatedOn], GETDATE() [CreatedOn]
                                                                                FROM STG_TenableSnapshot
                                                                                )t
                                                                                WHERE                                                                                                                                                 
                                                                [ExploitEase] IS NOT NULL                                                                                                                                            
                                                                AND [ExploitFrameworks] IS NOT NULL  
                                                                AND [ExploitEase] !=''                                                                                                                                     
                                                                AND [ExploitFrameworks]!=''      
                                                                AND 1=1                                                                                                                                               
                                                                AND not exists(                                                                                                                                 
                                                                                SELECT 1                                                                                               
                                                                                FROM DimExploitsFramework dimExF                                                                                    
                                                                                WHERE dimExF.ExploitFrameworkDescription = t.ExploitFrameworks                                                                                       
                                                                                )                                                                                              
                                END;                                                                                                                                                      
                                                                                                                                                                                                                                                                                
                                /*** Update data in DimExploitsFramework table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                                                                               
                                BEGIN                                                                                                                                                   
                                                                UPDATE DimExploitsFramework                                                                                                                
                                                                SET DimExploitsFramework.ExploitFrameworks = r.ExploitEase,                                                                                                                  
                                                                                DimExploitsFramework.ExploitFrameworkDescription = r.ExploitFrameworks,
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimExploitsFramework dimExF                                                                                                                    
                                                                JOIN(                                                                                                                     
                                                                                SELECT distinct [ExploitEase], [ExploitFrameworks], GETDATE() [UpdatedOn], GETDATE() [CreatedOn]
                                                                                FROM STG_TenableSnapshot) r                                                                                                 
                                                                ON r.ExploitFrameworks = dimExF.ExploitFrameworkDescription                                                                                                                
                                END;                                                                                                                                                                      

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimExploitsFramework',(SELECT count(*) FROM DimExploitsFramework))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimExploitsFramework loaded')

-------------------------------------------- DimExploitable ----------------------------------------------                                                                                                                                                                                                                         
                                
                                
                                /*** Load data in DimExploitable table from STG_TenableSnapshot table ***/
                                BEGIN                                                                                                                                                   
                                                                INSERT INTO DimExploitable (Exploitable, UpdatedOn, CreatedOn)                                                                                                                           
                                                                SELECT DISTINCT [Exploit] , GETDATE(), GETDATE()                                                                                                                            
                                                                FROM STG_TenableSnapshot vuln                                                                                                                            
                                                                WHERE [Exploit] IS NOT NULL                                                                                                                                                                                                                                     
                                                                AND 1=1                                                                                                                               
                                                                AND not exists(                                                                                                                 
                                                                                SELECT 1                                                                               
                                                                                FROM DimExploitable dimEx                                                                       
                                                                                WHERE dimEx.Exploitable = vuln.Exploit                                                                
                                                                                )                                                                              
                                END;
                                
                                /*** Update data in DimExploitable table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                                                                                               
                                BEGIN                                                                                                                                                   
                                                                UPDATE DimExploitable                                                                                                                
                                                                SET DimExploitable.Exploitable = r.Exploit, 
                                                                                UpdatedOn = GETDATE()
                                                                FROM DimExploitable dimEx                                                                                                                       
                                                                JOIN(                                                                                                                     
                                                                                SELECT DISTINCT [Exploit]                                                                                                                             
                                                                                FROM STG_TenableSnapshot vuln            
                                                                                ) r                                                                                                            
                                                                ON r.Exploit = dimEx.Exploitable                                                                                                                               
                                END;                                                      
                                
                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','DimExploitable',(SELECT count(*) FROM DimExploitable))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Dimension table DimExploitable loaded')

---------------------------------------------- FactTenableVulnerabilities ------------------------------------------------                                                                                                                                                                                                                            
                                
                                
                                /*** Load data in FactTenableVulnerabilities table from STG_TenableSnapshot table ***/             
                                
                                BEGIN
                                                                DELETE FactTenableVulnerabilities WHERE CONVERT(DATE,CreatedOn)=CONVERT(DATE,GETDATE())

                                                                INSERT dbo.FactTenableVulnerabilities (SeverityKey, GroupCompanyKey, PluginKey, ExploitableKey, RiskFactorKey,ExploitsFrameworkKey, AssetKey,VulnerabilitiesCount,CreatedOn,UpdatedOn,SnapshotDateKey,FirstDiscoveredDateKey,LastDiscoveredDateKey)
                                                                SELECT DISTINCT dimS.SeverityKey, dimGC.GroupCompanyKey, dimP.PluginKey, dimEx.ExploitableKey, dimRisk.RiskFactorKey,
                                                                dimExF.ExploitFrameworkKey, dimAT.AssetKey, COUNT(*) [Count], GETDATE() [CreatedOn], GETDATE() [UpdatedOn], 
                                                                dimdate1.DateKey,dimdate2.DateKey,dimdate3.DateKey
                                                                FROM STG_TenableSnapshot vuln
                                                                LEFT JOIN DimSeverity dimS ON  vuln.SeverityName = dimS.Severity
                                                                LEFT JOIN DimGroupCompany dimGC ON  vuln.GroupCompany = dimGC.GroupCompany
                                                                LEFT JOIN DimPlugin dimP ON   vuln.PlugIn = dimP.Plugin
                                                                LEFT JOIN DimAssetTenable dimAT ON  vuln.[IP] = dimAT.IPAddress
                                                                LEFT JOIN DimExploitsFramework dimExF ON   vuln.ExploitFrameworks = dimExF.ExploitFrameworkDescription
                                                                LEFT JOIN DimExploitable dimEx ON  vuln.Exploit = dimEx.Exploitable
                                                                LEFT JOIN DimRiskFactor dimRisk ON  vuln.RiskFactor = dimRisk.RiskFactor
                                                                LEFT JOIN DimDate AS dimdate1 ON dimdate1.CalendarDate = CONVERT(DATE,vuln.IngestionDate)
                                                                LEFT JOIN DimDate AS dimdate2 ON dimdate2.CalendarDate = CONVERT(DATE,vuln.FirstDiscoveredDATE)
                                                                LEFT JOIN DimDate AS dimdate3 ON dimdate3.CalendarDate = CONVERT(DATE,vuln.LastObservedDATE)
                                                                where vuln.RecordType='vulnerability'
                                                                GROUP BY dimS.SeverityKey, dimGC.GroupCompanyKey, dimP.PluginKey, dimEx.ExploitableKey,dimExF.ExploitFrameworkKey, 
                                                                dimRisk.RiskFactorKey,dimAT.AssetKey,dimdate1.DateKey,dimdate2.DateKey,dimdate3.DateKey
                                END;

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','FactTenableVulnerabilities',(SELECT count(*) FROM FactTenableVulnerabilities WHERE CONVERT(DATE,CreatedOn)=CONVERT(DATE,GETDATE())))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Fact table FactTenableVulnerabilities loaded')

---------------------------------------------- FactTenableCompliances ------------------------------------------------                                                                                                                                                                                                                
                                
                                /*** Load data in FactTenableCompliance table from STG_TenableSnapshot table ***/                                                                                                                                                                                                                                                                  
                                BEGIN

                                                                DELETE FactTenableCompliances WHERE CONVERT(DATE,CreatedOn)=CONVERT(DATE,GETDATE())

                                                                INSERT dbo.FactTenableCompliances (SeverityKey, GroupCompanyKey, PluginKey, ExploitableKey, RiskFactorKey,ExploitsFrameworkKey, AssetKey,VulnerabilitiesCount,CreatedOn,UpdatedOn,SnapshotDateKey,FirstDiscoveredDateKey,LastDiscoveredDateKey)
                                                                SELECT DISTINCT dimS.SeverityKey, dimGC.GroupCompanyKey, dimP.PluginKey, dimEx.ExploitableKey, dimRisk.RiskFactorKey,
                                                                dimExF.ExploitFrameworkKey, dimAT.AssetKey, COUNT(*) [Count], GETDATE() [CreatedOn], GETDATE() [UpdatedOn], 
                                                                dimdate1.DateKey,dimdate2.DateKey,dimdate3.DateKey
                                                                FROM STG_TenableSnapshot vuln
                                                                LEFT JOIN DimSeverity dimS ON  vuln.SeverityName = dimS.Severity
                                                                LEFT JOIN DimGroupCompany dimGC ON  vuln.GroupCompany = dimGC.GroupCompany
                                                                LEFT JOIN DimPlugin dimP ON   vuln.PlugIn = dimP.Plugin
                                                                LEFT JOIN DimAssetTenable dimAT ON  vuln.[IP] = dimAT.IPAddress
                                                                LEFT JOIN DimExploitsFramework dimExF ON   vuln.ExploitFrameworks = dimExF.ExploitFrameworkDescription
                                                                LEFT JOIN DimExploitable dimEx ON  vuln.Exploit = dimEx.Exploitable
                                                                LEFT JOIN DimRiskFactor dimRisk ON  vuln.RiskFactor = dimRisk.RiskFactor
                                                                LEFT JOIN DimDate AS dimdate1 ON dimdate1.CalendarDate = CONVERT(DATE,vuln.IngestionDate)
                                                                LEFT JOIN DimDate AS dimdate2 ON dimdate2.CalendarDate = CONVERT(DATE,vuln.FirstDiscoveredDATE)
                                                                LEFT JOIN DimDate AS dimdate3 ON dimdate3.CalendarDate = CONVERT(DATE,vuln.LastObservedDATE)
                                                                where vuln.RecordType='compliance'
                                                                GROUP BY dimS.SeverityKey, dimGC.GroupCompanyKey, dimP.PluginKey, dimEx.ExploitableKey,dimExF.ExploitFrameworkKey, 
                                                                dimRisk.RiskFactorKey,dimAT.AssetKey,dimdate1.DateKey,dimdate2.DateKey,dimdate3.DateKey
                                END;

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableDimensionFactTables','FactTenableCompliances',(SELECT count(*) FROM FactTenableCompliances WHERE CONVERT(DATE,CreatedOn)=CONVERT(DATE,GETDATE())))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Fact table FactTenableCompliances loaded')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Procedure SP_LoadTenableDimensionFactTables Completed')

                                                                                                                                                                
END;                                                                                                                                                                                                                                                                      

/****** Object:  StoredProcedure [dbo].[SP_LoadTenableInfoSnapshotData]    Script Date: 8/31/2022 6:14:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ==============================================================
-- Author: KPMG
-- Create Date: 22/06/2022
-- Description: Stored Procedure for Tenable Patched data
-- ==============================================================

ALTER PROCEDURE [dbo].[SP_LoadTenableInfoSnapshotData]
AS
BEGIN
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Info Snapshot','Procedure SP_LoadTenableInfoSnapshotData Started')

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Info Snapshot','SP_LoadTenableInfoSnapshotData','STG_TenableInfoSnapshot',(SELECT count(*) FROM STG_TenableInfoSnapshot))

                                /*** STEP 1: Load data and add new columns with customized information ***/

                                UPDATE STG_TenableInfoSnapshot
                                SET [PluginModificationDate] = DATEADD(s, [pluginModDate], '1970-01-01 00:00:00'),
                                                [timestampDATE] = DATEADD(s,[timestamp], '1970-01-01 00:00:00'),
                                                [PatchPublicationDate] = DATEADD(s,[patchPubDate], '1970-01-01 00:00:00'),
                                                [VulnPublicationDate] = DATEADD(s,[vulnPubDate], '1970-01-01 00:00:00'),
                                                [LastObservedDATE] = DATEADD(s,[LastObserved], '1970-01-01 00:00:00'),
                                                [FirstDiscoveredDATE] = DATEADD(s,[FirstDiscovered], '1970-01-01 00:00:00'),
                                                [PluginPublicationDate] = DATEADD(s,[pluginPubDate] , '1970-01-01 00:00:00'),
                                                [IngestionDate] = GETDATE(),
                                                [NetBIOSName] = dbo.isEmpty([NetBIOSName],'None'),
                                                [DNSName] = dbo.isEmpty([DNSName],'None'),
                                                [ExploitFrameworks] = dbo.isEmpty([ExploitFrameworks],'None'),
                                                [RecordType] = CASE 
                                                                                                   WHEN RepositoryName like '%Compliance%' THEN 'Compliance'
                                                                                                   ELSE 'Vulnerability'
                                                                                                   END,
                                                
                                                [DMZindicator] = CASE 
                                                                                                                 WHEN RepositoryName like '%DMZ%' THEN 'Y'
                                                                                                                ELSE 'N'
                                                                                                                END,

                                                [GroupCompany] = CASE
																							WHEN (RepositoryName LIKE '%CompanyA%') THEN 'A'
																							WHEN (RepositoryName LIKE '%CompanyB%') THEN 'B'
																							WHEN (RepositoryName LIKE '%CompanyC%') THEN 'C'
																							WHEN (RepositoryName LIKE '% CompanyD %') THEN 'D'
																							WHEN (RepositoryName LIKE '% CompanyE %') THEN 'E'
																							WHEN (RepositoryName LIKE '% CompanyF %') THEN 'F'
																							WHEN (RepositoryName LIKE '% CompanyG %') THEN 'G'
																							WHEN (RepositoryName LIKE '% CompanyH %') THEN 'H'
																							WHEN (RepositoryName LIKE '% CompanyI %') THEN 'I'
																							WHEN (RepositoryName LIKE '% CompanyJ %') THEN 'J'
																							WHEN (RepositoryName LIKE '% CompanyK %') THEN 'K'
																							WHEN (RepositoryName LIKE '% CompanyL %') THEN 'L'
																							WHEN (RepositoryName LIKE '% CompanyM %') THEN 'M'

                                                                                                                END

                                UPDATE STG_TenableInfoSnapshot
                                SET [HostName] = CASE
                                                                                                WHEN [NetBIOSName] = 'None' THEN REPLACE(LEFT([DNSName],CHARINDEX('.',[DNSName])),'.','')
                                                                                                WHEN [NetBIOSName] != 'None' THEN SUBSTRING([NetBIOSName],CHARINDEX('\',[NetBIOSName])+1,LEN(NetBIOSName)-CHARINDEX('\',[NetBIOSName]))
                                                                                                WHEN [DNSName] = 'None' THEN SUBSTRING([NetBIOSName],CHARINDEX('\',[NetBIOSName])+1,LEN(NetBIOSName)-CHARINDEX('\',[NetBIOSName]))
                                                                                                END

                                UPDATE STG_TenableInfoSnapshot
                                SET [HostName] = 'None'
                                WHERE [NetBIOSName] = 'None' and [DNSName] = 'None'

                                UPDATE STG_TenableInfoSnapshot
                                SET [Plugin] = dbo.isEmpty([Plugin], '0'),                
                                                [PluginName] = dbo.isEmpty([PluginName], 'None'),        
                                    [FamilyName]= dbo.isEmpty([FamilyName],'Nome'),
                                    [PluginPublicationDate]            = dbo.isEmpty([PluginPublicationDate], '1970-01-01 00:00:00'),                                                                   
                                                [PluginModificationDate] = dbo.isEmpty([PluginModificationDate], '1970-01-01 00:00:00'),
                                                [Synopsis] = dbo.isEmpty([Synopsis],'None'),
                                    [CVEID] = dbo.isEmpty([CVEID],'None'),
                                                [VulnerabilityPriorityRating] = dbo.isEmpty( [VulnerabilityPriorityRating], '0.0'),
                                                [IP]= dbo.isEmpty([IP],'None'),
                                                [MACAddress] = dbo.isEmpty([MACAddress],'None'),
                                                [ExploitEase] = dbo.isEmpty([ExploitEase],'None'), 
                                                [ExploitFrameworks] = dbo.isEmpty([ExploitFrameworks],'None'), 
                                                [SeverityName] = dbo.isEmpty([SeverityName],'None'), 
                                                [Exploit] = dbo.isEmpty([Exploit],'0'), 
                                                [GroupCompany] = dbo.isEmpty([GroupCompany],'None'), 
                                                [RiskFactor] = dbo.isEmpty([RiskFactor],'None')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Info Snapshot','Transformation completed on the staging table STG_TenableInfoSnapshot')

                                /*** STEP 2: Insert data from the Staging table into the final Tenable Info Snapshot table ***/

                                DELETE TenableInfoSnapshot WHERE CONVERT(DATE,InsertDate)=CONVERT(DATE,GETDATE())

                                INSERT INTO TenableInfoSnapshot ([IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity, SeverityID, SeverityName, SeverityDescription,
                                                                MitigatedFlag, RiskAccepted, RiskRecasted, PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, StigSeverity,
                                                                VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, 
                                                                CheckType, [Version], PluginOutput, OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType, 
                                                                RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate, FirstDiscoveredDATE, 
                                                                LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate, GroupCompany,  RecordType,  DMZindicator, InsertDate, UpdateDate, InsertDateTimestamp
                                                                ) 
                                SELECT [IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity,
                                                                SeverityID, SeverityName, SeverityDescription, MitigatedFlag, RiskAccepted, RiskRecasted, 
                                                                PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, 
                                                                StigSeverity, VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, 
                                                                CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, CheckType, [Version], PluginOutput, 
                                                                OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType,
                                                                RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate,
                                                                FirstDiscoveredDATE, LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate,
                                                                GroupCompany,  RecordType, DMZindicator, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, convert(date, getdate()) 
                                FROM STG_TenableInfoSnapshot
                                
                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Info Snapshot','SP_LoadTenableInfoSnapshotData','TenableInfoSnapshot',(SELECT COUNT(*) FROM TenableInfoSnapshot WHERE CONVERT(DATE,InsertDate)=CONVERT(DATE,GETDATE())))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Info Snapshot','Loaded data into the table TenableInfoSnapshot from staging table STG_TenableInfoSnapshot')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Info Snapshot','Procedure SP_LoadTenableInfoSnapshotData completed')
END

/****** Object:  StoredProcedure [dbo].[SP_LoadTenablePatchedData]    Script Date: 8/31/2022 6:14:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- ==============================================================
-- Author: KPMG
-- Create Date: 22/06/2022
-- Description: Stored Procedure for Tenable Patched data
-- ==============================================================

ALTER PROCEDURE [dbo].[SP_LoadTenablePatchedData]
AS
BEGIN


  INSERT INTO DataIngestionLog (Pipeline, [Description])
    VALUES ('Tenable Vulnerabilities Patched', 'Procedure SP_LoadTenablePatchedData Started')

  INSERT INTO DataIngestionSummary (Pipeline, [Procedure], [Table], [RecordsIngested])
    VALUES ('Tenable Vulnerabilities Patched', 'SP_LoadTenablePatchedData', 'STG_TenablePatched', (SELECT COUNT(*) FROM STG_TenablePatched))

  -- STEP 1: Load data and add new columns with customize information 
  UPDATE STG_TenablePatched
  SET [PluginModificationDate] = DATEADD(s, [pluginModDate], '1970-01-01 00:00:00'),
      [timestampDATE] = DATEADD(s, [timestamp], '1970-01-01 00:00:00'),
      [PatchPublicationDate] = DATEADD(s, [patchPubDate], '1970-01-01 00:00:00'),
      [VulnPublicationDate] = DATEADD(s, [vulnPubDate], '1970-01-01 00:00:00'),
      [LastObservedDATE] = DATEADD(s, [LastObserved], '1970-01-01 00:00:00'),
      [FirstDiscoveredDATE] = DATEADD(s, [FirstDiscovered], '1970-01-01 00:00:00'),
      [PluginPublicationDate] = DATEADD(s, [pluginPubDate], '1970-01-01 00:00:00'),
      [IngestionDate] = GETDATE(),
      [NetBIOSName] = dbo.isEmpty([NetBIOSName], 'None'),
      [DNSName] = dbo.isEmpty([DNSName], 'None'),
      [ExploitFrameworks] = dbo.isEmpty([ExploitFrameworks], 'None'),
      [RecordType] =
                    CASE
                      WHEN RepositoryName LIKE '%Compliance%' THEN 'Compliance'
                      ELSE 'Vulnerability'
                    END,

      [DMZindicator] =
                      CASE
                        WHEN RepositoryName LIKE '%DMZ%' THEN 'Y'
                        ELSE 'N'
                      END,
      [GroupCompany] =
                      CASE
                        WHEN (RepositoryName LIKE '%CompanyA%') THEN 'A'
                        WHEN (RepositoryName LIKE '%CompanyB%') THEN 'B'
                        WHEN (RepositoryName LIKE '%CompanyC%') THEN 'C'
                        WHEN (RepositoryName LIKE '% CompanyD %') THEN 'D'
                        WHEN (RepositoryName LIKE '% CompanyE %') THEN 'E'
                        WHEN (RepositoryName LIKE '% CompanyF %') THEN 'F'
                        WHEN (RepositoryName LIKE '% CompanyG %') THEN 'G'
                        WHEN (RepositoryName LIKE '% CompanyH %') THEN 'H'
                        WHEN (RepositoryName LIKE '% CompanyI %') THEN 'I'
                        WHEN (RepositoryName LIKE '% CompanyJ %') THEN 'J'
                        WHEN (RepositoryName LIKE '% CompanyK %') THEN 'K'
                        WHEN (RepositoryName LIKE '% CompanyL %') THEN 'L'
                        WHEN (RepositoryName LIKE '% CompanyM %') THEN 'M'
                      END


  UPDATE STG_TenablePatched
  SET [HostName] =
                  CASE
                    WHEN [NetBIOSName] = 'None' THEN REPLACE(LEFT([DNSName], CHARINDEX('.', [DNSName])), '.', '')
                    WHEN [NetBIOSName] != 'None' THEN SUBSTRING([NetBIOSName], CHARINDEX('\', [NetBIOSName]) + 1, LEN(NetBIOSName) - CHARINDEX('\', [NetBIOSName]))
                    WHEN [DNSName] = 'None' THEN SUBSTRING([NetBIOSName], CHARINDEX('\', [NetBIOSName]) + 1, LEN(NetBIOSName) - CHARINDEX('\', [NetBIOSName]))
                  END

  UPDATE STG_TenablePatched
 SET [HostName] = 'None'
  WHERE [NetBIOSName] = 'None'
  AND [DNSName] = 'None'

  UPDATE STG_TenablePatched
  SET BusinessService = u_business_service_display_value
  FROM STG_TenablePatched A
  LEFT JOIN ServiceNowCMDB B
    ON A.IP = B.ip_address_display_value

  INSERT INTO DataIngestionLog (Pipeline, [Description])
    VALUES ('Tenable Vulnerabilities Patched', 'Transformation completed on the staging table STG_TenablePatched')

  -- Insert from Staging table into final Tenable Patched table

  DELETE TenablePatched
  WHERE CONVERT(date, InsertDate) = CONVERT(date, GETDATE())

  INSERT INTO TenablePatched ([IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity, SeverityID, SeverityName, SeverityDescription, MitigatedFlag, RiskAccepted, RiskRecasted, PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, StigSeverity, VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, CheckType, [Version], PluginOutput, OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType, RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate, FirstDiscoveredDate, LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate, GroupCompany, RecordType, DMZindicator, InsertDate, UpdateDate, BusinessService)
    SELECT [IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity, SeverityID, SeverityName, SeverityDescription, MitigatedFlag, RiskAccepted, RiskRecasted, PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, StigSeverity, VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, CheckType, [Version], PluginOutput, OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType, RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate, FirstDiscoveredDATE, LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate, GroupCompany, RecordType, DMZindicator, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, BusinessService
    FROM STG_TenablePatched

  INSERT INTO DataIngestionSummary (Pipeline, [Procedure], [Table], [RecordsIngested])
    VALUES ('Tenable Vulnerabilities Patched', 'SP_LoadTenablePatchedData', 'TenablePatched', (SELECT COUNT(*) FROM TenablePatched WHERE CONVERT(date, InsertDate) = CONVERT(date, GETDATE())))

  INSERT INTO DataIngestionLog (Pipeline, [Description])
    VALUES ('Tenable Vulnerabilities Patched', 'Loaded data into the table TenablePatched from the staging table STG_TenablePatched')

  INSERT INTO DataIngestionLog (Pipeline, [Description])
    VALUES ('Tenable Vulnerabilities Patched', 'Procedure SP_LoadTenablePatchedData Completed')
END

/****** Object:  StoredProcedure [dbo].[SP_LoadTenableSnapshotData]    Script Date: 8/31/2022 6:14:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ==============================================================
-- Author: KPMG
-- Create Date: 22/06/2022
-- Description: Stored Procedure for Tenable Snapshot data
-- ==============================================================

ALTER PROCEDURE [dbo].[SP_LoadTenableSnapshotData]
AS
BEGIN
                                
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Procedure SP_LoadTenableSnapshotData Started')

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableSnapshotData','STG_TenableSnapshot',(SELECT COUNT(*) FROM STG_TenableSnapshot))

                                /*** STEP 1: Load data and add new columns with customized information ***/

                                UPDATE STG_TenableSnapshot
                                SET [PluginModificationDate] = DATEADD(s, [pluginModDate], '1970-01-01 00:00:00'),
                                                [timestampDATE] = DATEADD(s,[timestamp], '1970-01-01 00:00:00'),
                                                [PatchPublicationDate] = DATEADD(s,[patchPubDate], '1970-01-01 00:00:00'),
                                                [VulnPublicationDate] = DATEADD(s,[vulnPubDate], '1970-01-01 00:00:00'),
                                                [LastObservedDATE] = DATEADD(s,[LastObserved], '1970-01-01 00:00:00'),
                                                [FirstDiscoveredDATE] = DATEADD(s,[FirstDiscovered], '1970-01-01 00:00:00'),
                                                [PluginPublicationDate] = DATEADD(s,[pluginPubDate] , '1970-01-01 00:00:00'),
                                                [IngestionDate] = GETDATE(),
                                                [NetBIOSName] = dbo.isEmpty([NetBIOSName],'None'),
                                                [DNSName] = dbo.isEmpty([DNSName],'None'),
                                                [ExploitFrameworks] = dbo.isEmpty([ExploitFrameworks],'None'),
                                                [RecordType] = CASE 
                                                                                                   WHEN RepositoryName like '%Compliance%' THEN 'Compliance'
                                                                                                   ELSE 'Vulnerability'
                                                                                                   END,
                                                
                                                [DMZindicator] = CASE 
                                                                                                 WHEN RepositoryName like '%DMZ%' THEN 'Y'
                                                                                                                ELSE 'N'
                                                                                                     END,

                                                [GroupCompany] = CASE
																							WHEN (RepositoryName LIKE '%CompanyA%') THEN 'A'
																							WHEN (RepositoryName LIKE '%CompanyB%') THEN 'B'
																							WHEN (RepositoryName LIKE '%CompanyC%') THEN 'C'
																							WHEN (RepositoryName LIKE '% CompanyD %') THEN 'D'
																							WHEN (RepositoryName LIKE '% CompanyE %') THEN 'E'
																							WHEN (RepositoryName LIKE '% CompanyF %') THEN 'F'
																							WHEN (RepositoryName LIKE '% CompanyG %') THEN 'G'
																							WHEN (RepositoryName LIKE '% CompanyH %') THEN 'H'
																							WHEN (RepositoryName LIKE '% CompanyI %') THEN 'I'
																							WHEN (RepositoryName LIKE '% CompanyJ %') THEN 'J'
																							WHEN (RepositoryName LIKE '% CompanyK %') THEN 'K'
																							WHEN (RepositoryName LIKE '% CompanyL %') THEN 'L'
																							WHEN (RepositoryName LIKE '% CompanyM %') THEN 'M'

                                                                                                                END
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Update 1 Completed')

                                /***  Extract Hostname from NetBIOSName or DNSName and add that to the Staging Table***/

                                UPDATE STG_TenableSnapshot
                                SET [HostName] = CASE
                                                                                                WHEN [NetBIOSName] = 'None' THEN REPLACE(LEFT([DNSName],CHARINDEX('.',[DNSName])),'.','')
                                                                                                WHEN [NetBIOSName] != 'None' THEN SUBSTRING([NetBIOSName],CHARINDEX('\',[NetBIOSName])+1,LEN(NetBIOSName)-CHARINDEX('\',[NetBIOSName]))
                                                                                                WHEN [DNSName] = 'None' THEN SUBSTRING([NetBIOSName],CHARINDEX('\',[NetBIOSName])+1,LEN(NetBIOSName)-CHARINDEX('\',[NetBIOSName]))
                                                                                                END      
                                                                                                

                                /***  Update default value of None to HostName where NetBIOSName and DNSName are not available***/

                                UPDATE STG_TenableSnapshot
                                SET [HostName] = 'None'
                                WHERE [NetBIOSName] = 'None' and [DNSName] = 'None'

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Update 2 Completed')

                                UPDATE STG_TenableSnapshot
                                SET [Plugin] = dbo.isEmpty([Plugin], '0'),                
                                                [PluginName] = dbo.isEmpty([PluginName], 'None'),        
                                                [FamilyName]= dbo.isEmpty([FamilyName],'Nome'),
                                                [PluginPublicationDate]                 = dbo.isEmpty([PluginPublicationDate], '1970-01-01 00:00:00'),                                                                           
                                                [PluginModificationDate] = dbo.isEmpty([PluginModificationDate], '1970-01-01 00:00:00'),
                                                [Synopsis] = dbo.isEmpty([Synopsis],'None'),
                                                [CVEID] = dbo.isEmpty([CVEID],'None'),
                                                [VulnerabilityPriorityRating] = dbo.isEmpty( [VulnerabilityPriorityRating], '0.0'),
                                                [IP]= dbo.isEmpty([IP],'None'),
                                                [MACAddress] = dbo.isEmpty([MACAddress],'None'),
                                                [ExploitEase] = dbo.isEmpty([ExploitEase],'None'), 
                                                [ExploitFrameworks] = dbo.isEmpty([ExploitFrameworks],'None'), 
                                                [SeverityName] = dbo.isEmpty([SeverityName],'None'), 
                                                [Exploit] = dbo.isEmpty([Exploit],'0'), 
                                                [GroupCompany] = dbo.isEmpty([GroupCompany],'None'), 
                                                [RiskFactor] = dbo.isEmpty([RiskFactor],'None')
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Compliance Snapshot','Compliance Control Grouping Started')

                                /***  Add ISO and NESA Indicators  ***/

                                UPDATE STG_TenableSnapshot
                                SET    ISOIndicator = 'Y'
                                WHERE  pluginoutput LIKE '%ISO/IEC-27001|%' and RecordType = 'Compliance';

                                UPDATE STG_TenableSnapshot
                                SET    NESAIndicator = 'Y'
                                WHERE  pluginoutput LIKE '%NESA|%' and RecordType = 'Compliance';

                                UPDATE STG_TenableSnapshot
                                SET    ISOIndicator = 'N'
                                WHERE  ISOIndicator is NULL;

                                UPDATE STG_TenableSnapshot
                                SET    NESAIndicator = 'N'
                                WHERE  NESAIndicator is NULL;

                                /***  Add Class, Category and Technology to Tenable staging  ***/
                                UPDATE A
                                SET    A.class = B.class,
                                                   A.category = B.category,
                                                   A.technology = B.technology
                                FROM  STG_TenableSnapshot A
                                                   LEFT JOIN classlookup B
                                                                                  ON A.operatingsystem LIKE Concat('%', B.identificationlogic, '%') ;

                                /***  Compliance Grouping  ***/
                                UPDATE t1
                                SET    t1.compliancegroup = t2.compliancegroup
                                FROM   stg_tenablesnapshot t1,
                                                   tenableisocompliancegroup t2
                                WHERE  t1.pluginoutput LIKE Concat('%', t2.isoreference, '%')
                                                   AND t1.[recordtype] = 'Compliance'
                                                   AND t1.severityname = 'High'
                                                   AND t1.compliancegroup IS NULL

                                INSERT INTO dataingestionlog
                                                                                (pipeline,
                                                                                [description])
                                VALUES     ('Tenable Compliance Snapshot',
                                                                                'Tenable Compliance Control Group Correlation Completed')


                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Compliance Snapshot','Tenable Compliance Control Group Summary Loaded')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Transformation completed on the staging table STG_TenableSnapshot')

                                /*** STEP 2: Insert data from the Staging table into the final Tenable Vulnerabilities Snapshot table for the last 60 days ***/

                                DELETE TenableVulnerabilitiesSnapshot WHERE CONVERT(DATE,InsertDate)=CONVERT(DATE,GETDATE())

                                INSERT INTO TenableVulnerabilitiesSnapshot ([IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity, SeverityID, SeverityName, SeverityDescription,
                                                                MitigatedFlag, RiskAccepted, RiskRecasted, PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, StigSeverity,
                                                                VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, 
                                                                CheckType, [Version], PluginOutput, OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType, 
                                                                RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate, FirstDiscoveredDATE, 
                                                                LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate, GroupCompany,  RecordType,  DMZindicator, [class],[Category],[Technology], InsertDate, UpdateDate,InsertDateTimestamp
                                                                ) 
                                SELECT [IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity,
                                                                SeverityID, SeverityName, SeverityDescription, MitigatedFlag, RiskAccepted, RiskRecasted, 
                                                                PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, 
                                                                StigSeverity, VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, 
                                                                CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, CheckType, [Version], PluginOutput, 
                                                                OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType,
                                                                RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate,
                                                                FirstDiscoveredDATE, LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate,
                                                                GroupCompany,  RecordType, DMZindicator, [class],[Category],[Technology],convert(date,IngestionDate), IngestionDate, IngestionDate 
                                FROM STG_TenableSnapshot
                                WHERE [RecordType] = 'Vulnerability'

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableSnapshotData','TenableVulnerabilitiesSnapshot',(SELECT COUNT(*) FROM TenableVulnerabilitiesSnapshot WHERE CONVERT(DATE,InsertDate)=CONVERT(DATE,GETDATE())))

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Loaded data into the table TenableVulnerabilitiesSnapshot from the staging table STG_TenableSnapshot')



                                /*** STEP 3: Insert data from the Staging table into the final Tenable Compliance Snapshot table for the last 60 days ***/



                                DELETE TenableComplianceSnapshot WHERE CONVERT(DATE,InsertDate)=CONVERT(DATE,GETDATE())

                                INSERT INTO TenableComplianceSnapshot ([IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity, SeverityID, SeverityName, SeverityDescription,
                                                                                                MitigatedFlag, RiskAccepted, RiskRecasted, PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, StigSeverity,
                                                                                                VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, 
                                                                                                CheckType, [Version], PluginOutput, OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType, 
                                                                                                RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate, FirstDiscoveredDATE, 
                                                                                                LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate, GroupCompany,  RecordType,  DMZindicator, [ComplianceGroup],[ISOIndicator],[NESAIndicator],[class],[Category],[Technology],InsertDate, UpdateDate,InsertDateTimeStamp
                                                                                                
                                ) 
                                SELECT [IP], [PORT], Protocol, Plugin, DNSName, NetBIOSName, HostName, RepositoryID, MACAddress, severity,
                                                                SeverityID, SeverityName, SeverityDescription, MitigatedFlag, RiskAccepted, RiskRecasted, 
                                                                PluginName, Exploit, ExploitEase, ExploitFrameworks, Synopsis, SeeAlso, RiskFactor, 
                                                                StigSeverity, VulnerabilityPriorityRating, vprContext, CVSSV2BaseScore, CVSSV2TemporalScore, 
                                                                CVSSV2Vector, CVSSV3BaseScore, CVSSV3Vector, CPE, BID, CheckType, [Version], PluginOutput, 
                                                                OperatingSystem, RiskRecastedRuleComment, RiskAcceptedRuleComment, FamilyID, FamilyName, FamilyType,
                                                                RepositoryName, RepositoryDescription, pluginInfo, CVEID, [Description], Solution, PluginPublicationDate,
                                                                FirstDiscoveredDATE, LastObservedDATE, VulnPublicationDate, PatchPublicationDate, PluginModificationDate,
                                                                GroupCompany,  RecordType, DMZindicator,[ComplianceGroup],[ISOIndicator],[NESAIndicator],[class],[Category],[Technology], convert(date,IngestionDate) , IngestionDate,IngestionDate
                                FROM STG_TenableSnapshot
                                WHERE [RecordType] = 'Compliance' and SeverityName='High'
                                
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Loaded data into the table TenableComplianceSnapshot from the staging table STG_TenableSnapshot')

                                                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Mitigated Compliance ','Start Load of Mitigated Compliance table from TenableComplianceSnapshot table');

INSERT INTO MitigatedCompliance
  SELECT *,
         (SELECT
           MAX(insertdate)
         FROM TenableComplianceSnapshot)
         AS insertdate
  FROM (SELECT
    ip,
    HostName,
    GroupCompany,
    class,
    Category,
    PlugIn,
    PluginName,
    Description,
    FirstDiscoveredDate
  FROM TenableComplianceSnapshot
  WHERE insertdate = (SELECT
    MAX(insertdate)
  FROM TenableComplianceSnapshot
  WHERE insertdate < (SELECT
    MAX(insertdate)
  FROM TenableComplianceSnapshot))
  EXCEPT
  SELECT
    ip,
    HostName,
    GroupCompany,
    class,
    Category,
    PlugIn,
    PluginName,
    Description,
    FirstDiscoveredDate
  FROM TenableComplianceSnapshot
  WHERE insertdate = (SELECT
    MAX(insertdate)
  FROM TenableComplianceSnapshot)) K;


  INSERT INTO NewVulnerabilityandCompliance
  SELECT
    [IP],
    [HostName],
    [GroupCompany],
    [class],
    [Category],
    [plugin],
    [PluginName],
    [Description],
                [DMZIndicator],
    [FirstDiscoveredDate],
    [InsertDate],
    [RecordType],
                null as BusinessService
  FROM TenableVulnerabilitiesSnapshot
  WHERE DATEDIFF(DAY, [FirstDiscoveredDate], [InsertDate]) <= 7
  AND insertdate = (SELECT
    MAX(insertdate)
  FROM TenableVulnerabilitiesSnapshot)

INSERT INTO NewVulnerabilityandCompliance
  SELECT
    [IP],
    [HostName],
    [GroupCompany],
    [class],
    [Category],
    [plugin],
    [PluginName],
    [Description],
                [DMZIndicator],
    [FirstDiscoveredDate],
    [InsertDate],
    [RecordType], 
                null as BusinessService
  FROM TenableComplianceSnapshot
  WHERE DATEDIFF(DAY, [FirstDiscoveredDate], [InsertDate]) <= 7
  AND insertdate = (SELECT
    MAX(insertdate)
  FROM TenableComplianceSnapshot)
  
UPDATE NewVulnerabilityandCompliance
SET BusinessService = B.u_business_service_display_value
FROM NewVulnerabilityandCompliance A
LEFT JOIN ServiceNowCMDB B
  ON A.IP = B.ip_address_display_value
WHERE insertdate = (SELECT
  MAX(insertdate)
FROM NewVulnerabilityandCompliance)

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Mitigated Compliance ','Completed the load of Mitigated Compliance table from TenableComplianceSnapshot table');

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('Tenable Vulnerabilities Snapshot','SP_LoadTenableSnapshotData','TenableComplianceSnapshot',(SELECT COUNT(*) FROM TenableComplianceSnapshot WHERE CONVERT(DATE,InsertDate)=CONVERT(DATE,GETDATE())))
                                
                                /*** Executing the procedure to load the data model for Tenable ***/
                    EXEC SP_LoadTenableDimensionFactTables

                                /*** Loading the table after correlation between TenableComplianceModel and CMDBModel***/
                                select * into #TenableComplianceScans from VW_TenableComplianceScans
                                drop table TenableComplianceScans
                                select * into TenableComplianceScans from #TenableComplianceScans

                                                insert into TenableComplianceSnapshotArchived
                                                select * from TenableComplianceSnapshot
                                                where InsertDate < convert(date,getdate()-30);


                                                delete TenableComplianceSnapshot
                                                where InsertDate < convert(date,getdate()-30);

                                delete mitigatedcompliance
                                where InsertDate < convert(date,getdate()-30);

                                /*** Loading the table to store the final table with ComplianceControlGrouping ***/
                                /*
                                SELECT convert(date,getdate()) InsertDate,GroupCompany,SeverityName,PluginOutput  into #tenableComplianceSnapshotLatest from STG_TenableSnapshot
                                WHERE [RecordType] = 'Compliance'

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Tenable Compliance Latest Snapshot Loaded')

                                select t1.InsertDate,t1.GroupCompany,t1.SeverityName,t2.* into #tmpTenableComplianceControlGroup from #tenableComplianceSnapshotLatest t1
                                left join TenableISOComplianceGroup t2
                                on t1.PluginOutput like CONCAT('%', t2.isoreference, '%')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Tenable Compliance Control Group Correlation Completed')

                                insert into TenableComplianceControlGroup
                                select InsertDate,GroupCompany,SeverityName,compliancegroup,count(*) from
                                #tmpTenableComplianceControlGroup
                                group by InsertDate,GroupCompany,SeverityName,compliancegroup

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Tenable Compliance Control Group Summary Loaded')
                                */
                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('Tenable Vulnerabilities Snapshot','Procedure SP_LoadTenableSnapshotData Completed')

END


/****** Object:  StoredProcedure [dbo].[SP_ServiceNowCMDB]    Script Date: 8/31/2022 6:15:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =======================================================
-- Author: KPMG
-- Create Date: 06/10/2022
-- Description: Stored Procedure for Transforming and Cleaning ServiceNow CMDB data
-- =======================================================

ALTER   PROCEDURE [dbo].[SP_ServiceNowCMDB]
AS
BEGIN
                                /*** Logging  ***/ 

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('ServiceNow CMDB','Procedure SP_ServiceNowCMDB Started')

                                SET NOCOUNT ON

                                /*** STEP 1: Truncate and load of  Operational Assets from Staging Table to Final Table ***/ 

                                TRUNCATE TABLE ServiceNowCMDB

                                INSERT INTO ServiceNowCMDB
                                SELECT * FROM STG_ServiceNowCMDB
                                WHERE (operational_status_display_value = 'Operational'
                                AND u_opco_display_value !=''
                                AND       sys_class_name_display_value IN ('Audio Visual Devices','Communication Device','Computer','DB2 Instance','ESX Server','IP Firewall','HBase Instance','Hyper-V Server','IP Phone',
                                'Load Balancer','Linux Server','Mass Storage Device','MongoDB Instance','MSFT SQL Instance','Multi-function Printer','MySQL Instance','Network Gear','Oracle Instance','PostgreSQL Instance',
                                'Printer','IP Router','SAN Fabric','Scanner','Security Appliances','Storage Device','IP Switch','Windows Server','Sybase Instance','Wireless Access point'))



                                /*** Logging  ***/ 

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('ServiceNow CMDB','Loaded data into the table ServiceNowCMDB from STG_ServiceNowCMDB')

                                INSERT INTO DataIngestionSummary (Pipeline,[Procedure],[Table],[RecordsIngested])
                                VALUES('ServiceNow CMDB','SP_ServiceNowCMDB','ServiceNowCMDB',(SELECT count(*) FROM ServiceNowCMDB))

                                /*** Updating the null and blank values with none ***/ 

                                UPDATE ServiceNowCMDB
                                SET [department_display_value] = dbo.isEmpty([department_display_value],'None'),
                                                [u_business_criticality_display_value] = ISNULL([u_business_criticality_display_value],'None'),
                                                [u_application_details_display_value] = dbo.isEmpty([u_application_details_display_value],'None'),
                                                [ip_address_display_value] = dbo.isEmpty([ip_address_display_value],'None'),
                                                [mac_address_display_value] = dbo.isEmpty([mac_address_display_value],'None'),
                                                [dns_domain_display_value]= dbo.isEmpty([dns_domain_display_value],'None'),
                                                [name_display_value]= dbo.isEmpty([name_display_value],'None'),
                                                [serial_number_display_value] = dbo.isEmpty([serial_number_display_value],'None'),
                                                [asset_display_value]= dbo.isEmpty([asset_display_value],'None'),
                                                [u_server_type_display_value] = dbo.isEmpty([u_business_criticality_display_value],'None'),
                                                [u_classification_display_value] = dbo.isEmpty([u_classification_display_value],'None'),
                                                [u_device_type_display_value]= dbo.isEmpty([u_device_type_display_value],'None'),
                                                [category_display_value]= dbo.isEmpty([category_display_value],'None'),
                                                [subcategory_display_value]= dbo.isEmpty([subcategory_display_value],'None'),
                                                [owned_by_display_value] = dbo.isEmpty([owned_by_display_value],'None'),
                                                [company_display_value] = dbo.isEmpty([company_display_value],'None'),
                                                [support_group_display_value] = dbo.isEmpty([support_group_display_value],'None'),
                                                [u_building_display_value] = dbo.isEmpty([u_building_display_value],'None'),
                                                [u_floor_display_value] = ISNULL([u_floor_display_value],'None'),
                                                [u_room_display_value]= dbo.isEmpty([u_room_display_value],'None'),
                                                [u_subscriber_company_display_value]=ISNULL([u_subscriber_company_display_value],'None'),
                                                [u_business_service_display_value]=dbo.isEmpty([u_business_service_display_value],'None'),
                                FROM ServiceNowCMDB

                                /*** Logging  ***/ 

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('ServiceNow CMDB','Updated the null/empty values with None in the table ServiceNowCMDB')

                                /*** Cleaning the category field to resolve data quality issues ***/ 

                                UPDATE ServiceNowCMDB
                                set category_display_value='Switch'
                                WHERE subcategory_display_value='Access Switch'

                                UPDATE ServiceNowCMDB
                                set category_display_value='Router'
                                WHERE subcategory_display_value='Core Router'

                                UPDATE ServiceNowCMDB
                                set category_display_value='Desktop'
                                WHERE subcategory_display_value='Desktop PC'

                                UPDATE ServiceNowCMDB
                                set category_display_value='Workstation'
                                WHERE subcategory_display_value='Mini Workstation'

                                UPDATE ServiceNowCMDB
                                set category_display_value='Network Appliance'
                                WHERE subcategory_display_value='Network Access Control'

                                UPDATE ServiceNowCMDB
                                set category_display_value='Workstation'
                                WHERE subcategory_display_value='Tower Workstation'

                                UPDATE ServiceNowCMDB
                                set subcategory_display_value='Video Conferencing'
                                WHERE subcategory_display_value='Video Confrencing'

                                UPDATE ServiceNowCMDB
                                set category_display_value='Wireless'
                                WHERE subcategory_display_value='Wireless Controller'

                                /*** Logging ***/ 

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('ServiceNow CMDB','Cleaning of Category table completed in the table ServiceNowCMDB')

                                INSERT INTO DataIngestionLog (Pipeline,[Description])
                                VALUES('ServiceNow CMDB','Procedure SP_ServiceNowCMDB Completed')

                                /*** Executing the procedure for loading data into Data Model of ServiceNow CMDB***/ 

                                EXEC SP_LoadCMDBDimensionFactTables;

END;

/****** Object:  View [dbo].[VW_CMDB]    Script Date: 8/31/2022 4:24:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[VW_CMDB] as
(select
DimAssetCMDB.HostName,DimIPAddress.IPAddress,DimCategory.Category,DimSubCategory.SubCategory,DimGroupCompanyCMDB.GroupCompany,DimBusinessCriticality.Criticality,
DimAssetClass.Class,DimEmployee.EmployeeName [OwnedBy],DimBusinessService.BusinessService,FactCMDB.AssetCount
from FactCMDB
left join DimAssetCMDB on FactCMDB.AssetKey=DimAssetCMDB.AssetKey
left join DimIPAddress on FactCMDB.IPAddressKey=DimIPAddress.IPAddressKey
left join DimCategory on FactCMDB.CategoryKey=DimCategory.CategoryKey
left join DimSubCategory on FactCMDB.SubCategoryKey=DimSubCategory.SubCategoryKey
left join DimGroupCompanyCMDB on FactCMDB.GroupCompanyKey=DimGroupCompanyCMDB.GroupCompanyKey
left join DimBusinessCriticality on FactCMDB.BusinessCriticalityKey=DimBusinessCriticality.BusinessCriticalityKey
left join DimAssetClass on FactCMDB.ClassKey=DimAssetClass.ClassKey
left join DimEmployee on FactCMDB.OwnedByKey=DimEmployee.EmployeeKey
left join DimBusinessService on FactCMDB.BusinessServiceKey=DimBusinessService.BusinessServiceKey
);
GO


/****** Object:  View [dbo].[VW_CMDBDetail]    Script Date: 8/31/2022 4:26:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  view [dbo].[VW_CMDBDetail] as 
select 

[u_classification_display_value] as [Classification],
[u_device_type_display_value] as [DeviceType],
[category_display_value] as Category,
[subcategory_display_value]      as [SubCategory],
[serial_number_display_value] as [SerialNumber],
[u_opco_display_value] as [GroupCompany],
[u_subscriber_company_display_value] as [SubscriberCompany],
[owned_by_display_value] as [OwnedBy],
[managed_by_display_value] as [Managedby],
[asset_display_value] as Asset,
[support_group_display_value] as [SupportGroup],
[asset_tag_display_value] as [AssetTag],
[assigned_to_display_value] as [AssignedTo],
[assignment_group_display_value] as [AssignmentGroup],
[u_source_display_value] as Source,
[last_discovered_display_value] as [MostRecentDiscovery],
[u_description_display_value] as [Description],
[short_description_display_value] as [ShortDescription],
[u_business_criticality_display_value] as [BusinessCriticality],
[operational_status_display_value] as [OperationalStatus],
[dns_domain_display_value] as [DNSDomain],
[u_business_service_display_value] as [BusinessService],
[mac_address_display_value] as [MacAddress],
[u_application_details_display_value] as [Solution/Application],
[u_version_display_value] as [Version],
[u_version_name_display_value] as [VersionName],
[u_service_pack_display_value] as [ServicePack],
[u_cumulative_update_display_value] as [CumulativeUpdate],
[u_availability_status_display_value] as [AvailabilityStatus],
[u_building_display_value] as Building,
[u_floor_display_value] as [Floor],
[u_room_display_value] as Room,
[u_server_type_display_value] as [ServerType],
[u_instance_name_display_value] as [InstanceName],
[name_display_value] as HostName,
department_display_value as Department,
ip_address_display_value as IPAddress,
sys_class_name_display_value as Class
from ServiceNowCMDB;
GO


/****** Object:  View [dbo].[VW_ComplianceCMDB_Details]    Script Date: 8/31/2022 4:28:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VW_ComplianceCMDB_Details] AS
SELECT tcs.IP,tcs.MACAddress, tcs.NetBIOSName, tcs.PluginName, tcs.Solution, tcs.Synopsis, tcs.GroupCompany,
                   tcs.DMZIndicator,tcs.SeverityName, tcs.Exploit, tcs.ExploitEase, tcs.FirstDiscoveredDate, 
                   tcs.InsertDate, tcs.MitigatedFlag, tcs.RiskFactor, tcs.ISOIndicator,tcs.NESAIndicator,tcs.HostName,tcs.compliancegroup,
                   /** tcs.PlugIn, tcs.DNSName, tcs.Port, tcs.severity, tcs.SeverityID, tcs.SeverityDescription, tcs.RiskAccepted,
                   tcs.RiskRecasted, tcs.Protocol, tcs.ExploitFrameworks, tcs.SeeAlso,
                   tcs.StigSeverity, tcs.vprContext, tcs.VulnerabilityPriorityRating, tcs.CVSSV2BaseScore, tcs.CVSSV2TemporalScore,
                   tcs.CVSSV2Vector, tcs.CVSSV3BaseScore, tcs.CVSSV3Vector, tcs.CPE, tcs.CVEID, tcs.BID, tcs.CheckType, tcs.Version,
                   tcs.PluginOutput, tcs.OperatingSystem, tcs.RiskRecastedRuleComment, tcs.RiskAcceptedRuleComment, tcs.ACRScore,
                   tcs.RepositoryID, tcs.RepositoryName, tcs.RepositoryDescription, tcs.FamilyID, tcs.FamilyName, tcs.FamilyType,
                   tcs.PluginInfo, tcs.Description, tcs.PluginPublicationDate, tcs.LastObservedDate, tcs.VulnPublicationDate,
                   tcs.PatchPublicationDate, tcs.PluginModificationDate, tcs.RecordType, tcs.InsertDateTimeStamp, tcs.UpdateDate,
                   **/
      case when cmdbtl.Category is null then 'Asset not in CMDB'
                   when cmdbtl.Category = 'none' then 'Category not available in CMDB'
                   else cmdbtl.Category end Category,
                   case when cmdbtl.SubCategory is null then 'Asset not in CMDB'
                   when cmdbtl.SubCategory = 'None' then 'Sub Category not available in CMDB'
                   else cmdbtl.SubCategory end SubCategory,
                   case when cmdbtl.BusinessCriticality is null then 'Asset not in CMDB'
                   when cmdbtl.BusinessCriticality = 'None' then 'Business Criticality not available in CMDB'
                   else cmdbtl.BusinessCriticality end BusinessCriticality,
                   cmdbtl.[Solution/Application],
                   case when cmdbtl.OwnedBy is null then 'Asset not in CMDB'
                   when cmdbtl.OwnedBy = 'None' then 'Asset Owner not available in CMDB'
                   else cmdbtl.OwnedBy end OwnedBy,
                   cmdbtl.Managedby,
                   cmdbtl.SerialNumber,
                   cmdbtl.GroupCompany [CMDB_GroupCompany],
                   cmdbtl.SubscriberCompany,
                   cmdbtl.Asset,
                   cmdbtl.SupportGroup,
                   cmdbtl.[Description] [CMDB_Description],
                   cmdbtl.ShortDescription,
                   cmdbtl.DNSDomain,
                   case when cmdbtl.BusinessService is null then 'Asset not in CMDB'
                   when cmdbtl.BusinessService = 'None' then 'Application not available in CMDB'
                   else cmdbtl.BusinessService end BusinessService,
                   cmdbtl.MacAddress [CMDB_MacAddress],
                   cmdbtl.HostName [CMDB_HostName],
                   case when cmdbtl.Class is null then 'Asset not in CMDB'
                   when cmdbtl.Class = 'None' then 'Class not available in CMDB'
                   else cmdbtl.Class end CmdbClass,
                   case when cmdbtl.Class is null then tcs.class
                   when cmdbtl.Class = 'None' then tcs.class
                   else cmdbtl.Class end Class
FROM TenableComplianceSnapshot tcs
LEFT JOIN VW_CMDBDetail cmdbtl
ON tcs.[IP] = cmdbtl.IPAddress
where datediff(day,tcs.InsertDate,getdate())<=30
and tcs.SeverityName='High'
;
GO


/****** Object:  View [dbo].[VW_TenableCMDB_Details]    Script Date: 8/31/2022 4:29:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_TenableCMDB_Details] AS
SELECT tvs.MACAddress,tvs.IP, tvs.NetBIOSName, tvs.plugin, tvs.PluginName, tvs.Solution, tvs.Synopsis, tvs.GroupCompany,
                   tvs.DMZIndicator, tvs.SeverityName, tvs.Exploit, tvs.ExploitEase, tvs.ExploitFrameworks,
                   tvs.FirstDiscoveredDate, tvs.InsertDate, tvs.MitigatedFlag, tvs.RiskFactor, tvs.CVEID, tvs.VulnerabilityPriorityRating,
                   tvs.DNSName, tvs.Port, tvs.severity, tvs.SeverityID, tvs.SeverityDescription, tvs.RiskAccepted,
                   tvs.RiskRecasted, tvs.Protocol, tvs.SeeAlso,tvs.HostName,
                   tvs.StigSeverity, tvs.vprContext, tvs.CVSSV2BaseScore, tvs.CVSSV2TemporalScore,
                   tvs.CVSSV2Vector, tvs.CVSSV3BaseScore, tvs.CVSSV3Vector, tvs.CPE, tvs.BID, tvs.CheckType, tvs.Version,
                   tvs.PluginOutput, tvs.OperatingSystem, tvs.RiskRecastedRuleComment, tvs.RiskAcceptedRuleComment, tvs.ACRScore,
                   tvs.RepositoryID, tvs.RepositoryName, tvs.RepositoryDescription, tvs.FamilyID, tvs.FamilyName, tvs.FamilyType,
                   tvs.PluginInfo, tvs.Description, tvs.PluginPublicationDate, tvs.LastObservedDate, tvs.VulnPublicationDate,
                   tvs.PatchPublicationDate, tvs.PluginModificationDate, tvs.RecordType, tvs.InsertDateTimeStamp, tvs.UpdateDate,
                   
                   case when cmdbtl.Category is null then 'Asset not in CMDB'
                   when cmdbtl.Category = 'none' then 'Category not available in CMDB'
                   else cmdbtl.Category end Category,
                   case when cmdbtl.SubCategory is null then 'Asset not in CMDB'
                   when cmdbtl.SubCategory = 'None' then 'Sub Category not available in CMDB'
                   else cmdbtl.SubCategory end SubCategory,
                   case when cmdbtl.BusinessCriticality is null then 'Asset not in CMDB'
                   when cmdbtl.BusinessCriticality = 'None' then 'Business Criticality not available in CMDB'
                   else cmdbtl.BusinessCriticality end BusinessCriticality,
                   cmdbtl.[Solution/Application],
                   case when cmdbtl.OwnedBy is null then 'Asset not in CMDB'
                   when cmdbtl.OwnedBy = 'None' then 'Asset Owner not available in CMDB'
                   else cmdbtl.OwnedBy end OwnedBy,
                   cmdbtl.Managedby,
                   cmdbtl.SerialNumber,
                   cmdbtl.GroupCompany [CMDB_GroupCompany],
                   cmdbtl.SubscriberCompany,
                   cmdbtl.Asset,
                   cmdbtl.SupportGroup,
                   cmdbtl.[Description] [CMDB_Description],
                   cmdbtl.ShortDescription,
                   cmdbtl.DNSDomain,
                   case when cmdbtl.BusinessService is null then 'Asset not in CMDB'
                   when cmdbtl.BusinessService = 'None' then 'Application not available in CMDB'
                   else cmdbtl.BusinessService end BusinessService,
                   cmdbtl.MacAddress [CMDB_MacAddress],
                   cmdbtl.HostName [CMDB_HostName],
                   cmdbtl.IPAddress [CMDB_IPAddress],
                   case when cmdbtl.Class is null then 'Asset not in CMDB'
                   when cmdbtl.Class = 'None' then 'Class not available in CMDB'
                   else cmdbtl.Class end CmdbClass,
                   case when cmdbtl.Class is null then tvs.class
                   when cmdbtl.Class = 'None' then tvs.class
                   else cmdbtl.Class end Class
FROM TenableVulnerabilitiesSnapshot tvs
LEFT JOIN VW_CMDBDetail cmdbtl
ON tvs.[IP] = cmdbtl.IPAddress
where datediff(day,tvs.insertdate,getdate())<=30
GO


/****** Object:  View [dbo].[VW_TenableComplianceDMZ]    Script Date: 8/31/2022 6:08:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_TenableComplianceDMZ] as
Select Distinct [IP], DMZIndicator,class,category,GroupCompany,InsertDate from TenableComplianceSnapshot
GO


/****** Object:  View [dbo].[VW_TenableCompliances]    Script Date: 8/31/2022 6:09:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE   VIEW [dbo].[VW_TenableCompliances] AS
select 
DimAssetTenable.IPAddress, 
DimAssetTenable.MACAddress,
--DimAssetTenable.DNSName,
DimAssetTenable.HostName,
--DimPlugin.Plugin,
DimPlugin.PluginName,
--DimPlugin.FamilyName,
DimPlugin.RiskCategory,
--DimPlugin.PluginModificationDate,
--DimPlugin.PluginPublicationDate,
--DimPlugin.VulnerabilityPriorityRating,
--DimPlugin.CVEID,
DimSeverity.Severity,
DimExploitable.Exploitable,
DimExploitsFramework.ExploitFrameworks,
--DimExploitsFramework.ExploitFrameworkDescription,
DimRiskFactor.RiskFactor,
DimGroupCompany.GroupCompany,
dimdate.TheDate as [Scan Date],
dimdate1.CalendarDate as [FirstDiscoveredDate],
--dimdate2.CalendarDate as [LastDiscoveredDate],
--DATEADD(dd, -(DATEPART(dw, dimdate.TheDate-2)), dimdate.TheDate) as [Scan Date],
FactTenableCompliances.VulnerabilitiesCount
from
FactTenableCompliances
left join DimSeverity on FactTenableCompliances.SeverityKey=DimSeverity.SeverityKey
left join DimGroupCompany on FactTenableCompliances.GroupCompanyKey=DimGroupCompany.GroupCompanyKey
left join DimPlugin on FactTenableCompliances.PluginKey=DimPlugin.PluginKey
left join DimExploitable on FactTenableCompliances.ExploitableKey=DimExploitable.ExploitableKey          
left join DimExploitsFramework on FactTenableCompliances.ExploitsFrameworkKey=DimExploitsFramework.ExploitFrameworkKey
left join DimRiskFactor on FactTenableCompliances.RiskFactorKey=DimRiskFactor.RiskFactorKey
left join DimAssetTenable on FactTenableCompliances.AssetKey=DimAssetTenable.AssetKey
left join DimDate as dimdate on FactTenableCompliances.SnapshotDateKey=dimdate.DateKey
left join DimDate as dimdate1 on FactTenableCompliances.FirstDiscoveredDateKey=dimdate1.DateKey
left join DimDate as dimdate2 on FactTenableCompliances.LastDiscoveredDateKey=dimdate2.DateKey
where datediff(day,dimdate.CalendarDate,getdate())<=30
and DimSeverity.Severity='High'
;
GO


/****** Object:  View [dbo].[VW_TenableComplianceScans]    Script Date: 8/31/2022 6:10:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_TenableComplianceScans] AS
SELECT comp.*, 
                   cmdb.HostName [CMDB_HostName],
                   case when cmdb.BusinessService is null then 'Asset not in CMDB'
                   when cmdb.BusinessService = 'None' then 'Application not available in CMDB'
                   else cmdb.BusinessService end BusinessService,
                   case when cmdb.Category is null then 'Asset not in CMDB'
                   when cmdb.Category = 'None' then 'Category not available in CMDB'
                   else cmdb.Category end Category,
                   case when cmdb.Class is null then 'Asset not in CMDB'
                   when cmdb.Class = 'None' then 'Class not available in CMDB'
                   else cmdb.Class end CmdbClass,
                   case when cmdb.Criticality is null then 'Asset not in CMDB'
                   when cmdb.Criticality = 'None' then 'Criticality not available in CMDB'
                   else cmdb.Criticality end Criticality,
                   cmdb.GroupCompany [CMDB_GroupCompany],
                   cmdb.IPAddress [CMDB_IPAddress],
                   case when cmdb.OwnedBy is null then 'Asset not in CMDB'
                   when cmdb.OwnedBy = 'None' then 'Asset Owner not available in CMDB'
                   else cmdb.OwnedBy end OwnedBy,
                   case when cmdb.SubCategory is null then 'Asset not in CMDB'
                   when cmdb.SubCategory = 'None' then 'Sub Category not available in CMDB'
                   else cmdb.SubCategory end SubCategory,
                   cmdb.AssetCount,
                   case when tcs.DMZIndicator = 'Y' then 'DMZ'
                   else tcs.GroupCompany end [Zone],
                   'Compliance' as RecordType,
                   case when cmdb.Class is null then tcs.class
                   when cmdb.Class = 'None' then tcs.class
                   else cmdb.Class end Class
FROM VW_TenableCompliances comp
LEFT JOIN 
(select * from 
                (
                select *,ROW_NUMBER() OVER(PARTITION BY IPAddress order by IPAddress desc) AS row_num
                from VW_CMDB where IPAddress NOT in ('None', 'NA', 'N/A')
                )a where row_num=1
) cmdb
ON comp.IPAddress = cmdb.IPAddress
LEFT JOIN 
(select * from 
                (
                select *,ROW_NUMBER() OVER(PARTITION BY [IP] order by InsertDate desc) AS row_num
                from VW_TenableComplianceDMZ 
                )a where row_num=1
) tcs
ON comp.IPAddress = tcs.[IP]
;
GO


/****** Object:  View [dbo].[VW_TenableVulnerabilities]    Script Date: 8/31/2022 6:10:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE   VIEW [dbo].[VW_TenableVulnerabilities] AS
select 
DimAssetTenable.IPAddress, 
DimAssetTenable.MACAddress,
DimAssetTenable.DNSName,
DimAssetTenable.HostName,
DimPlugin.Plugin,
DimPlugin.PluginName,
DimPlugin.FamilyName,
DimPlugin.RiskCategory,
DimPlugin.PluginModificationDate,
DimPlugin.PluginPublicationDate,
DimPlugin.VulnerabilityPriorityRating,
DimPlugin.CVEID,
DimSeverity.Severity,
DimExploitable.Exploitable,
DimExploitsFramework.ExploitFrameworks,
DimExploitsFramework.ExploitFrameworkDescription,
DimRiskFactor.RiskFactor,
DimGroupCompany.GroupCompany,
dimdate.CalendarDate as [Scan Date],
dimdate1.CalendarDate as [FirstDiscoveredDate],
dimdate2.CalendarDate as [LastDiscoveredDate],
--DATEADD(dd, -(DATEPART(dw, dimdate.TheDate-2)), dimdate.TheDate) as [Scan Date],
FactTenableVulnerabilities.VulnerabilitiesCount
from
FactTenableVulnerabilities
left join DimSeverity on FactTenableVulnerabilities.SeverityKey=DimSeverity.SeverityKey
left join DimGroupCompany on FactTenableVulnerabilities.GroupCompanyKey=DimGroupCompany.GroupCompanyKey
left join DimPlugin on FactTenableVulnerabilities.PluginKey=DimPlugin.PluginKey
left join DimExploitable on FactTenableVulnerabilities.ExploitableKey=DimExploitable.ExploitableKey       
left join DimExploitsFramework on FactTenableVulnerabilities.ExploitsFrameworkKey=DimExploitsFramework.ExploitFrameworkKey
left join DimRiskFactor on FactTenableVulnerabilities.RiskFactorKey=DimRiskFactor.RiskFactorKey
left join DimAssetTenable on FactTenableVulnerabilities.AssetKey=DimAssetTenable.AssetKey
left join DimDate as dimdate on FactTenableVulnerabilities.SnapshotDateKey=dimdate.DateKey
left join DimDate as dimdate1 on FactTenableVulnerabilities.FirstDiscoveredDateKey=dimdate1.DateKey
left join DimDate as dimdate2 on FactTenableVulnerabilities.LastDiscoveredDateKey=dimdate2.DateKey
where datediff(day,dimdate.CalendarDate,getdate())<=30
;
GO


/****** Object:  View [dbo].[VW_TenableVulnerabilitiesDMZ]    Script Date: 8/31/2022 6:11:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[VW_TenableVulnerabilitiesDMZ] as
Select Distinct [IP], DMZIndicator, class, category, GroupCompany,InsertDate from TenableVulnerabilitiesSnapshot
GO


/****** Object:  View [dbo].[VW_TenableVulnerabilitiesScans]    Script Date: 8/31/2022 6:11:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_TenableVulnerabilitiesScans] AS
select *,
case when EaseOfExploitability ='NA' then 'NA'
                when EaseOfExploitability = 'Easy' then 'Exploitable through Metasploit framework'
                when EaseOfExploitability = 'Medium' then 'Exploitable through other framework'
                else 'Exploitable without any exploits/frameworks (Custom Exploit)'
                end EaseOfExploitabilityDefinition
from 
(SELECT vuln.*, 
                   case when vuln.Exploitable = 0 then 'NA'
                   else (case when vuln.ExploitFrameworkDescription='None' then 'Difficult'
                   when vuln.ExploitFrameworkDescription like '%metasploit%' then 'Easy'
                   else 'Medium' end) end EaseOfExploitability,
       cmdb.HostName [CMDB_HostName],
                   case when cmdb.BusinessService is null then 'Asset not in CMDB'
                   when cmdb.BusinessService = 'None' then 'Application not available in CMDB'
                   else cmdb.BusinessService end BusinessService,
                   case when cmdb.Category is null then 'Asset not in CMDB'
                   when cmdb.Category = 'none' then 'Category not available in CMDB'
                   else cmdb.Category end Category,
                   case when cmdb.Class is null then 'Asset not in CMDB'
                   when cmdb.Class = 'None' then 'Class not available in CMDB'
                   else cmdb.Class end CmdbClass,
                   case when cmdb.Criticality is null then 'Asset not in CMDB'
                   when cmdb.Criticality = 'None' then 'Service Criticality not available in CMDB'
                   else cmdb.Criticality end Criticality,
                   cmdb.GroupCompany [CMDB_GroupCompany],
                   cmdb.IPAddress [CMDB_IPAddress],
                   case when cmdb.OwnedBy is null then 'Asset not in CMDB'
                   when cmdb.OwnedBy = 'None' then 'Asset Owner not available in CMDB'
                   else cmdb.OwnedBy end OwnedBy,
                   case when cmdb.SubCategory is null then 'Asset not in CMDB'
                   when cmdb.SubCategory = 'None' then 'Sub Category not available in CMDB'
                   else cmdb.SubCategory end SubCategory,
                   cmdb.AssetCount,
                   case when tvs.DMZIndicator = 'Y' then 'DMZ'
                   else tvs.GroupCompany end [Zone],
                   'Vulnerability' as RecordType, 
                   --tvs.Class as TenableClass, 
                   --tvs.Category as TenableCategory,
                   case when cmdb.Class is null then tvs.class
                   when cmdb.Class = 'None' then tvs.class
                   else cmdb.Class end Class
FROM VW_TenableVulnerabilities vuln
LEFT JOIN (select * from 
(
select *,ROW_NUMBER() OVER(PARTITION BY IPAddress order by IPAddress desc) AS row_num
from VW_CMDB where IPAddress NOT in ('None', 'NA', 'N/A')
)a where row_num=1) cmdb
ON vuln.IPAddress = cmdb.IPAddress
LEFT JOIN (
select * from 
(
select *,ROW_NUMBER() OVER(PARTITION BY [IP] order by InsertDate desc) AS row_num
from VW_TenableVulnerabilitiesDMZ 
)a where row_num=1
) tvs
ON vuln.IPAddress = tvs.[IP]
)a;
GO


/****** Object:  View [dbo].[VW_TenablePatched]    Script Date: 9/12/2022 1:24:49 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VW_TenablePatched]
AS
SELECT *,
       Count(0) AS Occurances
FROM   (SELECT CONVERT (DATE, TP.insertdate) AS insertdate,
               TP.groupcompany,
               TP.severityname,
               TP.recordtype,
               TP.businessservice,
               CASE
                 WHEN CMDBDTL.class IS NULL THEN TP.class
                 WHEN CMDBDTL.class = 'None' THEN TP.class
                 ELSE CMDBDTL.class
               END                           Class
        FROM   tenablepatched TP
               LEFT JOIN vw_cmdbdetail CMDBDTL
                      ON TP.[ip] = CMDBDTL.ipaddress) K
GROUP  BY insertdate,
          groupcompany,
          severityname,
          recordtype,
          businessservice,
          class;
GO


