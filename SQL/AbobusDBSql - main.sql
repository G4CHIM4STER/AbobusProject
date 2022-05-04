USE master;
GO

DROP DATABASE AbobusDB;
GO

CREATE DATABASE AbobusDB;
GO

CREATE TABLE AbobusDB.dbo.ApplicationTypes ( 
	id_applicationtype   int    IDENTITY (1, 1)  NOT NULL,
	name                 varchar(50)      NOT NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_ApplicationType PRIMARY KEY  ( id_applicationtype ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Docs ( 
	id_docs              int    IDENTITY (1, 1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	path                 nvarchar(max)      NOT NULL,
	CONSTRAINT pk_Docs PRIMARY KEY  ( id_docs ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Positions ( 
	id_position          int    IDENTITY (1, 1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Position PRIMARY KEY  ( id_position ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Regions ( 
	id_region            int    IDENTITY (1, 1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Region PRIMARY KEY  ( id_region ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Roles ( 
	id_role              int    IDENTITY (1, 1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Role PRIMARY KEY  ( id_role ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Rooms ( 
	id_room              int    IDENTITY (1, 1)  NOT NULL,
	appointment          varchar(200)      NOT NULL,
	floor                int      NULL,
	space                int      NOT NULL,
	CONSTRAINT pk_Room PRIMARY KEY  ( id_room ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Services ( 
	id_services          int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	description          varchar(200)      NOT NULL,
	cost                 int      NOT NULL,
	CONSTRAINT pk_Services PRIMARY KEY  ( id_services ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Statuses ( 
	id_status            int    IDENTITY (1, 1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_St PRIMARY KEY  ( id_status ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Clients ( 
	id_client            int    IDENTITY (1, 1)  NOT NULL,
	id_room              int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	mail                 varchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NOT NULL,
	CONSTRAINT pk_Client PRIMARY KEY  ( id_client ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Contract ( 
	id_contract          int    IDENTITY (1, 1)  NOT NULL,
	id_docs              int      NOT NULL,
	id_client            int      NOT NULL,
	name                 varchar(100)      NULL,
	time_start           time(7)      NULL,
	time_end             time(7)      NULL,
	CONSTRAINT pk_Agreement PRIMARY KEY  ( id_contract ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Employees ( 
	id_employee          int    IDENTITY (1, 1)  NOT NULL,
	id_role              int      NOT NULL,
	id_region            int      NOT NULL,
	id_position          int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NULL,
	mail                 varchar(100)      NULL,
	CONSTRAINT pk_Employee PRIMARY KEY  ( id_employee ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Equipments ( 
	id_equip             int    IDENTITY (1, 1)  NOT NULL,
	id_contract          int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	type                 varchar(100)      NOT NULL,
	serial_number        nvarchar(20)      NOT NULL,
	description          varchar(200)      NULL,
	cost                 int      NOT NULL,
	CONSTRAINT pk_Equipment PRIMARY KEY  ( id_equip ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Applications ( 
	id_application       int    IDENTITY (1, 1)  NOT NULL,
	id_room              int      NOT NULL,
	id_status            int      NOT NULL,
	id_aplicationtype    int      NOT NULL,
	id_equip             int      NOT NULL,
	id_contract          int      NOT NULL,
	id_docs              int      NOT NULL,
	id_employee          int      NOT NULL,
	date                 datetime      NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_Application PRIMARY KEY  ( id_application ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Works ( 
	id_work              int    IDENTITY(1,1)  NOT NULL,
	id_services          int      NOT NULL,
	id_equipment         int      NOT NULL,
	id_application       int      NOT NULL,
	final_cost           int      NOT NULL,
	CONSTRAINT pk_Works PRIMARY KEY  ( id_work ) 
 );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Room FOREIGN KEY ( id_room ) REFERENCES AbobusDB.dbo.Rooms( id_room );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Status FOREIGN KEY ( id_status ) REFERENCES AbobusDB.dbo.Statuses( id_status );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_ApplicationType FOREIGN KEY ( id_aplicationtype ) REFERENCES AbobusDB.dbo.ApplicationTypes( id_applicationtype );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Equipment FOREIGN KEY ( id_equip ) REFERENCES AbobusDB.dbo.Equipments( id_equip );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Agreement FOREIGN KEY ( id_contract ) REFERENCES AbobusDB.dbo.Contract( id_contract );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Docs FOREIGN KEY ( id_docs ) REFERENCES AbobusDB.dbo.Docs( id_docs );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Employee FOREIGN KEY ( id_employee ) REFERENCES AbobusDB.dbo.Employees( id_employee );
GO

ALTER TABLE AbobusDB.dbo.Clients ADD CONSTRAINT fk_Client_Room FOREIGN KEY ( id_room ) REFERENCES AbobusDB.dbo.Rooms( id_room );
GO

ALTER TABLE AbobusDB.dbo.Contract ADD CONSTRAINT fk_agreement_client FOREIGN KEY ( id_client ) REFERENCES AbobusDB.dbo.Clients( id_client );
GO

ALTER TABLE AbobusDB.dbo.Contract ADD CONSTRAINT fk_Agreement_Docs FOREIGN KEY ( id_docs ) REFERENCES AbobusDB.dbo.Docs( id_docs );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Role FOREIGN KEY ( id_role ) REFERENCES AbobusDB.dbo.Roles( id_role );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Region FOREIGN KEY ( id_region ) REFERENCES AbobusDB.dbo.Regions( id_region );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Position FOREIGN KEY ( id_position ) REFERENCES AbobusDB.dbo.Positions( id_position );
GO

ALTER TABLE AbobusDB.dbo.Equipments ADD CONSTRAINT fk_Equipment_Agreement FOREIGN KEY ( id_contract ) REFERENCES AbobusDB.dbo.Contract( id_contract );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Services FOREIGN KEY ( id_services ) REFERENCES AbobusDB.dbo.Services( id_services );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Equipments FOREIGN KEY ( id_equipment ) REFERENCES AbobusDB.dbo.Equipments( id_equip );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Applications FOREIGN KEY ( id_application ) REFERENCES AbobusDB.dbo.Applications( id_application );
GO