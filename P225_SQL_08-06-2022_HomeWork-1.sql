--Company database-i yaradin(istənilən ad vəre bilərsiz db-ye).
--Employees table-i olsun. Employees  -in Name, SurName, Position, Salary Column-lari olsun. 
--Aşağıdakı query-ləri yazmalısınız:

create Database Company

use Company

create table Employees
(
	Name nvarchar(30),
	SurName nvarchar(30),
	Position nvarchar(30),
	Salary money
)

insert into Employees values
('Vusal' , 'Imanov', 'Manager' , 2000),
('Vusal' , 'Aliyev', 'It' , 1000),
('Murad' , 'Haqverdi', 'Manager' , 2000)
--1.Ortalama maaşı çıxarmalısınız

Select avg(Salary) from Employees 

--2.Ortalama maaşdan yuxarı maaş alan işçilərin ad soyadını və maaşını yazdırmalısız

Select * from Employees where Salary > (Select avg(Salary) from Employees)

--3.Max, Min maaşları çıxarmalı
Select MAX(Salary) From Employees

Select MIN(Salary) From Employees

Create Table Departments
(
	Id int Primary Key identity,
	Name nvarchar(255)
)

create table Employees
(
	Id int primary key identity,
	Name nvarchar(30) NOT NULL,
	SurName nvarchar(30) UNIQUE Check(LEN(Surname) > 5),
	Position nvarchar(30),
	Salary money Check(Salary >= 250),
	DepartmentId int Foreign Key References Departments(Id),
	Email nvarchar(255) Check(Email Like '%@%') Default('system@code.az')
)

Create Table SalaryType
(
	Id int primary key identity,
	Name nvarchar(255),
	Min money,
	Max Money
)

Alter table Departments Add ParentId int Foreign Key References Departments(Id)

drop Table Departments
drop Table Employees

Alter Table Employees Add DepartmentId int

Select * From Employees
Select * From Departments
--Joins

--1. Inner Join Or Join
Select Employees.Id, Employees.Name, SurName, Position, Salary, Departments.name From Employees
Inner Join Departments On Employees.DepartmentId = Departments.Id

Select Employees.Id, Employees.Name, SurName, Position, Salary, Departments.name From Employees
Join Departments On Employees.DepartmentId = Departments.Id

--2. Right Outer Join Or Right Join
Select * From Employees Right Outer Join Departments On Employees.DepartmentId = Departments.Id

Select * From Employees Right Join Departments On Employees.DepartmentId = Departments.Id

Select * From Departments Right Outer Join Employees On Employees.DepartmentId = Departments.Id

Select * From Departments Right Join Employees On Employees.DepartmentId = Departments.Id

--3 Left Outer Join Or Left Join
Select * From Employees Left Outer Join Departments On Employees.DepartmentId = Departments.Id

Select * From Employees Left Join Departments On Employees.DepartmentId = Departments.Id

Select * From Departments Left Outer Join Employees On Employees.DepartmentId = Departments.Id

Select * From Departments Left Join Employees On Employees.DepartmentId = Departments.Id

--Full Outer Join Or Full Join
Select * From Employees Full Outer Join Departments On Employees.DepartmentId = Departments.Id

Select * From Employees Full Join Departments On Employees.DepartmentId = Departments.Id

--Self Join
Select l.Id, l.Name, ISNULL(r.Name,'-') as Parent from Departments l 
Left Join Departments r On l.ParentId = r.Id

--Non Equal Join
Select e.id, e.name, e.surname, e.salary, s.name From Employees e
Join SalaryType s On e.Salary Between s.Min And s.Max

Create Table Students
(
	Id int primary key identity,
	FullName nvarchar(255),
	Grade decimal(18,2)
)

Insert Into Students
Values
(N'Vusal Aliyev',97),
(N'Vusal Imanov',95),
(N'Murad Haqverdi',50),
(N'Abdulla Rehimli',44),
(N'Eltac MelikMəmmedov',97)

Create Table Certificates
(
	Id int primary key identity,
	Name nvarchar(255),
	MinGrade int,
	MaxGrade int
)

Insert Into Certificates
Values
(N'Adi',65,84),
(N'Şərəf',85,94),
(N'Yüksək Şərəf',95,100)

Select * From Students s
Join Certificates c On s.Grade Between c.MinGrade And c.MaxGrade