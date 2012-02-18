USE [SwetNation]
GO
/****** Object:  User [SecondStrategyLogin]    Script Date: 02/06/2012 19:31:06 ******/
CREATE USER [SecondStrategyLogin] FOR LOGIN [SecondStrategyLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [SwetNationUser]    Script Date: 02/06/2012 19:31:06 ******/
CREATE USER [SwetNationUser] FOR LOGIN [SwetNationUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[WishListItems]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishListItems](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[CustomerId] [nvarchar](36) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[ProductId] [nvarchar](36) NOT NULL,
	[Quantity] [int] NOT NULL,
	[SelectionData] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WishListItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ToDoItems]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoItems](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountId] [bigint] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Details] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ToDoItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QueuedTasks]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QueuedTasks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[FriendlyName] [nvarchar](255) NOT NULL,
	[TaskProcessorName] [nvarchar](255) NOT NULL,
	[TaskProcessorId] [uniqueidentifier] NOT NULL,
	[Payload] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[StatusNotes] [nvarchar](max) NOT NULL,
	[StartAtUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_QueuedTasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageVersions]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageVersions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PageId] [nvarchar](50) NOT NULL,
	[AdminName] [nvarchar](max) NOT NULL,
	[AvailableScheduleId] [bigint] NOT NULL,
	[AvailableStartDateUtc] [datetime] NOT NULL,
	[AvailableEndDateUtc] [datetime] NOT NULL,
	[SerializedContent] [nvarchar](max) NOT NULL,
	[PublishedStatus] [int] NOT NULL,
	[Areas] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PageVersions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_UserAccounts]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_UserAccounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[statuscode] [int] NOT NULL,
	[Salt] [nvarchar](50) NOT NULL,
	[ResetKey] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ecommrc_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_News]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_News](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStampUtc] [datetime] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ecommrc_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_ProductVolumeDiscounts]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductVolumeDiscounts](
	[bvin] [varchar](36) NOT NULL,
	[ProductID] [varchar](36) NOT NULL,
	[Qty] [int] NOT NULL,
	[DiscountType] [int] NOT NULL,
	[Amount] [numeric](18, 10) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductVolumeDiscounts] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_Stores](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[SubscriptionId] [bigint] NOT NULL,
	[PlanId] [int] NOT NULL,
	[CustomUrl] [nvarchar](255) NOT NULL,
	[CurrentPlanRate] [decimal](18, 2) NOT NULL,
	[CurrentPlanPercent] [decimal](18, 2) NOT NULL,
	[CurrentPlanDayOfMonth] [int] NOT NULL,
	[DateCancelled] [datetime] NULL,
 CONSTRAINT [PK_ecommrc_Stores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_StoreDomains]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_StoreDomains](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[DomainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ecommrc_StoreDomains] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_CategoryXProperty]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_CategoryXProperty](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [nvarchar](36) NOT NULL,
	[PropertyId] [bigint] NOT NULL,
	[ParentPropertyId] [bigint] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[FilterName] [nvarchar](255) NOT NULL,
	[DisplayMode] [int] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_CategoryXProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_Category]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Category](
	[bvin] [varchar](36) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[ParentID] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[MetaTitle] [nvarchar](512) NOT NULL,
	[MetaKeywords] [nvarchar](255) NOT NULL,
	[MetaDescription] [nvarchar](255) NOT NULL,
	[ImageURL] [nvarchar](512) NOT NULL,
	[BannerImageURL] [nvarchar](512) NOT NULL,
	[SourceType] [int] NOT NULL,
	[DisplaySortOrder] [int] NOT NULL,
	[LatestProductCount] [int] NOT NULL,
	[CustomPageURL] [nvarchar](512) NOT NULL,
	[CustomPageNewWindow] [int] NOT NULL,
	[ShowInTopMenu] [int] NOT NULL,
	[Hidden] [int] NOT NULL,
	[TemplateName] [nvarchar](512) NOT NULL,
	[PostContentColumnId] [nvarchar](50) NOT NULL,
	[PreContentColumnId] [nvarchar](50) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[RewriteUrl] [nvarchar](max) NOT NULL,
	[ShowTitle] [int] NOT NULL,
	[Criteria] [nvarchar](max) NOT NULL,
	[CustomPageId] [varchar](36) NOT NULL,
	[PreTransformDescription] [ntext] NOT NULL,
	[Keywords] [nvarchar](max) NOT NULL,
	[CustomerChangeableSortOrder] [bit] NOT NULL,
	[CustomPageLayout] [int] NOT NULL,
 CONSTRAINT [PK_bvc_Category] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_AuthenticationToken]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_AuthenticationToken](
	[bvin] [varchar](36) NOT NULL,
	[UserBvin] [varchar](36) NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_AuthenticationToken] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_Audit]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_Audit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TimeStampUtc] [datetime] NOT NULL,
	[SourceModule] [int] NOT NULL,
	[ShortName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[UserIdText] [nvarchar](255) NOT NULL,
	[Severity] [int] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Audit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_AffiliateReferral]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_AffiliateReferral](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AffiliateId] [bigint] NOT NULL,
	[referrerurl] [nvarchar](1000) NOT NULL,
	[TimeOfReferralUtc] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_AffiliateReferral] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_Affiliate]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_Affiliate](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReferralID] [nvarchar](50) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[CommissionAmount] [numeric](18, 10) NOT NULL,
	[CommissionType] [int] NOT NULL,
	[ReferralDays] [int] NOT NULL,
	[TaxID] [nvarchar](100) NOT NULL,
	[DriversLicenseNumber] [nvarchar](100) NOT NULL,
	[WebSiteURL] [nvarchar](1000) NOT NULL,
	[StyleSheet] [nvarchar](1000) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Affiliate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_Address]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bvin] [varchar](36) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[NickName] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[MiddleInitial] [nvarchar](1) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Company] [nvarchar](255) NOT NULL,
	[Line1] [nvarchar](255) NOT NULL,
	[Line2] [nvarchar](255) NOT NULL,
	[Line3] [nvarchar](255) NOT NULL,
	[City] [nvarchar](255) NOT NULL,
	[RegionBvin] [varchar](36) NOT NULL,
	[RegionName] [nvarchar](255) NOT NULL,
	[PostalCode] [nvarchar](50) NOT NULL,
	[CountryBvin] [varchar](36) NOT NULL,
	[CountryName] [nvarchar](255) NOT NULL,
	[CountyBvin] [varchar](36) NOT NULL,
	[CountyName] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Fax] [nvarchar](50) NOT NULL,
	[WebSiteUrl] [nvarchar](255) NOT NULL,
	[UserBvin] [varchar](36) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[AddressType] [int] NOT NULL,
 CONSTRAINT [PK_bvc_Address] PRIMARY KEY NONCLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_bvc_Address] UNIQUE CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvb_BillingAccounts]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvb_BillingAccounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[CreditCard] [ntext] NOT NULL,
	[BillingZipCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_bvb_BillingAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_HtmlTemplates]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_HtmlTemplates](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[FromEmail] [nvarchar](255) NOT NULL,
	[Subject] [nvarchar](1024) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[RepeatingSection] [nvarchar](max) NOT NULL,
	[TemplateType] [int] NOT NULL,
 CONSTRAINT [PK_bvc_HtmlTemplates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_GiftCard]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_GiftCard](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[CardNumber] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 10) NOT NULL,
	[IssueDateUtc] [datetime] NOT NULL,
	[ExpirationDateUtc] [datetime] NOT NULL,
	[PurchaserEmail] [nvarchar](255) NOT NULL,
	[RecipientEmail] [nvarchar](255) NOT NULL,
	[GiftMessage] [nvarchar](max) NOT NULL,
	[IsRedeemed] [bit] NOT NULL,
	[RedemptionDateUtc] [datetime] NOT NULL,
	[RedemptionUserId] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_bvc_GiftCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_Fraud]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Fraud](
	[bvin] [varchar](36) NOT NULL,
	[RuleType] [int] NOT NULL,
	[RuleValue] [nvarchar](255) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Fraud] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_EventLog]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_EventLog](
	[bvin] [varchar](36) NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[Source] [nvarchar](250) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Severity] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_EventLog] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_CustomUrl]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_CustomUrl](
	[bvin] [varchar](36) NOT NULL,
	[RequestedUrl] [nvarchar](max) NOT NULL,
	[RedirectToUrl] [nvarchar](max) NOT NULL,
	[IsPermanentRedirect] [bit] NOT NULL,
	[SystemDataType] [int] NOT NULL,
	[SystemData] [nvarchar](50) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_CustomUrl] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ContentColumn]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ContentColumn](
	[bvin] [varchar](36) NOT NULL,
	[DisplayName] [nvarchar](512) NOT NULL,
	[SystemColumn] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ContentColumn] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bv_SearchObjects]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bv_SearchObjects](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ObjectType] [int] NOT NULL,
	[ObjectId] [nvarchar](255) NOT NULL,
	[Title] [nvarchar](512) NOT NULL,
	[SiteId] [bigint] NOT NULL,
	[LastIndexUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_bv_SearchObject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bv_SearchLexicon]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bv_SearchLexicon](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Word] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_bv_SearchLexicon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiKeys]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiKeys](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ApiKey] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApiKeys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_Order]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bvin] [varchar](36) NOT NULL,
	[AffiliateId] [varchar](36) NOT NULL,
	[BillingAddress] [ntext] NOT NULL,
	[CustomProperties] [ntext] NOT NULL,
	[FraudScore] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 10) NOT NULL,
	[HandlingTotal] [decimal](18, 10) NOT NULL,
	[Instructions] [nvarchar](max) NOT NULL,
	[IsPlaced] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[OrderDiscounts] [decimal](18, 10) NOT NULL,
	[OrderDiscountDetails] [nvarchar](max) NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[PaymentStatus] [int] NOT NULL,
	[ShippingAddress] [ntext] NOT NULL,
	[ShippingMethodId] [varchar](36) NOT NULL,
	[ShippingMethodDisplayName] [nvarchar](255) NOT NULL,
	[ShippingProviderId] [varchar](36) NOT NULL,
	[ShippingProviderServiceCode] [nvarchar](255) NOT NULL,
	[ShippingStatus] [int] NOT NULL,
	[ShippingTotal] [decimal](18, 10) NOT NULL,
	[ShippingDiscounts] [decimal](18, 10) NOT NULL,
	[ShippingDiscountDetails] [nvarchar](max) NOT NULL,
	[SubTotal] [decimal](18, 10) NOT NULL,
	[TaxTotal] [decimal](18, 10) NOT NULL,
	[TaxTotal2] [decimal](18, 10) NOT NULL,
	[TimeOfOrder] [datetime] NOT NULL,
	[UserEmail] [nvarchar](100) NOT NULL,
	[UserId] [varchar](36) NOT NULL,
	[StatusCode] [varchar](36) NOT NULL,
	[StatusName] [nvarchar](255) NOT NULL,
	[ThirdPartyOrderId] [nvarchar](50) NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Order] PRIMARY KEY NONCLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_bvc_Order] UNIQUE CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_Manufacturer]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Manufacturer](
	[bvin] [varchar](36) NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[Address] [ntext] NOT NULL,
	[DropShipEmailTemplateId] [varchar](36) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductFile]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductFile](
	[bvin] [varchar](36) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
	[ShortDescription] [nvarchar](100) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductFile] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_Product]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bvin] [varchar](36) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductTypeId] [varchar](36) NOT NULL,
	[ListPrice] [numeric](18, 10) NOT NULL,
	[SitePrice] [numeric](18, 10) NOT NULL,
	[SiteCost] [numeric](18, 10) NOT NULL,
	[MetaKeywords] [nvarchar](255) NOT NULL,
	[MetaDescription] [nvarchar](255) NOT NULL,
	[MetaTitle] [nvarchar](512) NOT NULL,
	[TaxExempt] [int] NOT NULL,
	[TaxClass] [varchar](36) NOT NULL,
	[NonShipping] [int] NOT NULL,
	[ShipSeparately] [int] NOT NULL,
	[ShippingMode] [int] NOT NULL,
	[ShippingWeight] [numeric](18, 10) NOT NULL,
	[ShippingLength] [numeric](18, 10) NOT NULL,
	[ShippingWidth] [numeric](18, 10) NOT NULL,
	[ShippingHeight] [numeric](18, 10) NOT NULL,
	[Status] [int] NOT NULL,
	[ImageFileSmall] [nvarchar](512) NOT NULL,
	[ImageFileMedium] [nvarchar](512) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[MinimumQty] [int] NOT NULL,
	[ShortDescription] [nvarchar](512) NOT NULL,
	[LongDescription] [nvarchar](max) NOT NULL,
	[ManufacturerID] [varchar](36) NOT NULL,
	[VendorID] [varchar](36) NOT NULL,
	[GiftWrapAllowed] [int] NOT NULL,
	[ExtraShipFee] [numeric](18, 10) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Keywords] [nvarchar](max) NOT NULL,
	[TemplateName] [nvarchar](512) NOT NULL,
	[PreContentColumnId] [varchar](36) NOT NULL,
	[PostContentColumnId] [varchar](36) NOT NULL,
	[RewriteUrl] [nvarchar](max) NOT NULL,
	[SitePriceOverrideText] [nvarchar](255) NOT NULL,
	[PreTransformLongDescription] [nvarchar](max) NOT NULL,
	[SmallImageAlternateText] [nvarchar](255) NOT NULL,
	[MediumImageAlternateText] [nvarchar](255) NOT NULL,
	[CustomProperties] [nvarchar](max) NOT NULL,
	[GiftWrapPrice] [numeric](18, 10) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Featured] [bit] NOT NULL,
	[AllowReviews] [bit] NOT NULL,
	[DescriptionTabs] [ntext] NOT NULL,
	[OutOfStockMode] [int] NOT NULL,
	[IsAvailableForSale] [bit] NOT NULL,
 CONSTRAINT [PK_bvc_Product] PRIMARY KEY NONCLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_bvc_Product_id] UNIQUE CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_PriceGroup]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_PriceGroup](
	[bvin] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PricingType] [int] NOT NULL,
	[AdjustmentAmount] [numeric](18, 10) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_PriceGroup] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_Policy]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Policy](
	[bvin] [varchar](36) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[SystemPolicy] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[PolicyType] [int] NOT NULL,
 CONSTRAINT [PK_bvc_Policy] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_OrderPackage]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_OrderPackage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Width] [decimal](18, 4) NOT NULL,
	[Height] [decimal](18, 4) NOT NULL,
	[Length] [decimal](18, 4) NOT NULL,
	[SizeUnits] [int] NOT NULL,
	[Weight] [decimal](18, 4) NOT NULL,
	[WeightUnits] [int] NOT NULL,
	[OrderId] [varchar](36) NOT NULL,
	[ShippingProviderId] [varchar](36) NOT NULL,
	[ShippingProviderServiceCode] [nvarchar](255) NOT NULL,
	[HasShipped] [int] NOT NULL,
	[TrackingNumber] [nvarchar](255) NOT NULL,
	[ShipDateUtc] [datetime] NOT NULL,
	[EstimatedShippingCost] [decimal](18, 10) NOT NULL,
	[Items] [nvarchar](max) NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
	[CustomProperties] [ntext] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_OrderPackage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_MailingList]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_MailingList](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Private] [bit] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_bvc_MailingList_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_ProductImage]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductImage](
	[bvin] [varchar](36) NOT NULL,
	[ProductID] [varchar](36) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[Caption] [nvarchar](max) NOT NULL,
	[AlternateText] [nvarchar](max) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductImage] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductFilter]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductFilter](
	[bvin] [varchar](36) NOT NULL,
	[FilterName] [nvarchar](300) NOT NULL,
	[Criteria] [nvarchar](max) NOT NULL,
	[Page] [nvarchar](1000) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductFilter] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductOptions]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductOptions](
	[bvin] [varchar](50) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[OptionType] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[NameIsHidden] [bit] NOT NULL,
	[IsVariant] [bit] NOT NULL,
	[IsShared] [bit] NOT NULL,
	[Settings] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_bvc_ProductOptions] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductProperty]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductProperty](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PropertyName] [nvarchar](512) NOT NULL,
	[DisplayName] [nvarchar](512) NOT NULL,
	[DisplayOnSite] [int] NOT NULL,
	[DisplayToDropShipper] [int] NOT NULL,
	[TypeCode] [int] NOT NULL,
	[DefaultValue] [ntext] NOT NULL,
	[CultureCode] [varchar](10) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductType]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductType](
	[bvin] [varchar](36) NOT NULL,
	[ProductTypeName] [nvarchar](512) NOT NULL,
	[IsPermanent] [bit] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductReview]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[lastUpdated] [datetime] NOT NULL,
	[bvin] [varchar](36) NOT NULL,
	[Approved] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Karma] [int] NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[Rating] [int] NOT NULL,
	[UserID] [varchar](36) NOT NULL,
	[ProductBvin] [varchar](36) NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductReview] PRIMARY KEY NONCLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductRelationships]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_ProductRelationships](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [nvarchar](36) NOT NULL,
	[RelatedProductId] [nvarchar](36) NOT NULL,
	[IsSubstitute] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[MarketingDescription] [nvarchar](max) NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductRelationships] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_RMA]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_RMA](
	[bvin] [varchar](36) NOT NULL,
	[OrderBvin] [varchar](36) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Number] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](150) NOT NULL,
	[PhoneNumber] [nvarchar](30) NOT NULL,
	[Comments] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[DateOfReturn] [datetime] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_RMA] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_RewardsPoints]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_RewardsPoints](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[Points] [int] NOT NULL,
	[PointsHeld] [int] NOT NULL,
	[TransactionTime] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_RewardsPoints] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_Promotions]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_Promotions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Mode] [int] NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CustomerDescription] [nvarchar](255) NOT NULL,
	[StartDateUtc] [datetime] NOT NULL,
	[EndDateUtc] [datetime] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[QualificationsXml] [nvarchar](max) NOT NULL,
	[ActionsXml] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_bvc_Promotions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_ProductXOption]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_ProductXOption](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ProductBvin] [nvarchar](36) NOT NULL,
	[OptionBvin] [nvarchar](36) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_bvc_ProductXOption] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_UserQuestions]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_UserQuestions](
	[bvin] [varchar](36) NOT NULL,
	[QuestionName] [nvarchar](50) NOT NULL,
	[QuestionType] [int] NOT NULL,
	[Values] [nvarchar](max) NOT NULL,
	[Order] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_UserQuestions] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_User]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_User](
	[bvin] [varchar](36) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Salt] [nvarchar](50) NOT NULL,
	[TaxExempt] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[Comment] [ntext] NOT NULL,
	[AddressBook] [ntext] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Locked] [int] NOT NULL,
	[LockedUntil] [datetime] NOT NULL,
	[FailedLoginCount] [int] NOT NULL,
	[Phones] [nvarchar](max) NOT NULL,
	[PricingGroup] [varchar](36) NOT NULL,
	[CustomQuestionAnswers] [nvarchar](max) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ShippingAddress] [nvarchar](max) NOT NULL,
	[BillingAddress] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_bvc_User] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ShippingMethod]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ShippingMethod](
	[bvin] [varchar](36) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[Adjustment] [decimal](18, 10) NOT NULL,
	[AdjustmentType] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[ShippingProviderId] [varchar](36) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ZoneId] [bigint] NOT NULL,
	[Settings] [ntext] NOT NULL,
 CONSTRAINT [PK_bvc_ShippingMethod] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_SearchQuery]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_SearchQuery](
	[bvin] [varchar](36) NOT NULL,
	[QueryPhrase] [nvarchar](max) NOT NULL,
	[ShopperId] [varchar](36) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_SearchQuery] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConversationMessages]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConversationMessages](
	[Id] [bigint] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ConversationId] [bigint] NOT NULL,
	[AuthorId] [bigint] NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ConversationMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConversationGroups]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConversationGroups](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Slug] [nvarchar](255) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_ConversationGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConversationAuthors]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConversationAuthors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[Bio] [nvarchar](1024) NOT NULL,
	[AuthenticationType] [int] NOT NULL,
	[AuthenticationKey] [nvarchar](max) NOT NULL,
	[AccessLevel] [int] NOT NULL,
	[Avatar] [varbinary](max) NULL,
	[Verified] [bit] NOT NULL,
 CONSTRAINT [PK_ConversationAuthors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_Vendor]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Vendor](
	[bvin] [varchar](36) NOT NULL,
	[DisplayName] [nvarchar](255) NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[Address] [ntext] NOT NULL,
	[DropShipEmailTemplateId] [varchar](36) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Vendor] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_Variants]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_Variants](
	[bvin] [varchar](36) NOT NULL,
	[ProductId] [varchar](36) NOT NULL,
	[Sku] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 10) NOT NULL,
	[SelectionData] [nvarchar](max) NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_Variant] PRIMARY KEY NONCLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_USGeoData]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_USGeoData](
	[Zip] [varchar](10) NOT NULL,
	[Latitude] [decimal](18, 10) NOT NULL,
	[Longitude] [decimal](18, 10) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](2) NOT NULL,
	[County] [varchar](50) NOT NULL,
	[ZipType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_bvc_USGeoData] PRIMARY KEY CLUSTERED 
(
	[Zip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_UserXContact]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_UserXContact](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactId] [varchar](36) NOT NULL,
	[UserId] [varchar](36) NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_UserXAffiliate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_RMAItem]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_RMAItem](
	[bvin] [varchar](36) NOT NULL,
	[RMABvin] [varchar](36) NOT NULL,
	[LineItemBvin] [varchar](36) NOT NULL,
	[ItemName] [nvarchar](512) NOT NULL,
	[ItemDescription] [nvarchar](max) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[Reason] [nvarchar](max) NOT NULL,
	[Replace] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
	[QuantityReceived] [int] NOT NULL,
	[QuantityReturnedToInventory] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_RMAItem] PRIMARY KEY NONCLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductXCategory]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductXCategory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [varchar](36) NOT NULL,
	[CategoryId] [varchar](36) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductXCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductPropertyValue]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductPropertyValue](
	[ProductBvin] [varchar](36) NOT NULL,
	[PropertyId] [bigint] NOT NULL,
	[PropertyValue] [nvarchar](max) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_bvc_ProductPropertyValue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductPropertyChoice]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_ProductPropertyChoice](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PropertyId] [bigint] NOT NULL,
	[ChoiceName] [nvarchar](512) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductPropertyChoice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_ProductOptionsItems]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductOptionsItems](
	[bvin] [varchar](50) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[OptionBvin] [varchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PriceAdjustment] [decimal](18, 10) NOT NULL,
	[WeightAdjustment] [decimal](18, 10) NOT NULL,
	[IsLabel] [bit] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_bvc_ProductOptionsItems] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductInventory]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductInventory](
	[bvin] [varchar](36) NOT NULL,
	[ProductBvin] [varchar](36) NOT NULL,
	[VariantId] [nvarchar](max) NOT NULL,
	[QuantityOnHand] [int] NOT NULL,
	[QuantityReserved] [int] NOT NULL,
	[QuantityAvailableForSale]  AS ([QuantityOnHand]-[QuantityReserved]) PERSISTED,
	[LowStockPoint] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_ProductInventory] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_ProductFileXProduct]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductFileXProduct](
	[ProductFileId] [varchar](36) NOT NULL,
	[ProductId] [varchar](36) NOT NULL,
	[AvailableMinutes] [int] NOT NULL,
	[MaxDownloads] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_bvc_ProductFileXProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_bvc_ProductFileXProduct_1] UNIQUE NONCLUSTERED 
(
	[ProductFileId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_LineItem]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_LineItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[ProductId] [varchar](36) NOT NULL,
	[VariantId] [varchar](36) NOT NULL,
	[Quantity] [int] NOT NULL,
	[OrderBvin] [varchar](36) NOT NULL,
	[BasePrice] [decimal](18, 10) NOT NULL,
	[DiscountDetails] [nvarchar](max) NOT NULL,
	[AdjustedPrice] [decimal](18, 10) NOT NULL,
	[ShippingPortion] [decimal](18, 10) NOT NULL,
	[TaxPortion] [decimal](18, 10) NOT NULL,
	[LineTotal] [decimal](18, 10) NOT NULL,
	[CustomProperties] [ntext] NOT NULL,
	[QuantityReturned] [int] NOT NULL,
	[QuantityShipped] [int] NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductShortDescription] [nvarchar](max) NOT NULL,
	[ProductSku] [nvarchar](50) NOT NULL,
	[StatusCode] [varchar](36) NOT NULL,
	[StatusName] [nvarchar](255) NOT NULL,
	[SelectionData] [nvarchar](max) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ShippingScheduleId] [bigint] NOT NULL,
	[TaxScheduleId] [bigint] NOT NULL,
	[ProductShippingWeight] [numeric](10, 4) NOT NULL,
	[ProductShippingLength] [numeric](10, 4) NOT NULL,
	[ProductShippingWidth] [numeric](10, 4) NOT NULL,
	[ProductShippingHeight] [numeric](10, 4) NOT NULL,
	[ShipFromAddress] [nvarchar](max) NOT NULL,
	[ShipFromMode] [int] NOT NULL,
	[ShipFromNotificationId] [nvarchar](50) NOT NULL,
	[ShipSeparately] [bit] NOT NULL,
	[ExtraShipCharge] [numeric](10, 4) NOT NULL,
 CONSTRAINT [PK_bvc_LineItem] PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_bvc_LineItem] UNIQUE CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_OrderNote]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_OrderNote](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [varchar](36) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[IsPublic] [bit] NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_OrderNote_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_OrderCoupon]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_OrderCoupon](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
	[CouponCode] [nvarchar](50) NOT NULL,
	[OrderBvin] [varchar](36) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[UserId] [varchar](36) NOT NULL,
	[IsUsed] [bit] NOT NULL,
 CONSTRAINT [PK_bvc_OrderCoupon_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_PolicyBlock]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_PolicyBlock](
	[bvin] [varchar](36) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [ntext] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[PolicyID] [varchar](36) NOT NULL,
	[DescriptionPreTransform] [ntext] NOT NULL,
	[StoreId] [bigint] NOT NULL,
 CONSTRAINT [PK_bvc_PolicyBlock] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bvc_MailingListMember]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bvc_MailingListMember](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[ListID] [bigint] NOT NULL,
	[EmailAddress] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[LastUpdatedUtc] [datetime] NOT NULL,
 CONSTRAINT [PK_bvc_MailingListMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_ContentBlock]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ContentBlock](
	[bvin] [varchar](36) NOT NULL,
	[ColumnID] [varchar](36) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ControlName] [nvarchar](512) NOT NULL,
	[LastUpdated] [datetime] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[SerializedSettings] [ntext] NOT NULL,
	[SerializedLists] [ntext] NOT NULL,
 CONSTRAINT [PK_bvc_ContentBlock] PRIMARY KEY CLUSTERED 
(
	[bvin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bv_SearchObjectWords]    Script Date: 02/06/2012 19:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bv_SearchObjectWords](
	[SearchObjectId] [bigint] NOT NULL,
	[WordId] [bigint] NOT NULL,
	[Score] [int] NOT NULL,
	[SiteId] [bigint] NOT NULL,
 CONSTRAINT [PK_bv_SearchObjectWords] PRIMARY KEY CLUSTERED 
(
	[SearchObjectId] ASC,
	[WordId] ASC,
	[SiteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_ShippingZones]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_ShippingZones](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Areas] [ntext] NOT NULL,
 CONSTRAINT [PK_ecommrc_ShippingZones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_OrderTransactions]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ecommrc_OrderTransactions](
	[Id] [uniqueidentifier] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[OrderId] [varchar](36) NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[Action] [int] NOT NULL,
	[Amount] [decimal](18, 10) NOT NULL,
	[CreditCard] [ntext] NOT NULL,
	[Success] [bit] NOT NULL,
	[Voided] [bit] NOT NULL,
	[RefNum1] [nvarchar](255) NOT NULL,
	[RefNum2] [nvarchar](255) NOT NULL,
	[LinkedToTransaction] [nvarchar](50) NOT NULL,
	[Messages] [ntext] NOT NULL,
	[CheckNumber] [nvarchar](50) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](50) NOT NULL,
	[GiftCardNumber] [nvarchar](50) NOT NULL,
	[CompanyAccountNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ecommrc_OrderTransactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ecommrc_AuthTokens]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_AuthTokens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TokenId] [uniqueidentifier] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Expires] [datetime] NOT NULL,
 CONSTRAINT [PK_ecommrc_AuthTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversations]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[Topic] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DateCreatedUtc] [datetime] NOT NULL,
	[AuthorId] [bigint] NOT NULL,
 CONSTRAINT [PK_Conversations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bvc_ProductTypeXProductProperty]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bvc_ProductTypeXProductProperty](
	[ProductTypeBvin] [varchar](36) NOT NULL,
	[PropertyId] [bigint] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_bvc_ProductTypeXProductProperty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ecommrc_StoresXUsers]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_StoresXUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AccessMode] [int] NOT NULL,
 CONSTRAINT [PK_ecommrc_StoresXUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_StoreSettings]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ecommrc_StoreSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[SettingName] [varchar](50) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ecommrc_StoreSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ecommrc_TaxSchedules]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_TaxSchedules](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ecommrc_TaxSchedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ecommrc_Taxes]    Script Date: 02/06/2012 19:31:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ecommrc_Taxes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StoreId] [bigint] NOT NULL,
	[CountryName] [nvarchar](255) NOT NULL,
	[RegionName] [nvarchar](255) NOT NULL,
	[PostalCode] [nvarchar](20) NOT NULL,
	[TaxScheduleId] [bigint] NOT NULL,
	[Rate] [numeric](18, 10) NOT NULL,
	[ApplyToShipping] [bit] NOT NULL,
 CONSTRAINT [PK_ecommrc_Taxes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[ecommrc_GenerateOrderNumber]    Script Date: 02/06/2012 19:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ecommrc_GenerateOrderNumber]

@storeid bigint

AS

	BEGIN TRY		
		BEGIN TRAN
		
		DECLARE @OrderNumberSeed bigint
		DECLARE @MaxOrderNumber bigint
			
		SET @OrderNumberSeed = (SELECT CAST(COALESCE(SettingValue,0) AS bigint) 
			FROM ecommrc_StoreSettings WITH (UPDLOCK) WHERE SettingName = 'LastOrderNumber'
			AND StoreId=@storeid)
				
		--SET @MaxOrderNumber = (SELECT COALESCE(MAX(OrderNumber), -1) FROM bvc_Order)
		--IF @OrderNumberSeed < @MaxOrderNumber
		--		SET @OrderNumberSeed = @MaxOrderNumber
				
		SET @OrderNumberSeed = @OrderNumberSeed + 1
		
		UPDATE ecommrc_StoreSettings SET SettingValue = @OrderNumberSeed 
			WHERE SettingName = 'LastOrderNumber'
			AND StoreId=@storeid
		
		COMMIT
		
		SELECT @OrderNumberSeed	AS OrderNumber	
	END TRY
	BEGIN CATCH
		ROLLBACK
		--EXEC bvc_EventLog_SQL_i
	END CATCH
GO
/****** Object:  Default [DF_bv_SearchObjects_SiteId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bv_SearchObjects] ADD  CONSTRAINT [DF_bv_SearchObjects_SiteId]  DEFAULT ((0)) FOR [SiteId]
GO
/****** Object:  Default [DF_bv_SearchObjects_LastIndexUtc]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bv_SearchObjects] ADD  CONSTRAINT [DF_bv_SearchObjects_LastIndexUtc]  DEFAULT (((1)/(1))/(1900)) FOR [LastIndexUtc]
GO
/****** Object:  Default [DF_bv_SearchObjectWords_Score]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bv_SearchObjectWords] ADD  CONSTRAINT [DF_bv_SearchObjectWords_Score]  DEFAULT ((0)) FOR [Score]
GO
/****** Object:  Default [DF_bv_SearchObjectWords_SiteId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bv_SearchObjectWords] ADD  CONSTRAINT [DF_bv_SearchObjectWords_SiteId]  DEFAULT ((0)) FOR [SiteId]
GO
/****** Object:  Default [DF_bvb_BillingAccounts_BillingZipCode]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvb_BillingAccounts] ADD  CONSTRAINT [DF_bvb_BillingAccounts_BillingZipCode]  DEFAULT ('') FOR [BillingZipCode]
GO
/****** Object:  Default [DF_bvc_Address_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Address] ADD  CONSTRAINT [DF_bvc_Address_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Address_AddressType]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Address] ADD  CONSTRAINT [DF_bvc_Address_AddressType]  DEFAULT ((0)) FOR [AddressType]
GO
/****** Object:  Default [DF_bvc_Affiliate_AddressId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Affiliate] ADD  CONSTRAINT [DF_bvc_Affiliate_AddressId]  DEFAULT (N'') FOR [Address]
GO
/****** Object:  Default [DF_bvc_Affiliate_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Affiliate] ADD  CONSTRAINT [DF_bvc_Affiliate_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_AffiliateReferral_AffiliateId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_AffiliateReferral] ADD  CONSTRAINT [DF_bvc_AffiliateReferral_AffiliateId]  DEFAULT ((0)) FOR [AffiliateId]
GO
/****** Object:  Default [DF_bvc_AffiliateReferral_TimeOfReferralUtc]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_AffiliateReferral] ADD  CONSTRAINT [DF_bvc_AffiliateReferral_TimeOfReferralUtc]  DEFAULT ('2011-01-01') FOR [TimeOfReferralUtc]
GO
/****** Object:  Default [DF_bvc_AffiliateReferral_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_AffiliateReferral] ADD  CONSTRAINT [DF_bvc_AffiliateReferral_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Audit_UserId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Audit] ADD  CONSTRAINT [DF_bvc_Audit_UserId]  DEFAULT ('') FOR [UserId]
GO
/****** Object:  Default [DF_bvc_Audit_UserIdTest]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Audit] ADD  CONSTRAINT [DF_bvc_Audit_UserIdTest]  DEFAULT ('') FOR [UserIdText]
GO
/****** Object:  Default [DF_bvc_Audit_Severity]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Audit] ADD  CONSTRAINT [DF_bvc_Audit_Severity]  DEFAULT ((0)) FOR [Severity]
GO
/****** Object:  Default [DF_bvc_Audit_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Audit] ADD  CONSTRAINT [DF_bvc_Audit_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_AuthenticationToken_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_AuthenticationToken] ADD  CONSTRAINT [DF_bvc_AuthenticationToken_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Category_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Category] ADD  CONSTRAINT [DF_bvc_Category_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Category_ShowTitle]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Category] ADD  CONSTRAINT [DF_bvc_Category_ShowTitle]  DEFAULT ((1)) FOR [ShowTitle]
GO
/****** Object:  Default [DF_bvc_Category_PreTransformDescription]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Category] ADD  CONSTRAINT [DF_bvc_Category_PreTransformDescription]  DEFAULT (N'') FOR [PreTransformDescription]
GO
/****** Object:  Default [DF_bvc_Category_CustomerChangeableSortOrder]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Category] ADD  CONSTRAINT [DF_bvc_Category_CustomerChangeableSortOrder]  DEFAULT ((0)) FOR [CustomerChangeableSortOrder]
GO
/****** Object:  Default [DF_bvc_Category_CustomPageLayout]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Category] ADD  CONSTRAINT [DF_bvc_Category_CustomPageLayout]  DEFAULT ((0)) FOR [CustomPageLayout]
GO
/****** Object:  Default [DF_bvc_CategoryXProperty_AllowMultiple]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_CategoryXProperty] ADD  CONSTRAINT [DF_bvc_CategoryXProperty_AllowMultiple]  DEFAULT ((0)) FOR [DisplayMode]
GO
/****** Object:  Default [DF_bvc_ContentBlock_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ContentBlock] ADD  CONSTRAINT [DF_bvc_ContentBlock_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ContentBlock_SerializedSettings]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ContentBlock] ADD  CONSTRAINT [DF_bvc_ContentBlock_SerializedSettings]  DEFAULT ('') FOR [SerializedSettings]
GO
/****** Object:  Default [DF_bvc_ContentBlock_SerializedLists]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ContentBlock] ADD  CONSTRAINT [DF_bvc_ContentBlock_SerializedLists]  DEFAULT ('') FOR [SerializedLists]
GO
/****** Object:  Default [DF_bvc_ContentColumn_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ContentColumn] ADD  CONSTRAINT [DF_bvc_ContentColumn_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_CustomUrl_SystemUrl]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_CustomUrl] ADD  CONSTRAINT [DF_bvc_CustomUrl_SystemUrl]  DEFAULT ((1)) FOR [IsPermanentRedirect]
GO
/****** Object:  Default [DF_bvc_CustomUrl_SystemDataType]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_CustomUrl] ADD  CONSTRAINT [DF_bvc_CustomUrl_SystemDataType]  DEFAULT ((0)) FOR [SystemDataType]
GO
/****** Object:  Default [DF_bvc_CustomUrl_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_CustomUrl] ADD  CONSTRAINT [DF_bvc_CustomUrl_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_EventLog_Severity]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_EventLog] ADD  CONSTRAINT [DF_bvc_EventLog_Severity]  DEFAULT ((0)) FOR [Severity]
GO
/****** Object:  Default [DF_bvc_EventLog_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_EventLog] ADD  CONSTRAINT [DF_bvc_EventLog_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Fraud_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Fraud] ADD  CONSTRAINT [DF_bvc_Fraud_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_GiftCard_IsRedeemed]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_GiftCard] ADD  CONSTRAINT [DF_bvc_GiftCard_IsRedeemed]  DEFAULT ((0)) FOR [IsRedeemed]
GO
/****** Object:  Default [DF_bvc_HtmlTemplates_TemplateType]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_HtmlTemplates] ADD  CONSTRAINT [DF_bvc_HtmlTemplates_TemplateType]  DEFAULT ((0)) FOR [TemplateType]
GO
/****** Object:  Default [DF_bvc_LineItem_VariantId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_VariantId]  DEFAULT ('') FOR [VariantId]
GO
/****** Object:  Default [DF_bvc_LineItem_BasePrice]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_BasePrice]  DEFAULT ((0)) FOR [BasePrice]
GO
/****** Object:  Default [DF_bvc_LineItem_DiscountDetails]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_DiscountDetails]  DEFAULT ('') FOR [DiscountDetails]
GO
/****** Object:  Default [DF_bvc_LineItem_AdjustedPrice]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_AdjustedPrice]  DEFAULT ((0)) FOR [AdjustedPrice]
GO
/****** Object:  Default [DF_bvc_LineItem_ShippingPortion]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShippingPortion]  DEFAULT ((0)) FOR [ShippingPortion]
GO
/****** Object:  Default [DF_bvc_LineItem_TaxPortion]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_TaxPortion]  DEFAULT ((0)) FOR [TaxPortion]
GO
/****** Object:  Default [DF_bvc_LineItem_LineTotal]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_LineTotal]  DEFAULT ((0)) FOR [LineTotal]
GO
/****** Object:  Default [DF_bvc_LineItem_CustomProperties]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_CustomProperties]  DEFAULT (N'') FOR [CustomProperties]
GO
/****** Object:  Default [DF_bvc_LineItem_QuantityReturned]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_QuantityReturned]  DEFAULT ((0)) FOR [QuantityReturned]
GO
/****** Object:  Default [DF_bvc_LineItem_QuantityShipped]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_QuantityShipped]  DEFAULT ((0)) FOR [QuantityShipped]
GO
/****** Object:  Default [DF_bvc_LineItem_StatusCode]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_StatusCode]  DEFAULT ('') FOR [StatusCode]
GO
/****** Object:  Default [DF_bvc_LineItem_StatusName]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_StatusName]  DEFAULT (N'') FOR [StatusName]
GO
/****** Object:  Default [DF_bvc_LineItem_SelectionData]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_SelectionData]  DEFAULT ('') FOR [SelectionData]
GO
/****** Object:  Default [DF_bvc_LineItem_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_LineItem_ShippingScheduleId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShippingScheduleId]  DEFAULT ('') FOR [ShippingScheduleId]
GO
/****** Object:  Default [DF_bvc_LineItem_TaxScheduleId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_TaxScheduleId]  DEFAULT ('') FOR [TaxScheduleId]
GO
/****** Object:  Default [DF_bvc_LineItem_ShippingWeightSingle]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShippingWeightSingle]  DEFAULT ((0)) FOR [ProductShippingWeight]
GO
/****** Object:  Default [DF_bvc_LineItem_ProductShippingLength]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ProductShippingLength]  DEFAULT ((0)) FOR [ProductShippingLength]
GO
/****** Object:  Default [DF_bvc_LineItem_ProductShippingWidth]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ProductShippingWidth]  DEFAULT ((0)) FOR [ProductShippingWidth]
GO
/****** Object:  Default [DF_bvc_LineItem_ProductShippingHeight]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ProductShippingHeight]  DEFAULT ((0)) FOR [ProductShippingHeight]
GO
/****** Object:  Default [DF_bvc_LineItem_ShipFromAddress]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShipFromAddress]  DEFAULT ('') FOR [ShipFromAddress]
GO
/****** Object:  Default [DF_bvc_LineItem_ShipFromMode]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShipFromMode]  DEFAULT ((1)) FOR [ShipFromMode]
GO
/****** Object:  Default [DF_bvc_LineItem_ShipFromNotificationId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShipFromNotificationId]  DEFAULT ('') FOR [ShipFromNotificationId]
GO
/****** Object:  Default [DF_bvc_LineItem_ShipSeparately]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ShipSeparately]  DEFAULT ((0)) FOR [ShipSeparately]
GO
/****** Object:  Default [DF_bvc_LineItem_ExtraShipCharge]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem] ADD  CONSTRAINT [DF_bvc_LineItem_ExtraShipCharge]  DEFAULT ((0)) FOR [ExtraShipCharge]
GO
/****** Object:  Default [DF_bvc_MailingList_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingList] ADD  CONSTRAINT [DF_bvc_MailingList_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_MailingList_Name]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingList] ADD  CONSTRAINT [DF_bvc_MailingList_Name]  DEFAULT ('') FOR [Name]
GO
/****** Object:  Default [DF_bvc_MailingList_LastUpdatedUtc]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingList] ADD  CONSTRAINT [DF_bvc_MailingList_LastUpdatedUtc]  DEFAULT ('2001-01-01 00:00') FOR [LastUpdatedUtc]
GO
/****** Object:  Default [DF_bvc_MailingListMember_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingListMember] ADD  CONSTRAINT [DF_bvc_MailingListMember_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_MailingListMember_FirstName]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingListMember] ADD  CONSTRAINT [DF_bvc_MailingListMember_FirstName]  DEFAULT ('') FOR [FirstName]
GO
/****** Object:  Default [DF_bvc_MailingListMember_LastName]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingListMember] ADD  CONSTRAINT [DF_bvc_MailingListMember_LastName]  DEFAULT ('') FOR [LastName]
GO
/****** Object:  Default [DF_bvc_MailingListMember_LastUpdatedUtc]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingListMember] ADD  CONSTRAINT [DF_bvc_MailingListMember_LastUpdatedUtc]  DEFAULT ('2001-01-01') FOR [LastUpdatedUtc]
GO
/****** Object:  Default [DF_bvc_Manufacturer_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Manufacturer] ADD  CONSTRAINT [DF_bvc_Manufacturer_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Order_CustomProperties]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_CustomProperties]  DEFAULT (N'') FOR [CustomProperties]
GO
/****** Object:  Default [DF_bvc_Order_FraudScore]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_FraudScore]  DEFAULT ((-1)) FOR [FraudScore]
GO
/****** Object:  Default [DF_bvc_Order_HandlingTotal]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_HandlingTotal]  DEFAULT ((0)) FOR [HandlingTotal]
GO
/****** Object:  Default [DF_bvc_Order_Instructions]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_Instructions]  DEFAULT (N'') FOR [Instructions]
GO
/****** Object:  Default [DF_bvc_Order_IsPlaced]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_IsPlaced]  DEFAULT ((0)) FOR [IsPlaced]
GO
/****** Object:  Default [DF_bvc_Order_OrderDiscounts]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_OrderDiscounts]  DEFAULT ((0)) FOR [OrderDiscounts]
GO
/****** Object:  Default [DF_bvc_Order_OrderDiscountDetails]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_OrderDiscountDetails]  DEFAULT ('') FOR [OrderDiscountDetails]
GO
/****** Object:  Default [DF_bvc_Order_OrderNumber]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_OrderNumber]  DEFAULT (N'') FOR [OrderNumber]
GO
/****** Object:  Default [DF_bvc_Order_ShippingAddress]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingAddress]  DEFAULT (N'') FOR [ShippingAddress]
GO
/****** Object:  Default [DF_bvc_Order_ShippingMethodId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingMethodId]  DEFAULT ('') FOR [ShippingMethodId]
GO
/****** Object:  Default [DF_bvc_Order_ShippingMethodDisplayName]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingMethodDisplayName]  DEFAULT (N'') FOR [ShippingMethodDisplayName]
GO
/****** Object:  Default [DF_bvc_Order_ShippingProviderId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingProviderId]  DEFAULT ('') FOR [ShippingProviderId]
GO
/****** Object:  Default [DF_bvc_Order_ShippingProviderServiceCode]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingProviderServiceCode]  DEFAULT (N'') FOR [ShippingProviderServiceCode]
GO
/****** Object:  Default [DF_bvc_Order_ShippingTotal]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingTotal]  DEFAULT ((0)) FOR [ShippingTotal]
GO
/****** Object:  Default [DF_bvc_Order_ShippingDiscounts]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingDiscounts]  DEFAULT ((0)) FOR [ShippingDiscounts]
GO
/****** Object:  Default [DF_bvc_Order_ShippingDiscountDetails]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ShippingDiscountDetails]  DEFAULT ('') FOR [ShippingDiscountDetails]
GO
/****** Object:  Default [DF_bvc_Order_SubTotal]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_SubTotal]  DEFAULT ((0)) FOR [SubTotal]
GO
/****** Object:  Default [DF_bvc_Order_TaxTotal]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_TaxTotal]  DEFAULT ((0)) FOR [TaxTotal]
GO
/****** Object:  Default [DF_bvc_Order_TaxTotal2]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_TaxTotal2]  DEFAULT ((0)) FOR [TaxTotal2]
GO
/****** Object:  Default [DF_bvc_Order_UserEmail]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_UserEmail]  DEFAULT (N'') FOR [UserEmail]
GO
/****** Object:  Default [DF_bvc_Order_StatusCode]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_StatusCode]  DEFAULT ('') FOR [StatusCode]
GO
/****** Object:  Default [DF_bvc_Order_StatusName]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_StatusName]  DEFAULT (N'') FOR [StatusName]
GO
/****** Object:  Default [DF_bvc_Order_ThirdPartyOrderId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_ThirdPartyOrderId]  DEFAULT ('') FOR [ThirdPartyOrderId]
GO
/****** Object:  Default [DF_bvc_Order_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Order] ADD  CONSTRAINT [DF_bvc_Order_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_OrderCoupon_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderCoupon] ADD  CONSTRAINT [DF_bvc_OrderCoupon_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_OrderCoupon_UserId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderCoupon] ADD  CONSTRAINT [DF_bvc_OrderCoupon_UserId]  DEFAULT ('') FOR [UserId]
GO
/****** Object:  Default [DF_bvc_OrderCoupon_IsUsed]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderCoupon] ADD  CONSTRAINT [DF_bvc_OrderCoupon_IsUsed]  DEFAULT ((0)) FOR [IsUsed]
GO
/****** Object:  Default [DF_bvc_OrderNote_IsPublic]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderNote] ADD  CONSTRAINT [DF_bvc_OrderNote_IsPublic]  DEFAULT ((0)) FOR [IsPublic]
GO
/****** Object:  Default [DF_bvc_OrderNote_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderNote] ADD  CONSTRAINT [DF_bvc_OrderNote_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_OrderPackage_LastUpdatedUtc]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderPackage] ADD  CONSTRAINT [DF_bvc_OrderPackage_LastUpdatedUtc]  DEFAULT ('2011-01-01') FOR [LastUpdatedUtc]
GO
/****** Object:  Default [DF_bvc_OrderPackage_CustomProperties]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderPackage] ADD  CONSTRAINT [DF_bvc_OrderPackage_CustomProperties]  DEFAULT (N'n''') FOR [CustomProperties]
GO
/****** Object:  Default [DF_bvc_OrderPackage_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderPackage] ADD  CONSTRAINT [DF_bvc_OrderPackage_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Policy_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Policy] ADD  CONSTRAINT [DF_bvc_Policy_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Policy_PolicyType]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Policy] ADD  CONSTRAINT [DF_bvc_Policy_PolicyType]  DEFAULT ((100)) FOR [PolicyType]
GO
/****** Object:  Default [DF_bvc_PolicyBlock_DescriptionPreTransform]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_PolicyBlock] ADD  CONSTRAINT [DF_bvc_PolicyBlock_DescriptionPreTransform]  DEFAULT (N'') FOR [DescriptionPreTransform]
GO
/****** Object:  Default [DF_bvc_PolicyBlock_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_PolicyBlock] ADD  CONSTRAINT [DF_bvc_PolicyBlock_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_PriceGroup_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_PriceGroup] ADD  CONSTRAINT [DF_bvc_PriceGroup_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Product_RewriteUrl]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_RewriteUrl]  DEFAULT (N'') FOR [RewriteUrl]
GO
/****** Object:  Default [DF_bvc_Product_SitePriceOverrideText]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_SitePriceOverrideText]  DEFAULT (N'') FOR [SitePriceOverrideText]
GO
/****** Object:  Default [DF_bvc_Product_PreTransformLongDescription]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_PreTransformLongDescription]  DEFAULT (N'') FOR [PreTransformLongDescription]
GO
/****** Object:  Default [DF_bvc_Product_SmallImageAlternateText]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_SmallImageAlternateText]  DEFAULT ('') FOR [SmallImageAlternateText]
GO
/****** Object:  Default [DF_bvc_Product_MediumImageAlternateText]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_MediumImageAlternateText]  DEFAULT ('') FOR [MediumImageAlternateText]
GO
/****** Object:  Default [DF_bvc_Product_CustomProperties]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_CustomProperties]  DEFAULT ('') FOR [CustomProperties]
GO
/****** Object:  Default [DF_bvc_Product_GiftWrapPrice]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_GiftWrapPrice]  DEFAULT ((0.00)) FOR [GiftWrapPrice]
GO
/****** Object:  Default [DF_bvc_Product_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Product_Featured]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_Featured]  DEFAULT ((0)) FOR [Featured]
GO
/****** Object:  Default [DF_bvc_Product_AllowReviews]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_AllowReviews]  DEFAULT ((1)) FOR [AllowReviews]
GO
/****** Object:  Default [DF_bvc_Product_DescriptionTabs]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_DescriptionTabs]  DEFAULT ('') FOR [DescriptionTabs]
GO
/****** Object:  Default [DF_bvc_Product_OutOfStockMode]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_OutOfStockMode]  DEFAULT ((0)) FOR [OutOfStockMode]
GO
/****** Object:  Default [DF_bvc_Product_IsInStock]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_Product] ADD  CONSTRAINT [DF_bvc_Product_IsInStock]  DEFAULT ((1)) FOR [IsAvailableForSale]
GO
/****** Object:  Default [DF_bvc_ProductFile_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductFile] ADD  CONSTRAINT [DF_bvc_ProductFile_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductFileXProduct_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductFileXProduct] ADD  CONSTRAINT [DF_bvc_ProductFileXProduct_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductFilter_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductFilter] ADD  CONSTRAINT [DF_bvc_ProductFilter_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductImage_SortOrder]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductImage] ADD  CONSTRAINT [DF_bvc_ProductImage_SortOrder]  DEFAULT ((-1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_bvc_ProductImage_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductImage] ADD  CONSTRAINT [DF_bvc_ProductImage_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductInventory_VariantId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductInventory] ADD  CONSTRAINT [DF_bvc_ProductInventory_VariantId]  DEFAULT ('') FOR [VariantId]
GO
/****** Object:  Default [DF_bvc_ProductInventory_QuantityOnHand]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductInventory] ADD  CONSTRAINT [DF_bvc_ProductInventory_QuantityOnHand]  DEFAULT ((0)) FOR [QuantityOnHand]
GO
/****** Object:  Default [DF_bvc_ProductInventory_QuantityReserved]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductInventory] ADD  CONSTRAINT [DF_bvc_ProductInventory_QuantityReserved]  DEFAULT ((0)) FOR [QuantityReserved]
GO
/****** Object:  Default [DF_bvc_ProductInventory_LowStockPoint]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductInventory] ADD  CONSTRAINT [DF_bvc_ProductInventory_LowStockPoint]  DEFAULT ((0)) FOR [LowStockPoint]
GO
/****** Object:  Default [DF_bvc_ProductInventory_StoreId]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductInventory] ADD  CONSTRAINT [DF_bvc_ProductInventory_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_ProductProperty_DisplayOnSite]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductProperty] ADD  CONSTRAINT [DF_ProductProperty_DisplayOnSite]  DEFAULT ((1)) FOR [DisplayOnSite]
GO
/****** Object:  Default [DF_ProductProperty_IsRequired]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductProperty] ADD  CONSTRAINT [DF_ProductProperty_IsRequired]  DEFAULT ((0)) FOR [DisplayToDropShipper]
GO
/****** Object:  Default [DF_ProductProperty_TypeCode]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductProperty] ADD  CONSTRAINT [DF_ProductProperty_TypeCode]  DEFAULT ((0)) FOR [TypeCode]
GO
/****** Object:  Default [DF_ProductProperty_CultureCode]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductProperty] ADD  CONSTRAINT [DF_ProductProperty_CultureCode]  DEFAULT ('en-US') FOR [CultureCode]
GO
/****** Object:  Default [DF_bvc_ProductProperty_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductProperty] ADD  CONSTRAINT [DF_bvc_ProductProperty_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_ProductPropertyChoices_SortOrder]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductPropertyChoice] ADD  CONSTRAINT [DF_ProductPropertyChoices_SortOrder]  DEFAULT ((-1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_bvc_ProductPropertyChoice_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductPropertyChoice] ADD  CONSTRAINT [DF_bvc_ProductPropertyChoice_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductPropertyValue_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductPropertyValue] ADD  CONSTRAINT [DF_bvc_ProductPropertyValue_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductRelationships_IsSubtitute]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductRelationships] ADD  CONSTRAINT [DF_bvc_ProductRelationships_IsSubtitute]  DEFAULT ((0)) FOR [IsSubstitute]
GO
/****** Object:  Default [DF_bvc_ProductRelationships_SortOrder]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductRelationships] ADD  CONSTRAINT [DF_bvc_ProductRelationships_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_bvc_ProductReview_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductReview] ADD  CONSTRAINT [DF_bvc_ProductReview_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductType_IsPermanent]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductType] ADD  CONSTRAINT [DF_bvc_ProductType_IsPermanent]  DEFAULT ((0)) FOR [IsPermanent]
GO
/****** Object:  Default [DF_bvc_ProductType_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductType] ADD  CONSTRAINT [DF_bvc_ProductType_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_ProductTypeProperties_SortOrder]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty] ADD  CONSTRAINT [DF_ProductTypeProperties_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_bvc_ProductTypeXProductProperty_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty] ADD  CONSTRAINT [DF_bvc_ProductTypeXProductProperty_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductVolumeDiscounts_Qty]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductVolumeDiscounts] ADD  CONSTRAINT [DF_bvc_ProductVolumeDiscounts_Qty]  DEFAULT ((1)) FOR [Qty]
GO
/****** Object:  Default [DF_bvc_ProductVolumeDiscounts_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductVolumeDiscounts] ADD  CONSTRAINT [DF_bvc_ProductVolumeDiscounts_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ProductXCategory_SortOrder]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductXCategory] ADD  CONSTRAINT [DF_bvc_ProductXCategory_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
/****** Object:  Default [DF_bvc_ProductXCategory_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductXCategory] ADD  CONSTRAINT [DF_bvc_ProductXCategory_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Promotions_Mode]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_Promotions] ADD  CONSTRAINT [DF_bvc_Promotions_Mode]  DEFAULT ((0)) FOR [Mode]
GO
/****** Object:  Default [DF_bvc_Promotions_CustomerDescription]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_Promotions] ADD  CONSTRAINT [DF_bvc_Promotions_CustomerDescription]  DEFAULT ('') FOR [CustomerDescription]
GO
/****** Object:  Default [DF_bvc_Promotions_QualificationsXml]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_Promotions] ADD  CONSTRAINT [DF_bvc_Promotions_QualificationsXml]  DEFAULT ('') FOR [QualificationsXml]
GO
/****** Object:  Default [DF_bvc_Promotions_ActionsXml]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_Promotions] ADD  CONSTRAINT [DF_bvc_Promotions_ActionsXml]  DEFAULT ('') FOR [ActionsXml]
GO
/****** Object:  Default [DF_bvc_RMA_DateOfReturn]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_RMA] ADD  CONSTRAINT [DF_bvc_RMA_DateOfReturn]  DEFAULT ('01/01/2000') FOR [DateOfReturn]
GO
/****** Object:  Default [DF_bvc_RMA_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_RMA] ADD  CONSTRAINT [DF_bvc_RMA_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_RMAItem_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_RMAItem] ADD  CONSTRAINT [DF_bvc_RMAItem_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_SearchQuery_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_SearchQuery] ADD  CONSTRAINT [DF_bvc_SearchQuery_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ShippingMethod_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ShippingMethod] ADD  CONSTRAINT [DF_bvc_ShippingMethod_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_ShippingMethod_ZoneId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ShippingMethod] ADD  CONSTRAINT [DF_bvc_ShippingMethod_ZoneId]  DEFAULT ((0)) FOR [ZoneId]
GO
/****** Object:  Default [DF_bvc_ShippingMethod_Settings]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ShippingMethod] ADD  CONSTRAINT [DF_bvc_ShippingMethod_Settings]  DEFAULT ('') FOR [Settings]
GO
/****** Object:  Default [DF_bvc_User_Locked]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_User] ADD  CONSTRAINT [DF_bvc_User_Locked]  DEFAULT ((0)) FOR [Locked]
GO
/****** Object:  Default [DF_bvc_User_FailedLoginCount]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_User] ADD  CONSTRAINT [DF_bvc_User_FailedLoginCount]  DEFAULT ((0)) FOR [FailedLoginCount]
GO
/****** Object:  Default [DF_bvc_User_BillingAddress]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_User] ADD  CONSTRAINT [DF_bvc_User_BillingAddress]  DEFAULT (N'') FOR [Phones]
GO
/****** Object:  Default [DF_bvc_User_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_User] ADD  CONSTRAINT [DF_bvc_User_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_User_ShippingAddress]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_User] ADD  CONSTRAINT [DF_bvc_User_ShippingAddress]  DEFAULT ('') FOR [ShippingAddress]
GO
/****** Object:  Default [DF_bvc_User_BillingAddress_1]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_User] ADD  CONSTRAINT [DF_bvc_User_BillingAddress_1]  DEFAULT ('') FOR [BillingAddress]
GO
/****** Object:  Default [DF_bvc_UserQuestions_Order]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_UserQuestions] ADD  CONSTRAINT [DF_bvc_UserQuestions_Order]  DEFAULT ((0)) FOR [Order]
GO
/****** Object:  Default [DF_bvc_UserQuestions_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_UserQuestions] ADD  CONSTRAINT [DF_bvc_UserQuestions_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_UserXContact_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_UserXContact] ADD  CONSTRAINT [DF_bvc_UserXContact_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_bvc_Vendor_StoreId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_Vendor] ADD  CONSTRAINT [DF_bvc_Vendor_StoreId]  DEFAULT ((0)) FOR [StoreId]
GO
/****** Object:  Default [DF_ecommrc_OrderTransactions_OrderNumber]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD  CONSTRAINT [DF_ecommrc_OrderTransactions_OrderNumber]  DEFAULT ('') FOR [OrderNumber]
GO
/****** Object:  Default [DF_ecommrc_OrderTransactions_Messages]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD  CONSTRAINT [DF_ecommrc_OrderTransactions_Messages]  DEFAULT ('') FOR [Messages]
GO
/****** Object:  Default [DF_ecommrc_OrderTransactions_CheckNumber]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD  CONSTRAINT [DF_ecommrc_OrderTransactions_CheckNumber]  DEFAULT ('') FOR [CheckNumber]
GO
/****** Object:  Default [DF_ecommrc_OrderTransactions_PurchaseOrderNumber]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD  CONSTRAINT [DF_ecommrc_OrderTransactions_PurchaseOrderNumber]  DEFAULT ('') FOR [PurchaseOrderNumber]
GO
/****** Object:  Default [DF_ecommrc_OrderTransactions_GiftCardNumber]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD  CONSTRAINT [DF_ecommrc_OrderTransactions_GiftCardNumber]  DEFAULT ('') FOR [GiftCardNumber]
GO
/****** Object:  Default [DF_ecommrc_OrderTransactions_CompanyAccountNumber]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions] ADD  CONSTRAINT [DF_ecommrc_OrderTransactions_CompanyAccountNumber]  DEFAULT ('') FOR [CompanyAccountNumber]
GO
/****** Object:  Default [DF_ecommrc_ShippingZones_Areas]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_ShippingZones] ADD  CONSTRAINT [DF_ecommrc_ShippingZones_Areas]  DEFAULT ('') FOR [Areas]
GO
/****** Object:  Default [DF_ecommrc_Stores_Status]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF_ecommrc_Stores_SubscriptionId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_SubscriptionId]  DEFAULT ((0)) FOR [SubscriptionId]
GO
/****** Object:  Default [DF_ecommrc_Stores_PlanId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_PlanId]  DEFAULT ((0)) FOR [PlanId]
GO
/****** Object:  Default [DF_ecommrc_Stores_CustomUrl]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_CustomUrl]  DEFAULT ('') FOR [CustomUrl]
GO
/****** Object:  Default [DF_ecommrc_Stores_CurrentPlanRate]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_CurrentPlanRate]  DEFAULT ((0)) FOR [CurrentPlanRate]
GO
/****** Object:  Default [DF_ecommrc_Stores_CurrentPlanPercent]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_CurrentPlanPercent]  DEFAULT ((0)) FOR [CurrentPlanPercent]
GO
/****** Object:  Default [DF_ecommrc_Stores_CurrentPlanDayOfMonth]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Stores] ADD  CONSTRAINT [DF_ecommrc_Stores_CurrentPlanDayOfMonth]  DEFAULT ((1)) FOR [CurrentPlanDayOfMonth]
GO
/****** Object:  Default [DF_ecommrc_StoresXUsers_AccessMode]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_StoresXUsers] ADD  CONSTRAINT [DF_ecommrc_StoresXUsers_AccessMode]  DEFAULT ((1)) FOR [AccessMode]
GO
/****** Object:  Default [DF_ecommrc_UserAccounts_statuscode]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_UserAccounts] ADD  CONSTRAINT [DF_ecommrc_UserAccounts_statuscode]  DEFAULT ((1)) FOR [statuscode]
GO
/****** Object:  Default [DF_ecommrc_UserAccounts_Salt]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_UserAccounts] ADD  CONSTRAINT [DF_ecommrc_UserAccounts_Salt]  DEFAULT ('') FOR [Salt]
GO
/****** Object:  Default [DF_ecommrc_UserAccounts_ResetKey]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_UserAccounts] ADD  CONSTRAINT [DF_ecommrc_UserAccounts_ResetKey]  DEFAULT ('') FOR [ResetKey]
GO
/****** Object:  Default [DF_PageVersions_Areas]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[PageVersions] ADD  CONSTRAINT [DF_PageVersions_Areas]  DEFAULT ('') FOR [Areas]
GO
/****** Object:  Default [DF_WishListItems_CustomerId]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[WishListItems] ADD  CONSTRAINT [DF_WishListItems_CustomerId]  DEFAULT ((0)) FOR [CustomerId]
GO
/****** Object:  ForeignKey [FK_bv_SearchObjectWords_bv_SearchLexicon]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bv_SearchObjectWords]  WITH CHECK ADD  CONSTRAINT [FK_bv_SearchObjectWords_bv_SearchLexicon] FOREIGN KEY([WordId])
REFERENCES [dbo].[bv_SearchLexicon] ([Id])
GO
ALTER TABLE [dbo].[bv_SearchObjectWords] CHECK CONSTRAINT [FK_bv_SearchObjectWords_bv_SearchLexicon]
GO
/****** Object:  ForeignKey [FK_bv_SearchObjectWords_bv_SearchObjects]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bv_SearchObjectWords]  WITH CHECK ADD  CONSTRAINT [FK_bv_SearchObjectWords_bv_SearchObjects] FOREIGN KEY([SearchObjectId])
REFERENCES [dbo].[bv_SearchObjects] ([Id])
GO
ALTER TABLE [dbo].[bv_SearchObjectWords] CHECK CONSTRAINT [FK_bv_SearchObjectWords_bv_SearchObjects]
GO
/****** Object:  ForeignKey [FK_bvc_ContentBlock_bvc_ContentColumn]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ContentBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_ContentBlock_bvc_ContentColumn] FOREIGN KEY([ColumnID])
REFERENCES [dbo].[bvc_ContentColumn] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ContentBlock] CHECK CONSTRAINT [FK_bvc_ContentBlock_bvc_ContentColumn]
GO
/****** Object:  ForeignKey [FK_bvc_LineItem_bvc_LineItem]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_LineItem]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_LineItem_bvc_LineItem] FOREIGN KEY([OrderBvin])
REFERENCES [dbo].[bvc_Order] ([bvin])
GO
ALTER TABLE [dbo].[bvc_LineItem] CHECK CONSTRAINT [FK_bvc_LineItem_bvc_LineItem]
GO
/****** Object:  ForeignKey [FK_bvc_MailingListMember_bvc_MailingList]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_MailingListMember]  WITH CHECK ADD  CONSTRAINT [FK_bvc_MailingListMember_bvc_MailingList] FOREIGN KEY([ListID])
REFERENCES [dbo].[bvc_MailingList] ([Id])
GO
ALTER TABLE [dbo].[bvc_MailingListMember] CHECK CONSTRAINT [FK_bvc_MailingListMember_bvc_MailingList]
GO
/****** Object:  ForeignKey [FK_bvc_OrderCoupon_bvc_Order]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderCoupon]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_OrderCoupon_bvc_Order] FOREIGN KEY([OrderBvin])
REFERENCES [dbo].[bvc_Order] ([bvin])
GO
ALTER TABLE [dbo].[bvc_OrderCoupon] CHECK CONSTRAINT [FK_bvc_OrderCoupon_bvc_Order]
GO
/****** Object:  ForeignKey [FK_bvc_OrderNote_bvc_Order]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_OrderNote]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_OrderNote_bvc_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[bvc_Order] ([bvin])
GO
ALTER TABLE [dbo].[bvc_OrderNote] CHECK CONSTRAINT [FK_bvc_OrderNote_bvc_Order]
GO
/****** Object:  ForeignKey [FK_bvc_PolicyBlock_bvc_Policy]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_PolicyBlock]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_PolicyBlock_bvc_Policy] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[bvc_Policy] ([bvin])
GO
ALTER TABLE [dbo].[bvc_PolicyBlock] CHECK CONSTRAINT [FK_bvc_PolicyBlock_bvc_Policy]
GO
/****** Object:  ForeignKey [FK_bvc_ProductFileXProduct_bvc_ProductFile]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductFileXProduct]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_ProductFileXProduct_bvc_ProductFile] FOREIGN KEY([ProductFileId])
REFERENCES [dbo].[bvc_ProductFile] ([bvin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bvc_ProductFileXProduct] CHECK CONSTRAINT [FK_bvc_ProductFileXProduct_bvc_ProductFile]
GO
/****** Object:  ForeignKey [FK_bvc_ProductInventory_bvc_Product]    Script Date: 02/06/2012 19:31:04 ******/
ALTER TABLE [dbo].[bvc_ProductInventory]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_ProductInventory_bvc_Product] FOREIGN KEY([ProductBvin])
REFERENCES [dbo].[bvc_Product] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ProductInventory] CHECK CONSTRAINT [FK_bvc_ProductInventory_bvc_Product]
GO
/****** Object:  ForeignKey [FK_bvc_ProductOptionsItems_bvc_ProductOptions]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductOptionsItems]  WITH CHECK ADD  CONSTRAINT [FK_bvc_ProductOptionsItems_bvc_ProductOptions] FOREIGN KEY([OptionBvin])
REFERENCES [dbo].[bvc_ProductOptions] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ProductOptionsItems] CHECK CONSTRAINT [FK_bvc_ProductOptionsItems_bvc_ProductOptions]
GO
/****** Object:  ForeignKey [FK_bvc_ProductPropertyChoice_bvc_ProductProperty]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductPropertyChoice]  WITH CHECK ADD  CONSTRAINT [FK_bvc_ProductPropertyChoice_bvc_ProductProperty] FOREIGN KEY([PropertyId])
REFERENCES [dbo].[bvc_ProductProperty] ([Id])
GO
ALTER TABLE [dbo].[bvc_ProductPropertyChoice] CHECK CONSTRAINT [FK_bvc_ProductPropertyChoice_bvc_ProductProperty]
GO
/****** Object:  ForeignKey [FK_bvc_ProductPropertyValue_bvc_Product]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductPropertyValue]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_ProductPropertyValue_bvc_Product] FOREIGN KEY([ProductBvin])
REFERENCES [dbo].[bvc_Product] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ProductPropertyValue] CHECK CONSTRAINT [FK_bvc_ProductPropertyValue_bvc_Product]
GO
/****** Object:  ForeignKey [FK_ProductTypeProperties_ProductType]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductTypeProperties_ProductType] FOREIGN KEY([ProductTypeBvin])
REFERENCES [dbo].[bvc_ProductType] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ProductTypeXProductProperty] CHECK CONSTRAINT [FK_ProductTypeProperties_ProductType]
GO
/****** Object:  ForeignKey [FK_ProductXCategory_bvc_Category]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductXCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductXCategory_bvc_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[bvc_Category] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ProductXCategory] CHECK CONSTRAINT [FK_ProductXCategory_bvc_Category]
GO
/****** Object:  ForeignKey [FK_ProductXCategory_bvc_Product]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductXCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductXCategory_bvc_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[bvc_Product] ([bvin])
GO
ALTER TABLE [dbo].[bvc_ProductXCategory] CHECK CONSTRAINT [FK_ProductXCategory_bvc_Product]
GO
/****** Object:  ForeignKey [FK_bvc_ProductXOption_bvc_ProductXOption]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_ProductXOption]  WITH CHECK ADD  CONSTRAINT [FK_bvc_ProductXOption_bvc_ProductXOption] FOREIGN KEY([Id])
REFERENCES [dbo].[bvc_ProductXOption] ([Id])
GO
ALTER TABLE [dbo].[bvc_ProductXOption] CHECK CONSTRAINT [FK_bvc_ProductXOption_bvc_ProductXOption]
GO
/****** Object:  ForeignKey [FK_bvc_RMAItem_bvc_RMA]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_RMAItem]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_RMAItem_bvc_RMA] FOREIGN KEY([RMABvin])
REFERENCES [dbo].[bvc_RMA] ([bvin])
GO
ALTER TABLE [dbo].[bvc_RMAItem] CHECK CONSTRAINT [FK_bvc_RMAItem_bvc_RMA]
GO
/****** Object:  ForeignKey [FK_bvc_UserXAffiliate_bvc_User]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[bvc_UserXContact]  WITH NOCHECK ADD  CONSTRAINT [FK_bvc_UserXAffiliate_bvc_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[bvc_User] ([bvin])
GO
ALTER TABLE [dbo].[bvc_UserXContact] CHECK CONSTRAINT [FK_bvc_UserXAffiliate_bvc_User]
GO
/****** Object:  ForeignKey [FK_Conversations_ConversationGroups]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_ConversationGroups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ConversationGroups] ([Id])
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_ConversationGroups]
GO
/****** Object:  ForeignKey [FK_ecommrc_AuthTokens_ecommrc_UserAccounts]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_AuthTokens]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_AuthTokens_ecommrc_UserAccounts] FOREIGN KEY([UserId])
REFERENCES [dbo].[ecommrc_UserAccounts] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_AuthTokens] CHECK CONSTRAINT [FK_ecommrc_AuthTokens_ecommrc_UserAccounts]
GO
/****** Object:  ForeignKey [FK_ecommrc_OrderTransactions_ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_OrderTransactions]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_OrderTransactions_ecommrc_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_OrderTransactions] CHECK CONSTRAINT [FK_ecommrc_OrderTransactions_ecommrc_Stores]
GO
/****** Object:  ForeignKey [FK_ecommrc_ShippingZones_ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_ShippingZones]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_ShippingZones_ecommrc_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_ShippingZones] CHECK CONSTRAINT [FK_ecommrc_ShippingZones_ecommrc_Stores]
GO
/****** Object:  ForeignKey [FK_ecommrc_StoreSettings_ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_StoreSettings]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_StoreSettings_ecommrc_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_StoreSettings] CHECK CONSTRAINT [FK_ecommrc_StoreSettings_ecommrc_Stores]
GO
/****** Object:  ForeignKey [FK_ecommrc_StoresXUsers_ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_StoresXUsers]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_StoresXUsers_ecommrc_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_StoresXUsers] CHECK CONSTRAINT [FK_ecommrc_StoresXUsers_ecommrc_Stores]
GO
/****** Object:  ForeignKey [FK_ecommrc_StoresXUsers_ecommrc_UserAccounts]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_StoresXUsers]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_StoresXUsers_ecommrc_UserAccounts] FOREIGN KEY([UserId])
REFERENCES [dbo].[ecommrc_UserAccounts] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_StoresXUsers] CHECK CONSTRAINT [FK_ecommrc_StoresXUsers_ecommrc_UserAccounts]
GO
/****** Object:  ForeignKey [FK_ecommrc_Taxes_ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Taxes]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_Taxes_ecommrc_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_Taxes] CHECK CONSTRAINT [FK_ecommrc_Taxes_ecommrc_Stores]
GO
/****** Object:  ForeignKey [FK_ecommrc_Taxes_ecommrc_TaxSchedules]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_Taxes]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_Taxes_ecommrc_TaxSchedules] FOREIGN KEY([TaxScheduleId])
REFERENCES [dbo].[ecommrc_TaxSchedules] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_Taxes] CHECK CONSTRAINT [FK_ecommrc_Taxes_ecommrc_TaxSchedules]
GO
/****** Object:  ForeignKey [FK_ecommrc_TaxSchedules_ecommrc_Stores]    Script Date: 02/06/2012 19:31:05 ******/
ALTER TABLE [dbo].[ecommrc_TaxSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ecommrc_TaxSchedules_ecommrc_Stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[ecommrc_Stores] ([Id])
GO
ALTER TABLE [dbo].[ecommrc_TaxSchedules] CHECK CONSTRAINT [FK_ecommrc_TaxSchedules_ecommrc_Stores]
GO
