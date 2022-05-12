USE AbobusDB;
GO

INSERT INTO dbo.Statuses VALUES('Выполнено')

INSERT INTO dbo.Statuses VALUES('Выполнено')

INSERT INTO dbo.Statuses VALUES('Выполнено')

INSERT INTO dbo.Statuses VALUES('Выполнено')

INSERT INTO dbo.Statuses VALUES('Выполнено')

INSERT INTO dbo.Services VALUES('Починка','Чинит',100)

INSERT INTO dbo.Services VALUES('Заварка','Заваривает',100)

INSERT INTO dbo.Services VALUES('Прокладка','Прокладывает',100)

INSERT INTO dbo.Services VALUES('Монтаж','Монтирует',100)

INSERT INTO dbo.Services VALUES('Фотошоп','Фотошопит',100)

INSERT INTO dbo.Rooms VALUES('Сральник',4,12)

INSERT INTO dbo.Rooms VALUES('Рабочая Зона',5,24)

INSERT INTO dbo.Rooms VALUES('Комната Отдыха',1,7)

INSERT INTO dbo.Rooms VALUES('Подсобка',6,40)

INSERT INTO dbo.Rooms VALUES('Склад Грязи',8,10)

INSERT INTO dbo.Clients VALUES(1,'Иван','Govno10@mail.com','89645237845')

INSERT INTO dbo.Clients VALUES(1,'Алексей','Govno20@mail.com','89645345845')

INSERT INTO dbo.Clients VALUES(1,'Александр','Govno30@mail.com','89647238945')

INSERT INTO dbo.Clients VALUES(1,'Казбек','Govno50@mail.com','89641488845')

INSERT INTO dbo.Clients VALUES(1,'Евгений','Govno70@mail.com','89648899945')

INSERT INTO dbo.Contracts VALUES(1,'На Починку','12.10.2021','14.04.2022')

INSERT INTO dbo.Contracts VALUES(2,'На Заварку','15.01.2020','20.12.2022')

INSERT INTO dbo.Contracts VALUES(3,'На Склад грязи','21.02.2020','21.02.2021')

INSERT INTO dbo.Contracts VALUES(4,'На Какую-то хрень','01.07.2021','15.06.2022')

INSERT INTO dbo.Contracts VALUES(5,'На Вентиляторы','03.09.2019','01.09.2022')

INSERT INTO dbo.Roles VALUES('Главный Говнодав')

INSERT INTO dbo.Roles VALUES('Говнодав')

INSERT INTO dbo.Roles VALUES('Младший Говнодав')

INSERT INTO dbo.Roles VALUES('Глиномес')

INSERT INTO dbo.Roles VALUES('Сотрудник')

INSERT INTO dbo.Regions VALUES('Адыгея')

INSERT INTO dbo.Regions VALUES('Алтай')

INSERT INTO dbo.Regions VALUES('Башкортостан')

INSERT INTO dbo.Regions VALUES('Тыва')

INSERT INTO dbo.Regions VALUES('Калмыкия')

INSERT INTO dbo.Positions VALUES('Главный Говнодав')

INSERT INTO dbo.Positions VALUES('Говнодав')

INSERT INTO dbo.Positions VALUES('Младший Говнодав')

INSERT INTO dbo.Positions VALUES('Глиномес')

INSERT INTO dbo.Positions VALUES('Сотрудник')

INSERT INTO dbo.Equipments VALUES('Govno','Комплектующие','GDF456D46G44GD','Очень важная вещь',40000)

INSERT INTO dbo.Equipments VALUES('Швабра','Инструмент','GDF456D45464D4','Очень важная вещь2',50000)

INSERT INTO dbo.Equipments VALUES('Отвёртка','Инструмент','GDF456D7667','Очень важная вещь3',60000)

INSERT INTO dbo.Equipments VALUES('Пиво','Инструмент','GDF456D13123456','Слишком важная вещь',70000)

INSERT INTO dbo.Equipments VALUES('Стакан','Ёмкость','GDF456D689','Слишком важная вещь2',80000)

INSERT INTO dbo.Employees VALUES(1,1,1,'Саня','89347689458','Govno1@mail.com')

INSERT INTO dbo.Employees VALUES(2,2,2,'Лёха','89347569458','Govn2o@mail.com')

INSERT INTO dbo.Employees VALUES(3,3,3,'СерГЕЙ','8787879458','Govno3@mail.com')

INSERT INTO dbo.Employees VALUES(4,4,4,'Акакий','89376849458','Govno4@mail.com')

INSERT INTO dbo.Employees VALUES(5,5,5,'Иван Говнов','89347387658','Govno5@mail.com')

INSERT INTO dbo.ContractList VALUES(1,1,1534)

INSERT INTO dbo.ContractList VALUES(1,2,200)

INSERT INTO dbo.ContractList VALUES(2,2,153454)

INSERT INTO dbo.ContractList VALUES(3,3,156734)

INSERT INTO dbo.ContractList VALUES(4,4,153684)

INSERT INTO dbo.ContractList VALUES(5,5,1312534)

INSERT INTO dbo.ApplicationTypes VALUES('Ремонт','Ремонтирует')

INSERT INTO dbo.ApplicationTypes VALUES('Заварка','Заваривается')

INSERT INTO dbo.ApplicationTypes VALUES('Починка','Чинится')

INSERT INTO dbo.ApplicationTypes VALUES('Фотошоп','Фотошопится')

INSERT INTO dbo.ApplicationTypes VALUES('Моча','Течёт')

INSERT INTO dbo.Applications VALUES(1,1,1,1,'20.10.2021','Описание')

INSERT INTO dbo.Applications VALUES(2,2,2,2,'19.10.2021','Описание2')

INSERT INTO dbo.Applications VALUES(3,3,3,3,'18.10.2021','Описание3')

INSERT INTO dbo.Applications VALUES(4,4,4,4,'17.10.2021','Описание4')

INSERT INTO dbo.Applications VALUES(5,5,5,5,'16.10.2021','Описание5')

INSERT INTO dbo.Applications VALUES(1,1,1,1,'20.11.2021','Описание')

INSERT INTO dbo.Applications VALUES(2,2,2,2,'19.11.2021','Описание2')

INSERT INTO dbo.Applications VALUES(3,3,3,3,'18.11.2021','Описание3')

INSERT INTO dbo.Applications VALUES(4,4,4,4,'17.11.2021','Описание4')

INSERT INTO dbo.Applications VALUES(5,5,5,5,'16.11.2021','Описание5')

INSERT INTO dbo.Applications VALUES(1,1,1,1,'20.12.2021','Описание')

INSERT INTO dbo.Applications VALUES(2,2,2,2,'19.12.2021','Описание2')

INSERT INTO dbo.Applications VALUES(3,3,3,3,'18.12.2021','Описание3')

INSERT INTO dbo.Applications VALUES(4,4,4,4,'17.12.2021','Описание4')

INSERT INTO dbo.Applications VALUES(5,5,5,5,'16.12.2021','Описание5')

INSERT INTO dbo.Applications VALUES(1,1,1,1,'20.01.2022','Описание')

INSERT INTO dbo.Applications VALUES(2,2,2,2,'19.01.2022','Описание2')

INSERT INTO dbo.Applications VALUES(3,3,3,3,'18.01.2022','Описание3')

INSERT INTO dbo.Applications VALUES(4,4,4,4,'17.01.2022','Описание4')

INSERT INTO dbo.Applications VALUES(5,5,5,5,'16.01.2022','Описание5')

INSERT INTO dbo.Works VALUES(1,1,1,1,500)

INSERT INTO dbo.Works VALUES(2,2,2,2,200)

INSERT INTO dbo.Works VALUES(3,3,3,3,400)

INSERT INTO dbo.Works VALUES(4,4,4,4,400)

INSERT INTO dbo.Works VALUES(5,5,5,5,500)

INSERT INTO dbo.Docs VALUES(1,'Договор1','Договор')

INSERT INTO dbo.Docs VALUES(2,'Договор2','Договор')

INSERT INTO dbo.Docs VALUES(3,'Договор3','Договор')

INSERT INTO dbo.Docs VALUES(4,'Договор4','Договор')

INSERT INTO dbo.Docs VALUES(5,'Договор5','Договор')