--Market adli Database yaradin

Create Database Shop

Use Shop
 
--Icinde Products Table-i yaradin.Product table-inda Id,Name,Price columnlari olsun

Create Table Products
(
	Id int,
	Name nvarchar(30),
	Price money
)

--Products table-na yeni bir Brand columnu elave edin
Alter Table Products Add Brand nvarchar(30)

--Products table-a value-lar insert edin (10-15 dene product datasi kifayetdir)
Insert Into Products Values 
	(1, 'Water', 3.5, 'Water'),
	(2, 'Oil', 20, 'Food'),
	(3, 'Bread', 1.5, 'Food'),
	(4, 'Fruit', 5, 'Food'),
	(5, 'PC', 500, 'Household')
 
--Qiymeti Productlarin price-larinin average-den kicik olan Products datalarinin siyahisini getiren query yazin
Select * From Products Where Price < (Select AVG(Price) From Products)

--Qiymeti 10-dan yuxari olan Product datalarinin siyahisini getiren query yazin
Select * From Products Where Price > 10
--Brand uzunlugu 5-den boyuk olan Productlarin siyahisini getiren query.
--Gelen datalarda Mehsulun adi ve Brand adi 1 columnda gorsensin ve 
--Column adi ProductInfo olsun (dersdeki name ve surname-i fullname kimi gostermeye uygun)

Select (Name+' '+Brand) ProductInfo From Products Where LEN(Brand) > 5