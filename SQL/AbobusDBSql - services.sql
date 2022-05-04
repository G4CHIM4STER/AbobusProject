CREATE TABLE AbobusDB.dbo.ApplicationEquipment ( 
	id_appliactionequipment int    IDENTITY(1,1)  NOT NULL,
	CONSTRAINT pk_ApplicationEquipment PRIMARY KEY  ( id_appliactionequipment ) 
 );
GO

CREATE TABLE AbobusDB.dbo.ApplicationServices ( 
	id_applicationservice int    IDENTITY(1,1)  NOT NULL,
	CONSTRAINT pk_ApplicationService PRIMARY KEY  ( id_applicationservice ) 
 );
GO

CREATE TABLE AbobusDB.dbo.ApplicationTypes ( 
	id_applicationtype   int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(50)      NOT NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_ApplicationType PRIMARY KEY  ( id_applicationtype ) 
 );
GO

CREATE TABLE AbobusDB.dbo.DocTemplates ( 
	id_doctemplate       int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_DocTemlate PRIMARY KEY  ( id_doctemplate ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Docs ( 
	id_docs              int    IDENTITY(1,1)  NOT NULL,
	id_doctemplate       int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	path                 nvarchar(max)      NOT NULL,
	CONSTRAINT pk_Docs PRIMARY KEY  ( id_docs ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Positions ( 
	id_position          int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Position PRIMARY KEY  ( id_position ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Regions ( 
	id_region            int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Region PRIMARY KEY  ( id_region ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Roles ( 
	id_role              int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_Role PRIMARY KEY  ( id_role ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Rooms ( 
	id_room              int    IDENTITY(1,1)  NOT NULL,
	appointment          varchar(200)      NOT NULL,
	floor                int      NULL,
	space                int      NOT NULL,
	CONSTRAINT pk_Room PRIMARY KEY  ( id_room ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Services ( 
	id_service           int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	description          varchar(200)      NOT NULL,
	cost                 int      NOT NULL,
	CONSTRAINT pk_Services PRIMARY KEY  ( id_service ) 
 );
GO

CREATE TABLE AbobusDB.dbo.ServicesList ( 
	id_serviceslist      int    IDENTITY(1,1)  NOT NULL,
	id_service           int      NOT NULL,
	id_application_service int      NOT NULL,
	CONSTRAINT pk_ServicesList PRIMARY KEY  ( id_serviceslist ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Statuses ( 
	id_status            int    IDENTITY(1,1)  NOT NULL,
	name                 varchar(100)      NOT NULL,
	CONSTRAINT pk_St PRIMARY KEY  ( id_status ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Clients ( 
	id_client            int    IDENTITY(1,1)  NOT NULL,
	id_room              int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	mail                 varchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NOT NULL,
	CONSTRAINT pk_Client PRIMARY KEY  ( id_client ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Employees ( 
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

CREATE TABLE AbobusDB.dbo.Agreements ( 
	id_agreement         int    IDENTITY(1,1)  NOT NULL,
	id_docs              int      NOT NULL,
	id_client            int      NOT NULL,
	name                 varchar(100)      NULL,
	time_start           time(7)      NULL,
	time_end             time(7)      NULL,
	CONSTRAINT pk_Agreement PRIMARY KEY  ( id_agreement ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Equipment ( 
	id_equip             int    IDENTITY(1,1)  NOT NULL,
	id_client            int      NOT NULL,
	id_agreement         int      NOT NULL,
	name                 varchar(100)      NOT NULL,
	type                 varchar(100)      NOT NULL,
	serial_number        nvarchar(20)      NOT NULL,
	description          varchar(200)      NULL,
	cost                 int      NOT NULL,
	CONSTRAINT pk_Equipment PRIMARY KEY  ( id_equip ) 
 );
GO

CREATE TABLE AbobusDB.dbo.EquipmentList ( 
	id_equipmentlist     int    IDENTITY(1,1)  NOT NULL,
	id_equip             int      NOT NULL,
	id_applicationequipment int      NOT NULL,
	CONSTRAINT pk_EquipmentList PRIMARY KEY  ( id_equipmentlist ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Applications ( 
	id_application       int    IDENTITY(1,1)  NOT NULL,
	id_room              int      NOT NULL,
	id_status            int      NOT NULL,
	id_aplicationtype    int      NOT NULL,
	id_equip             int      NOT NULL,
	id_agreement         int      NOT NULL,
	id_docs              int      NOT NULL,
	id_employee          int      NOT NULL,
	id_applicationservice int      NOT NULL,
	id_applicationequipment int      NOT NULL,
	date                 datetime      NULL,
	description          varchar(200)      NULL,
	CONSTRAINT pk_Application PRIMARY KEY  ( id_application ) 
 );
GO

ALTER TABLE AbobusDB.dbo.Agreements ADD CONSTRAINT fk_agreement_client FOREIGN KEY ( id_client ) REFERENCES AbobusDB.dbo.Clients( id_client );
GO

ALTER TABLE AbobusDB.dbo.Agreements ADD CONSTRAINT fk_Agreement_Docs FOREIGN KEY ( id_docs ) REFERENCES AbobusDB.dbo.Docs( id_docs );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Room FOREIGN KEY ( id_room ) REFERENCES AbobusDB.dbo.Rooms( id_room );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Status FOREIGN KEY ( id_status ) REFERENCES AbobusDB.dbo.Statuses( id_status );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_ApplicationType FOREIGN KEY ( id_aplicationtype ) REFERENCES AbobusDB.dbo.ApplicationTypes( id_applicationtype );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Equipment FOREIGN KEY ( id_equip ) REFERENCES AbobusDB.dbo.Equipment( id_equip );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Agreement FOREIGN KEY ( id_agreement ) REFERENCES AbobusDB.dbo.Agreements( id_agreement );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Docs FOREIGN KEY ( id_docs ) REFERENCES AbobusDB.dbo.Docs( id_docs );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Employee FOREIGN KEY ( id_employee ) REFERENCES AbobusDB.dbo.Employees( id_employee );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_ApplicationService FOREIGN KEY ( id_applicationservice ) REFERENCES AbobusDB.dbo.ApplicationServices( id_applicationservice );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_ApplicationEquipment FOREIGN KEY ( id_applicationequipment ) REFERENCES AbobusDB.dbo.ApplicationEquipment( id_appliactionequipment );
GO

ALTER TABLE AbobusDB.dbo.Clients ADD CONSTRAINT fk_Client_Room FOREIGN KEY ( id_room ) REFERENCES AbobusDB.dbo.Rooms( id_room );
GO

ALTER TABLE AbobusDB.dbo.Docs ADD CONSTRAINT fk_Docs_DocTemplate FOREIGN KEY ( id_doctemplate ) REFERENCES AbobusDB.dbo.DocTemplates( id_doctemplate );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Role FOREIGN KEY ( id_role ) REFERENCES AbobusDB.dbo.Roles( id_role );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Region FOREIGN KEY ( id_region ) REFERENCES AbobusDB.dbo.Regions( id_region );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Position FOREIGN KEY ( id_position ) REFERENCES AbobusDB.dbo.Positions( id_position );
GO

ALTER TABLE AbobusDB.dbo.Equipment ADD CONSTRAINT fk_Equipment_Client FOREIGN KEY ( id_client ) REFERENCES AbobusDB.dbo.Clients( id_client );
GO

ALTER TABLE AbobusDB.dbo.Equipment ADD CONSTRAINT fk_Equipment_Agreement FOREIGN KEY ( id_agreement ) REFERENCES AbobusDB.dbo.Agreements( id_agreement );
GO

ALTER TABLE AbobusDB.dbo.EquipmentList ADD CONSTRAINT fk_EquipmentList_ApplicationEquipment FOREIGN KEY ( id_applicationequipment ) REFERENCES AbobusDB.dbo.ApplicationEquipment( id_appliactionequipment );
GO

ALTER TABLE AbobusDB.dbo.EquipmentList ADD CONSTRAINT fk_EquipmentList_Equipment FOREIGN KEY ( id_equip ) REFERENCES AbobusDB.dbo.Equipment( id_equip );
GO

ALTER TABLE AbobusDB.dbo.ServicesList ADD CONSTRAINT fk_ServicesList_ApplicationService FOREIGN KEY ( id_application_service ) REFERENCES AbobusDB.dbo.ApplicationServices( id_applicationservice );
GO

ALTER TABLE AbobusDB.dbo.ServicesList ADD CONSTRAINT fk_ServicesList_Services FOREIGN KEY ( id_service ) REFERENCES AbobusDB.dbo.Services( id_service );
GO

exec [AbobusDB].sys.sp_addextendedproperty  @name=N'MS_Description', @value=N'Площадь' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Rooms', @level2type=N'COLUMN',@level2name=N'space';
GO

INSERT INTO Clients VALUES

(1, 'Андрей Андреевич Брылев', 'brylev@aboba.com', '7(29)950-2577'),
(2, 'Дмитрий Алексеевич Иванов', 'ivanov@russia.com', '7(44)098-8354'),
(3, 'Семен Семенович Спермагорский', 'spermach@slave.ru', '7(835)385-2081'),
(4, 'Толмас Сергеев Русланович', 'kakaoymozhnosdelatvyvod@nikakogo.ru', '7(7670)485-8339'),
(5, 'Михаил Алексеевич Пушка', 'rukabazuka@gmail.eu', '7(28)731-6773')

INSERT INTO Roles VALUES

('Тут что-то'),
('Тут тоже'),
('И тут'),
('Тут тоже, наверное'),
('Шахтер')

INSERT INSERT Regions VALUES

('Астраханский'),
('Марсовский'),
('Устричный'),
('Бедный'),
('Абобный')

INSERT INTO Positions VALUES

('Менеджер по продажам'),
('Менеджер по лажам'),
('Работяга'),
('Летяга'),
('Админитрахор'),

INSERT INTO Employees VALUES

(1, 1, 1, 'Федор Борисович Борисов','7(455)483-4152' , 'borisborisov@boris.bor'),
(2, 3, 1, 'Артур Антонов Пирожков','7(3689)525-1187' , 'artur@ch.ik'),
(4, 2, 3, 'Владимир Владимирович Гутлер','7(455)483-4152' , 'rossiyarossiya@putler.vor'),
(5, 1, 4, 'Федор Михайлович Кунжут','7(454)316-7418' , 'echpochmak@maka.net'),
(3, 4, 2, 'Леонид Семенович Борг','7(497)777-8240' , 'borg@borg.borg'),

INSERT INTO Statuses VALUES

('На рассмотрении'),
('Выполняется'),
('Заморожен'),
('Отложен'),
('Отменен')

INSERT INTO Rooms VALUES

('Туалет',0 ,228),
('Уборная',4 ,1488),
('Санузел',2 ,322),
('Ванная комната', 3, 1984)

INSERT INTO Applications VALUES

(1,1 ,3 ,3 ,1 ,2 ,3 ,'2016-12-25T15:32:06.427' ,"Надо сдлеать !" ),
(2, 4,4 , 1, 1, 4,1 , '2025-12-25T15:32:06.427', "Не надо сделать" ),
(3,3 ,2 ,4 ,1 ,2 ,2 ,'2019-12-25T15:32:06.427' , "Точно не надо !"),
(4, 2,1 ,2 , 1,1 ,3 , '2005-12-25T15:32:06.427', "№Вставить описание№"),
(2,5 ,2 , 1, 1,4 ,4 ,'2017-12-25T15:32:06.427' , "А шо это ты тут забыл ?")

INSERT INTO ApplicationTypes VALUES

('Починка', 'Опять работать'),
('Поломка', 'Ломать - не строить'),
('Починко', 'Автомат с азартными играми в Японии'),
('Ремонт', 'Как починка, только ремонт'),
('Ну я не ебу, реально', 'Отвечаю')

INSERT INTO Agreements