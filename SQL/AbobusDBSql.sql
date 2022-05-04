CREATE TABLE AbonbusDB.dbo.ApplicationType ( 
	id_applicationtype   int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(50)      NOT NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_ApplicationType PRIMARY KEY  ( id_applicationtype ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.DocTemplate ( 
	id_doctemplate       int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_DocTemlate PRIMARY KEY  ( id_doctemplate ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Docs ( 
	id_docs              int    IDENTITY(1,1)  NOT NULL,
	id_doctemplate       int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	path                 nvarchar(max)      NOT NULL,
	CONSTRAINT pk_Docs PRIMARY KEY  ( id_docs ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Position ( 
	id_position          int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Position PRIMARY KEY  ( id_position ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Region ( 
	id_region            int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Region PRIMARY KEY  ( id_region ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Role ( 
	id_role              int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Role PRIMARY KEY  ( id_role ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Room ( 
	id_room              int    IDENTITY(1,1)  NOT NULL,
	appointment          varchar(200)      NOT NULL,
	floor                int      NULL,
	space                int      NOT NULL,
	CONSTRAINT pk_Room PRIMARY KEY  ( id_room ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.[Status] ( 
	id_status            int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_St PRIMARY KEY  ( id_status ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Tbl ( 
 );
GO

CREATE TABLE AbonbusDB.dbo.Client ( 
	id_client            int    IDENTITY(1,1)  NOT NULL,
	id_room              int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	mail                 varchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NOT NULL,
	CONSTRAINT pk_Client PRIMARY KEY  ( id_client ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Employee ( 
	id_employee          int    IDENTITY(1,1)  NOT NULL,
	id_role              int      NOT NULL,
	id_region            int      NOT NULL,
	id_position          int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NULL,
	mail                 varchar(100)      NULL,
	CONSTRAINT pk_Employee PRIMARY KEY  ( id_employee ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Agreement ( 
	id_agreement         int    IDENTITY(1,1)  NOT NULL,
	id_docs              int      NOT NULL,
	id_client            int      NOT NULL,
	name                 varchar(100)      NULL,
	time_start           time(7)      NULL,
	time_end             time(7)      NULL,
	CONSTRAINT pk_Agreement PRIMARY KEY  ( id_agreement ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Equipment ( 
	id_equip             int    IDENTITY(1,1)  NOT NULL,
	id_client            int      NOT NULL,
	id_agreement         int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	type                 varchar(100)      NOT NULL,
	serial_number        nvarchar(20)      NOT NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_Equipment PRIMARY KEY  ( id_equip ) 
 );
GO

CREATE TABLE AbonbusDB.dbo.Application ( 
	id_application       int    IDENTITY(1,1)  NOT NULL,
	id_room              int      NOT NULL,
	id_status            int      NOT NULL,
	id_aplicationtype    int      NOT NULL,
	id_equip             int      NOT NULL,
	id_agreement         int      NOT NULL,
	id_docs              int      NOT NULL,
	id_employee          int      NOT NULL,
	date                 datetime      NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_Application PRIMARY KEY  ( id_application ) 
 );
GO

ALTER TABLE AbonbusDB.dbo.Agreement ADD CONSTRAINT fk_agreement_client FOREIGN KEY ( id_client ) REFERENCES AbonbusDB.dbo.Client( id_client ) ON DELETE SET NULL ON UPDATE SET NULL;
GO

ALTER TABLE AbonbusDB.dbo.Agreement ADD CONSTRAINT fk_Agreement_Docs FOREIGN KEY ( id_docs ) REFERENCES AbonbusDB.dbo.Docs( id_docs );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_Room FOREIGN KEY ( id_room ) REFERENCES AbonbusDB.dbo.Room( id_room );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_Status FOREIGN KEY ( id_status ) REFERENCES AbonbusDB.dbo.[Status]( id_status );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_ApplicationType FOREIGN KEY ( id_aplicationtype ) REFERENCES AbonbusDB.dbo.ApplicationType( id_applicationtype );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_Equipment FOREIGN KEY ( id_equip ) REFERENCES AbonbusDB.dbo.Equipment( id_equip );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_Agreement FOREIGN KEY ( id_agreement ) REFERENCES AbonbusDB.dbo.Agreement( id_agreement );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_Docs FOREIGN KEY ( id_docs ) REFERENCES AbonbusDB.dbo.Docs( id_docs );
GO

ALTER TABLE AbonbusDB.dbo.Application ADD CONSTRAINT fk_Application_Employee FOREIGN KEY ( id_employee ) REFERENCES AbonbusDB.dbo.Employee( id_employee );
GO

ALTER TABLE AbonbusDB.dbo.Client ADD CONSTRAINT fk_Client_Room FOREIGN KEY ( id_room ) REFERENCES AbonbusDB.dbo.Room( id_room );
GO

ALTER TABLE AbonbusDB.dbo.Docs ADD CONSTRAINT fk_Docs_DocTemplate FOREIGN KEY ( id_doctemplate ) REFERENCES AbonbusDB.dbo.DocTemplate( id_doctemplate );
GO

ALTER TABLE AbonbusDB.dbo.Employee ADD CONSTRAINT fk_Employee_Role FOREIGN KEY ( id_role ) REFERENCES AbonbusDB.dbo.Role( id_role );
GO

ALTER TABLE AbonbusDB.dbo.Employee ADD CONSTRAINT fk_Employee_Region FOREIGN KEY ( id_region ) REFERENCES AbonbusDB.dbo.Region( id_region );
GO

ALTER TABLE AbonbusDB.dbo.Employee ADD CONSTRAINT fk_Employee_Position FOREIGN KEY ( id_position ) REFERENCES AbonbusDB.dbo.Position( id_position );
GO

ALTER TABLE AbonbusDB.dbo.Equipment ADD CONSTRAINT fk_Equipment_Client FOREIGN KEY ( id_client ) REFERENCES AbonbusDB.dbo.Client( id_client );
GO

ALTER TABLE AbonbusDB.dbo.Equipment ADD CONSTRAINT fk_Equipment_Agreement FOREIGN KEY ( id_agreement ) REFERENCES AbonbusDB.dbo.Agreement( id_agreement );
GO

exec [AbonbusDB].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Площадь' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Room', @level2type=N'COLUMN',@level2name=N'space';
GO

