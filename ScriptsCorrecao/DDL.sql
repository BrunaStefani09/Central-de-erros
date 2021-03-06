-- USE Master
-- DROP DATABASE ErrorMonitoring
-- GO

CREATE DATABASE ErrorMonitoring;
GO

USE ErrorMonitoring;
GO

-- A frequência do log pode ser contada com o Count

CREATE TABLE EVENTS(
ID INT PRIMARY KEY IDENTITY,
eStatus VARCHAR(255) NOT NULL,
eLevel VARCHAR(255) NOT NULL,
eOrigin VARCHAR(255),
eDate DATE NOT NULL,
eMessage VARCHAR(255),
eDescription VARCHAR(255),
eException VARCHAR(MAX),
eColectedBy VARCHAR(255)
);
GO

CREATE TABLE ENVIRONMENTS(
ID INT PRIMARY KEY IDENTITY,
envName VARCHAR(200) NOT NULL
);
GO

CREATE TABLE PROJECTS(
ID INT PRIMARY KEY IDENTITY,
pName VARCHAR(255) NOT NULL,
IsMobile BIT DEFAULT 0,
IsWeb BIT DEFAULT 0,
IsDesktop BIT DEFAULT 0
);
GO

CREATE TABLE PROJECTS_ENVIRONMENTS(
ID INT PRIMARY KEY IDENTITY,
Project INT FOREIGN KEY REFERENCES PROJECTS(ID)  NOT NULL,
Environment INT FOREIGN KEY REFERENCES  ENVIRONMENTS(ID)  NOT NULL
);
GO


CREATE TABLE LOGS(
ID INT PRIMARY KEY IDENTITY,
Project INT FOREIGN KEY REFERENCES PROJECTS(ID) NOT NULL,
EventType INT FOREIGN KEY REFERENCES EVENTS(ID) NOT NULL,
Archived BIT DEFAULT 0
);
GO


