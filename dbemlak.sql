	create database dbemlak
go 
use dbemlak
CREATE TABLE [dbo].[tbl_aciklama] (
    [id]       INT           NULL,
    [aciklama] VARCHAR (MAX) NULL
);


CREATE TABLE [dbo].[tbl_admin] (
    [Id]    INT          IDENTITY (1, 1) NOT NULL,
    [kulad] VARCHAR (50) NULL,
    [sifre] VARCHAR (50) NULL,
    [yetki] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


CREATE TABLE [dbo].[tbl_emlak] (
    [ilanid]          INT           IDENTITY (1, 1) NOT NULL,
    [kapakurl]        VARCHAR (50)  NOT NULL,
    [ilantarih]       VARCHAR (50)  NULL,
    [emlaktipi]       VARCHAR (50)  NULL,
    [mkarebrut]       VARCHAR (20)  NULL,
    [mkarenet]        VARCHAR (20)  NULL,
    [odasayi]         VARCHAR (20)  NULL,
    [binayasi]        VARCHAR (10)  NULL,
    [isitma]          VARCHAR (20)  NULL,
    [banyosayi]       VARCHAR (10)  NULL,
    [balkon]          VARCHAR (10)  NULL,
    [esya]            VARCHAR (10)  NULL,
    [sitedurum]       VARCHAR (10)  NULL,
    [aidat]           VARCHAR (10)  NULL,
    [goruntuludiafon] VARCHAR (50)  NULL,
    [fiyat]           INT           NULL,
    [il]              VARCHAR (50)  NULL,
    [ilce]            VARCHAR (50)  NULL,
    [adres]           VARCHAR (MAX) NULL,
    [ilanaciklama]    VARCHAR (MAX) NULL,
    [cephe]           VARCHAR (50)  NULL,
    [isiyalitim]      VARCHAR (10)  NULL,
    [sesyalitim]      VARCHAR (10)  NULL,
    [ilandurum]       VARCHAR (50)  NULL,
    [silid]           VARCHAR (10)  NULL
);

CREATE TABLE [dbo].[tbl_favilan] (
    [favilanid] INT      IDENTITY (1, 1) NOT NULL,
    [ilanid]    INT      NOT NULL,
    [silid]     SMALLINT NULL,
    CONSTRAINT [PK_tbl_favilan] PRIMARY KEY CLUSTERED ([favilanid] ASC)
);


CREATE TABLE [dbo].[tbl_fotograflar] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [fotoid]  INT           NULL,
    [fotourl] VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[tbl_kategori] (
    [kategori_id] INT          IDENTITY (1, 1) NOT NULL,
    [kategori_ad] VARCHAR (50) NULL
);
