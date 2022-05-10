USE master;
GO

USE AbobusDB;
GO

ALTER DATABASE AbobusDB SET COMPATIBILITY_LEVEL = 150;
GO

CREATE PROCEDURE SelectNameFromTableById
@table nvarchar (max)
AS
BEGIN
	IF @table = 'ApplicationTypes'
	BEGIN
		SELECT A.id_applicationtype, A.name
		FROM ApplicationTypes as A
	END;	
	
	ELSE IF @table = 'Docs'
	BEGIN
		SELECT D.id_docs, D.name
		FROM Docs as D
	END;
	
	ELSE IF @table = 'Positions'
	BEGIN
		SELECT P.id_position, P.name
		FROM Positions as P
	END;	

	ELSE IF @table = 'Regions'
	BEGIN
		SELECT R.id_region, R.name
		FROM Regions as R
	END;	

	ELSE IF @table = 'Roles'
	BEGIN
		SELECT R.id_role, R.name
		FROM Roles as R
	END;	

	ELSE IF @table = 'Rooms'
	BEGIN
		SELECT R.id_room, R.id_room + ' ' + R.appointment
		FROM Rooms as R
	END;	

	ELSE IF @table = 'Services'
	BEGIN
		SELECT S.id_services, S.name
		FROM Services as S
	END;	

	ELSE IF @table = 'Statuses'
	BEGIN
		SELECT S.id_status, S.name
		FROM Statuses as S
	END;	

	ELSE IF @table = 'Clients'
	BEGIN
		SELECT C.id_client, C.name
		FROM Clients as C
	END;	

	ELSE IF @table = 'Contracts'
	BEGIN
		SELECT C.id_contract, 'Договор клиента ' + C.name + ' от ' + C.time_start
		FROM Contracts as C
	END;	

	ELSE IF @table = 'Employees'
	BEGIN
		SELECT E.id_employee, E.name + ' ' + E.ph_number
		FROM Employees as E
	END;	

	ELSE IF @table = 'Equipments'
	BEGIN
		SELECT E.id_equip, E.name + ' модель ' + E.serial_number
		FROM Equipments as E
	END;

	ELSE IF @table = 'Applications'
	BEGIN
		SELECT A.id_application, 'Заявка от ' + A.date + ' клиента ' + Cl.name
		FROM Applications as A
			INNER JOIN Contracts as Co
			ON A.id_contract = Co.id_contract
			INNER JOIN Clients as Cl
			ON Co.id_client = Cl.id_client
	END;

	ELSE IF @table = 'Works'
	BEGIN
		SELECT W.id_work, 'Работа по заявке №' + A.id_application + ' от ' + A.date
		FROM Works as W
			INNER JOIN Applications as A
			ON W.id_application = A.id_application
	END;

END;
GO

CREATE PROCEDURE SelectTupleFromTableById
@table nvarchar (max),
@id int
AS
BEGIN
	IF @table = 'ApplicationTypes'
	BEGIN
		SELECT *
		FROM ApplicationTypes as A
		WHERE A.id_applicationtype = @id
	END;	
	
	ELSE IF @table = 'Docs'
	BEGIN
		SELECT *
		FROM Docs as D
		WHERE D.id_docs = @id
	END;
	
	ELSE IF @table = 'Positions'
	BEGIN
		SELECT *
		FROM Positions as P
		WHERE P.id_position = @id
	END;	

	ELSE IF @table = 'Regions'
	BEGIN
		SELECT *
		FROM Regions as R
		WHERE R.id_region = @id
	END;	

	ELSE IF @table = 'Roles'
	BEGIN
		SELECT *
		FROM Roles as R
		WHERE R.id_role = @id
	END;	

	ELSE IF @table = 'Rooms'
	BEGIN
		SELECT *
		FROM Rooms as R
		WHERE R.id_room = @id
	END;	

	ELSE IF @table = 'Services'
	BEGIN
		SELECT *
		FROM Services as S
		WHERE S.id_services = @id
	END;	

	ELSE IF @table = 'Statuses'
	BEGIN
		SELECT *
		FROM Statuses as S
		WHERE S.id_status = @id
	END;	

	ELSE IF @table = 'Clients'
	BEGIN
		SELECT *
		FROM Clients as C
		WHERE C.id_client = @id
	END;	

	ELSE IF @table = 'Contracts'
	BEGIN
		SELECT *
		FROM Contracts as C
		WHERE C.id_contract = @id
	END;	

	ELSE IF @table = 'Employees'
	BEGIN
		SELECT *
		FROM Employees as E
		WHERE E.id_employee = @id
	END;	

	ELSE IF @table = 'Equipments'
	BEGIN
		SELECT *
		FROM Equipments as E
		WHERE E.id_equip = @id
	END;

	ELSE IF @table = 'Applications'
	BEGIN
		SELECT *
		FROM Applications as A
		WHERE A.id_application = @id
	END;

	ELSE IF @table = 'Works'
	BEGIN
		SELECT *
		FROM Works as W
		WHERE W.id_work = @id
	END;

END;
GO

CREATE PROCEDURE InsertDataToTableById
@table nvarchar (max),
@data nvarchar (max)
AS
BEGIN
	IF @table = 'ApplicationTypes'
	BEGIN
		
		SELECT *
		FROM ApplicationTypes as A
		WHERE A.id_applicationtype = @id
	END;	
	
	ELSE IF @table = 'Docs'
	BEGIN
		SELECT *
		FROM Docs as D
		WHERE D.id_docs = @id
	END;
	
	ELSE IF @table = 'Positions'
	BEGIN
		SELECT *
		FROM Positions as P
		WHERE P.id_position = @id
	END;	

	ELSE IF @table = 'Regions'
	BEGIN
		SELECT *
		FROM Regions as R
		WHERE R.id_region = @id
	END;	

	ELSE IF @table = 'Roles'
	BEGIN
		SELECT *
		FROM Roles as R
		WHERE R.id_role = @id
	END;	

	ELSE IF @table = 'Rooms'
	BEGIN
		SELECT *
		FROM Rooms as R
		WHERE R.id_room = @id
	END;	

	ELSE IF @table = 'Services'
	BEGIN
		SELECT *
		FROM Services as S
		WHERE S.id_services = @id
	END;	

	ELSE IF @table = 'Statuses'
	BEGIN
		SELECT *
		FROM Statuses as S
		WHERE S.id_status = @id
	END;	

	ELSE IF @table = 'Clients'
	BEGIN
		SELECT *
		FROM Clients as C
		WHERE C.id_client = @id
	END;	

	ELSE IF @table = 'Contracts'
	BEGIN
		SELECT *
		FROM Contracts as C
		WHERE C.id_contract = @id
	END;	

	ELSE IF @table = 'Employees'
	BEGIN
		SELECT *
		FROM Employees as E
		WHERE E.id_employee = @id
	END;	

	ELSE IF @table = 'Equipments'
	BEGIN
		SELECT *
		FROM Equipments as E
		WHERE E.id_equip = @id
	END;

	ELSE IF @table = 'Applications'
	BEGIN
		SELECT *
		FROM Applications as A
		WHERE A.id_application = @id
	END;

	ELSE IF @table = 'Works'
	BEGIN
		SELECT *
		FROM Works as W
		WHERE W.id_work = @id
	END;

END;
GO

USE AbobusDB;
GO

SELECT name, compatibility_level FROM sys.databases;

DECLARE @string nvarchar(max) = '''ABOBA'', 12, 123'
SELECT * FROM STRING_SPLIT(@string,',')

SELECT STRING_SPLIT(@string,',')
INSERT Rooms SELECT(@string)