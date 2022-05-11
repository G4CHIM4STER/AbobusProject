USE master;
GO

DROP DATABASE AbobusDB;
GO

CREATE DATABASE AbobusDB;
ALTER DATABASE AbobusDB SET COMPATIBILITY_LEVEL = 150;
GO

USE AbobusDB;
GO

CREATE TABLE AbobusDB.dbo.ApplicationTypes ( 
	id_applicationtype   int    IDENTITY (1, 1)  NOT NULL,
	name                 nvarchar(50)      NOT NULL,
	description          nvarchar(200)      NOT NULL,
	CONSTRAINT pk_ApplicationType PRIMARY KEY  ( id_applicationtype ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Docs ( 
	id_docs              int    IDENTITY (1, 1)  NOT NULL,
	id_work              int  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	type                 nvarchar(10)      NOT NULL,
	binary_file          varbinary(max)      NULL,
	CONSTRAINT pk_Docs PRIMARY KEY  ( id_docs ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Positions ( 
	id_position          int    IDENTITY (1, 1)  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	CONSTRAINT pk_Position PRIMARY KEY  ( id_position ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Regions ( 
	id_region            int    IDENTITY (1, 1)  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	CONSTRAINT pk_Region PRIMARY KEY  ( id_region ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Roles ( 
	id_role              int    IDENTITY (1, 1)  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	CONSTRAINT pk_Role PRIMARY KEY  ( id_role ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Rooms ( 
	id_room              int    IDENTITY (1, 1)  NOT NULL,
	appointment          nvarchar(200)      NOT NULL,
	floor                int      NULL,
	space                int      NOT NULL,
	CONSTRAINT pk_Room PRIMARY KEY  ( id_room ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Services ( 
	id_services          int    IDENTITY(1,1)  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	description          nvarchar(200)      NOT NULL,
	cost                 int      NOT NULL,
	CONSTRAINT pk_Services PRIMARY KEY  ( id_services ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Statuses ( 
	id_status            int    IDENTITY (1, 1)  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	CONSTRAINT pk_St PRIMARY KEY  ( id_status ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Clients ( 
	id_client            int    IDENTITY (1, 1)  NOT NULL,
	id_room              int      NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	mail                 nvarchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NOT NULL,
	CONSTRAINT pk_Client PRIMARY KEY  ( id_client ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Contracts ( 
	id_contract          int    IDENTITY (1, 1)  NOT NULL,
	id_client            int      NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	time_start           datetime      NOT NULL,
	time_end             datetime      NOT NULL,
	CONSTRAINT pk_Agreement PRIMARY KEY  ( id_contract ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Employees ( 
	id_employee          int    IDENTITY (1, 1)  NOT NULL,
	id_role              int      NOT NULL,
	id_region            int      NOT NULL,
	id_position          int      NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	ph_number            nvarchar(18)      NOT NULL,
	mail                 nvarchar(100)      NOT NULL,
	CONSTRAINT pk_Employee PRIMARY KEY  ( id_employee ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Equipments ( 
	id_equip             int    IDENTITY (1, 1)  NOT NULL,
	name                 nvarchar(100)      NOT NULL,
	type                 nvarchar(100)      NOT NULL,
	serial_number        nvarchar(20)      NOT NULL,
	description          nvarchar(200)      NOT NULL,
	cost                 int      NOT NULL,
	CONSTRAINT pk_Equipment PRIMARY KEY  ( id_equip ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Applications ( 
	id_application       int    IDENTITY (1, 1)  NOT NULL,
	id_room              int      NOT NULL,
	id_status            int      NOT NULL,
	id_aplicationtype    int      NOT NULL,
	id_contract          int      NOT NULL,
	date                 datetime      NOT NULL,
	description          nvarchar(200)      NOT NULL,
	CONSTRAINT pk_Application PRIMARY KEY  ( id_application ) 
 );
GO

CREATE TABLE AbobusDB.dbo.Works ( 
	id_work              int    IDENTITY(1,1)  NOT NULL,
	id_services          int      NOT NULL,
	id_equipment         int      NOT NULL,
	id_employee			 int      NOT NULL,
	id_application       int      NOT NULL,
	final_cost           int      NOT NULL,
	CONSTRAINT pk_Works PRIMARY KEY  ( id_work ) 
 );
GO

CREATE TABLE AbobusDB.dbo.ContractList (
	id_contractlist	int	IDENTITY(1,1) NOT NULL,
	id_contract int NOT NULL,
	id_equip int NOT NULL,
	quantity int not null,
	CONSTRAINT pk_ContractList PRIMARY KEY (id_contractlist)
);
GO
ALTER TABLE AbobusDB.dbo.ContractList ADD CONSTRAINT fk_ContractList_Contract FOREIGN KEY (id_contract) REFERENCES AbobusDB.dbo.Contracts(id_contract);

GO
ALTER TABLE AbobusDB.dbo.ContractList ADD CONSTRAINT fk_ContractList_Equipment FOREIGN KEY (id_equip) REFERENCES AbobusDB.dbo.Equipments(id_equip);
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Room FOREIGN KEY ( id_room ) REFERENCES AbobusDB.dbo.Rooms( id_room );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Status FOREIGN KEY ( id_status ) REFERENCES AbobusDB.dbo.Statuses( id_status );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_ApplicationType FOREIGN KEY ( id_aplicationtype ) REFERENCES AbobusDB.dbo.ApplicationTypes( id_applicationtype );
GO

ALTER TABLE AbobusDB.dbo.Applications ADD CONSTRAINT fk_Application_Agreement FOREIGN KEY ( id_contract ) REFERENCES AbobusDB.dbo.Contracts( id_contract );
GO

ALTER TABLE AbobusDB.dbo.Clients ADD CONSTRAINT fk_Client_Room FOREIGN KEY ( id_room ) REFERENCES AbobusDB.dbo.Rooms( id_room );
GO

ALTER TABLE AbobusDB.dbo.Contracts ADD CONSTRAINT fk_agreement_client FOREIGN KEY ( id_client ) REFERENCES AbobusDB.dbo.Clients( id_client );
GO

ALTER TABLE AbobusDB.dbo.Docs ADD CONSTRAINT fk_Docs_Work FOREIGN KEY ( id_work ) REFERENCES AbobusDB.dbo.Works( id_work );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Role FOREIGN KEY ( id_role ) REFERENCES AbobusDB.dbo.Roles( id_role );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Region FOREIGN KEY ( id_region ) REFERENCES AbobusDB.dbo.Regions( id_region );
GO

ALTER TABLE AbobusDB.dbo.Employees ADD CONSTRAINT fk_Employee_Position FOREIGN KEY ( id_position ) REFERENCES AbobusDB.dbo.Positions( id_position );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Services FOREIGN KEY ( id_services ) REFERENCES AbobusDB.dbo.Services( id_services );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Equipments FOREIGN KEY ( id_equipment ) REFERENCES AbobusDB.dbo.Equipments( id_equip );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Applications FOREIGN KEY ( id_application ) REFERENCES AbobusDB.dbo.Applications( id_application );
GO

ALTER TABLE AbobusDB.dbo.Works ADD CONSTRAINT fk_Works_Employee FOREIGN KEY ( id_employee ) REFERENCES AbobusDB.dbo.Employees( id_employee );
GO

DROP PROCEDURE SelectScheduleDocById;
GO

CREATE PROCEDURE SelectScheduleDocById
(
	@start_year date,
	@id_contract int
)
AS
CREATE TABLE #temp
(
	temp_equip_id int,
	temp_contract_id int,
	temp_equip_name nvarchar(max),
	temp_serial_number nvarchar(max),
	temp_equip_plan_quantity int,
	temp_time_start date,
	temp_time_end date,
	temp_client_name nvarchar(max),
	temp_equip_actual_quantity nvarchar(max)
)
BEGIN

	INSERT INTO #temp (temp_equip_id, temp_contract_id, temp_equip_name, temp_serial_number, temp_equip_plan_quantity, temp_time_start, temp_time_end, temp_client_name, temp_equip_actual_quantity)
	SELECT 
			E.id_equip as 'Идентификатор оборудования',
			C.id_contract as 'Идентификатор контракта',
			E.name as 'Оборудование', 
			E.serial_number as 'Серийный номер',
			CList.quantity as 'Планируется',
			C.time_start as 'Начало договора',
			C.time_end as 'Конец договора',
			Cl.name as 'Имя клиента',
			''

	FROM	Equipments as E, 
			Contracts as C, 
			ContractList as CList, 
			Clients as Cl

	WHERE	E.id_equip = CList.id_equip AND 
			CList.id_contract = C.id_contract AND
			C.id_contract = @id_contract AND 
			Cl.id_client = C.id_client

	SELECT * FROM #temp

	DECLARE @equipment_id int, @contract_id int, @quantity nvarchar(max)
	DECLARE cur CURSOR 
	FOR 
		SELECT #temp.temp_equip_id, #temp.temp_contract_id
		FROM #temp

	OPEN cur

	FETCH NEXT FROM cur
	INTO @equipment_id, @contract_id --, @quantity--INTO @equipment_id

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		EXEC SelectSchedulePlanById @start_year, @equipment_id, @contract_id, @quantity OUTPUT
		
		UPDATE #temp
		SET #temp.temp_equip_actual_quantity = @quantity
		WHERE #temp.temp_equip_id = @equipment_id

		FETCH NEXT FROM cur INTO @equipment_id, @contract_id
	END
	CLOSE cur
	DEALLOCATE cur

	SELECT * FROM #temp
END;

GO

DROP PROCEDURE SelectSchedulePlanById;
GO

CREATE PROCEDURE SelectSchedulePlanById
@start_year date,
@id_equipment int,
@id_contract int,
@quantity nvarchar(max) OUT
AS
BEGIN
	DECLARE @buffer date, @tempDate date, @i int = 0, @result nvarchar(max) = '', @count int = 0

	SET @start_year = cast(format(@start_year, '01.01.yyyy') as Date)

	WHILE(@i < 12)
	BEGIN

		SET @buffer = @start_year
		SET @tempDate = DATEADD(month,@i,@start_year)
		SET @start_year = @buffer
		SET @count = 0   +	(
								SELECT COUNT(*)
								FROM	Applications as A
										INNER JOIN Statuses as S
										ON S.id_status = A.id_status
										INNER JOIN Contracts as C
										ON A.id_contract = C.id_contract
										INNER JOIN ContractList as CL
										ON C.id_contract = CL.id_contract
										INNER JOIN Equipments as E
										ON CL.id_equip = E.id_equip

								WHERE	S.name = 'Выполнено' AND 
										A.id_contract = @id_contract AND
										E.id_equip = @id_equipment AND
										(A.date BETWEEN DATEADD(month,@i,@tempDate) AND DATEADD(month,@i + 1,@tempDate))
							)

		IF(@i < 11)
		BEGIN
			SET @result  =	@result +	(SELECT CAST(@tempDate as nvarchar(10)) + ':' + CAST(@count as varchar(10)) + ',')
		END
		ELSE
		BEGIN
			SET @result  =	@result +	(SELECT CAST(@tempDate as nvarchar(10)) + ':' + CAST(@count as varchar(10)))
		END

	SET @i = @i + 1
	END

	SELECT @quantity = @result
	RETURN SELECT @result
END;
GO