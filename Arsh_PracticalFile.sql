----------P1------------


create database BookMyShow
use BookMyShow






---------P2-------------


--CREATE TABLE MOVIES

create table Movies (

	MovieId int not null,
	MovieTitle varchar(50),
	MovieLang varchar(20),
	Duration int,
	rating float
	)

insert into Movies values
(1,'Spiderman', 'English', 150, 4.5),
(2,'Fantastic Four', 'English', 180, 4.0),
(3,'Punjab 95', 'Punjabi', 120, 5.0),
(4,'Avatar: Fire and Ash', 'English', 100, 3.8),
(5,'The Diplomat', 'Hindi', 110, 3.9),
(6,'Raid 2', 'Hindi', 130, 3.0),
(7,'Carry on Jatta', 'Punjabi', 160, 4.3)
	


--CREATE TABLE THEATERS

create table Theaters(

	TheaterId int not null,
	TheaterName varchar(50),
	TheaterCity varchar(50)
	)


insert into Theaters values
(1245,'PVR', 'New Delhi'),
(2675,'Cinepolis', 'New Delhi'),
(3108,'INOX', 'Mumbai'),
(4039,'G3S cinemas', 'Pune'),
(5028,'M2K cinemas', 'New Delhi'),
(6498,'Amba Cinema', 'Amritsar')


--CREATE TABLE SHOWTIMES

create table Showtimes(

	ShowId int not null,
	MovieId int not null,
	TheaterId int not null,
	ShowDate date,
	ShowTime Time(0),
	Price int
	)


insert into Showtimes values
(101,3,5028,'2025-10-28','16:20:00',290),
(102,1,3108,'2025-10-29','20:00:00',380),
(103,6,4039,'2025-10-28','17:30:00',350),
(104,5,1245,'2025-10-29','23:00:00',280),
(105,2,2675,'2025-10-28','13:20:00',180),
(106,2,6498,'2025-10-29','23:00:00',200),
(107,7,5028,'2025-10-27','11:00:00',190),
(108,3,2675,'2025-10-27','19:15:00',400),
(109,6,6498,'2025-10-28','14:45:00',340),
(110,5,2675,'2025-10-29','10:00:00',280),
(111,7,3108,'2025-10-27','10:45:00',190),
(112,4,1245,'2025-10-28','11:30:00',150),
(113,4,4039,'2025-10-27','13:15:00',350),
(114,1,1245,'2025-10-27','21:00:00',300),
(115,2,4039,'2025-10-29','23:00:00',310),
(116,1,6498,'2025-10-27','21:15:00',400),
(117,1,5028,'2025-10-27','23:00:00',280),
(118,7,2675,'2025-10-28','22:00:00',200),
(119,5,3108,'2025-10-29','23:00:00',280),
(120,5,5028,'2025-10-27','19:15:00',330),
(121,5,4039,'2025-10-28','09:45:00',150),
(122,4,6498,'2025-10-29','11:15:00',240),
(123,3,1245,'2025-10-27','14:30:00',200)



--CREATE TABLE BOOKINGS

create table Bookings(

	BookingId int not null,
	ShowId int not null,
	CustomerName varchar(50),
	SeatsBooked int,
	BookingDate date
	)


insert into Bookings values
(10112,107,'Simrat Kaur Waan',2,'2025-10-22'),
(10123,102,'Aryan Jangir',1,'2025-10-26'),
(10145,108,'Preksha',2,'2025-10-24'),
(10176,102,'Geetanjali',4,'2025-10-25'),
(10132,116,'Manish Kumar',3,'2025-10-27'),
(10193,115,'Akshay Sharma',6,'2025-10-22'),
(10148,120,'Aman Sheoran',10,'2025-10-20'),
(10126,118,'Dashmeet Singh',5,'2025-10-24'),
(10136,107,'Arshdeep Singh',2,'2025-10-22'),
(10178,109,'Manish Bansal',12,'2025-10-23'),
(10199,103,'Sankalp',4,'2025-10-26')


select * from movies
select * from Theaters
select * from Showtimes
select * from Bookings






-------------------P3----------------------


create table Products(
Pid int identity(1,1) primary key,
Pname varchar(50) not null,
Pdescription varchar(255),
Stock varchar(25) default 'Stock available',
BrandID int foreign key references Brand(BrandID),
rating decimal (2,1),
Price decimal(10,2) check (Price>0)
)

insert into Products values('Realme pad 2','superfast tablet with 2k display', 'Not available', 2, 4.0, 15000.00)
insert into Products values('Apple iphone 17 pro','fastest phone out there with superior camera', default , 1, 4.3,120000.00)
insert into Products( Pname, Pdescription, BrandID, rating, price) values('Samsumg m31 5G','budget phone under 15k', 3, 3.9,12999.99)
insert into Products values('Lenovo Yoga 7 16" ','AMD ryzen 7850HS with 16GB ram and 1TB SSD', 'Not Available' , 4, 4.8,80000.00)








----------------P4 REFERENTIAL INTEGRITY------------------

--adding foreign keys to Showtimes table
alter table Showtimes add constraint ST_fk1 foreign key(MovieId) references Movies(MovieId)
alter table Showtimes add constraint ST_fk2 foreign key(TheaterId) references Theaters(TheaterId)

--adding foreign keys to Bookings table
alter table Bookings add constraint Booking_fk foreign key(ShowId) references Showtimes(ShowId)







--------------P5 DDL ALTER COMMANDS--------------------------

--adding primary keys
alter table Movies add constraint Movie_pk primary key(MovieId)

alter table Theaters add constraint Theater_pk primary key(TheaterId)

alter table Showtimes add constraint ST_pk primary key(ShowId)

alter table Bookings add constraint Booking_pk primary key(BookingId)

--adding not null
alter table bookings alter column SeatsBooked int not null

--modify domain of existing column
alter table Movies alter column rating decimal(2,1) 

--adding check constraint
alter table Movies add constraint CHK_rating check(rating >=0 and rating <=5)
alter table Showtimes add constraint CHK_price check(price >0)
alter table Bookings add constraint CHK_seats check(seatsbooked >0)

--adding column to theater table
alter table Theaters add Capacity int

--dropping column from theater table
alter table Theaters drop column Capacity

--dropping constraint
alter table Showtimes drop constraint CHK_price

--change column name
EXEC sp_rename 'Movies.Duration','Duration ( in mins)','column'





--------------------------------USING ADVENTUREWORKS2022 DATABASE---------------------------------------


use AdventureWorks2022



---------------P6----------------

--1

select BusinessEntityID, JobTitle, SalariedFlag
from HumanResources.Employee
where SalariedFlag = 1;



--2

select 
    Name,
    ListPrice,
    CASE 
        WHEN ListPrice < 100 THEN 'Cheap'
        WHEN ListPrice BETWEEN 100 AND 1000 THEN 'Moderate'
        ELSE 'Expensive'
    END AS PriceCategory
from Production.Product;



--3

select 
    ProductID,
    Name,
    'AdventureWorks Product' AS Label
from Production.Product;



--4

select distinct JobTitle
from HumanResources.Employee;


--5

select SalesOrderID, OrderDate, TotalDue,
    CASE 
        WHEN onlineOrderFlag = 1 THEN 'online Sales'
        ELSE 'Other Sales'
    END AS OrderType
from Sales.SalesOrderHeader;



--6

select ProductID, name, ListPrice
from Production.Product
where ListPrice>500
order by ListPrice desc


--7

select distinct Color
from Production.Product



--8

select BusinessEntityID, AccountNumber, Name from Purchasing.Vendor
where CreditRating>2
order by CreditRating desc



--9

select ProductID, Name, 'Active' as ProductStatus
from Production.product
where sellEndDate is null



--10

select SalesOrderDetailID, CarrierTrackingNumber, ProductID, OrderQty
from sales.SalesOrderDetail
where OrderQty>30
order by OrderQty desc







---------------------P7-----------------------------




--1

select BusinessEntityID, LoginID, JobTitle 
from HumanResources.Employee
where JobTitle not like '%Manager%'



--2

select customerID, TerritoryID
from sales.Customer
where TerritoryID in (1,3,5)



--3

select BusinessEntityID, MaritalStatus, Gender
from HumanResources.Employee
where MaritalStatus='S' and Gender='M'




--4

select customerID, AccountNumber
from sales.Customer
order by AccountNumber
offset 0 rows
fetch next 5 rows only



--5

select top 20 percent BusinessEntityID, JobTitle
from HumanResources.Employee
order by JobTitle




--6

select AddressID, AddressLine1, City
from person.Address
where City in('Seattle','Dallas','Toronto')




--7

select top 5 ProductID, sum(orderQty) as 'Total Units Sold'
from Sales.SalesOrderDetail
group by ProductID
order by sum(orderQty) desc




--8

select *
from Production.ProductReview
where Comments like '%excellent%'



--9

select DepartmentID, Name, GroupName
from HumanResources.Department
where GroupName not like '%Manufacturing%' and GroupName not like '%Sales%'


--10

select top 10 productID, name, ListPrice
from Production.Product
order by ListPrice desc



--11

select SalesOrderID, TotalDue, Status
from Sales.SalesOrderHeader
where TotalDue BETWEEN 1000 AND 5000







------------------P8--------------------------




--1

select City, count(*) as TotalAddresses
from Person.address
group by City
having count(*)>100
order by count(*) desc




--2

select FileExtension, count(*) as TotalDocuments
from Production.Document
group by FileExtension




--3

select year(orderDate) as OrderYear, sum(TaxAmt) as TotalTax
from Sales.SalesOrderHeader
group by Year(OrderDate)
order by OrderYear

--4

select color, count(*) as TotalProducts
from Production.Product
group by color
having count(*)>20
order by TotalProducts asc




--5

select JobTitle, avg(VacationHours) as AvgVacationHours
from HumanResources.Employee
group by JobTitle
order by avg(VacationHours)




--6

select year(BirthDate) as BirthYear, count(*) as TotalEmployees
from HumanResources.Employee
group by year(BirthDate)
order by BirthYear



--7

select JobTitle, avg(SickLeaveHours) as AvgSickLeaveHours
from HumanResources.Employee
group by JobTitle
having avg(SickLeaveHours)>40




--8

select month(OrderDate) as OrderMonth, sum(Freight) as TotalFreightAmt
from Sales.SalesOrderHeader
group by month(OrderDate)
having sum(Freight)>200000
order by OrderMonth



--9

select shelf, sum(Quantity) as TotalQty
from Production.ProductInventory
group by shelf
having sum(Quantity)>10000
order by shelf



--10

select ShipMethodID, avg(freight) as AvgFreightCost
from sales.SalesOrderHeader
group by ShipMethodID







------------------P9---------------------


--1

select distinct ShipMethodID
from Purchasing.PurchaseOrderHeader
except
select distinct ShipMethodID
from Sales.SalesOrderHeader


--2

select distinct CreditCardID
from Sales.CreditCard
except
select distinct CreditCardID
from Sales.SalesOrderHeader
order by CreditCardID



--3

select distinct ProductID
from Sales.SalesOrderDetail
intersect
select distinct ProductID
from Purchasing.PurchaseOrderDetail


--4

select ProductID
from Production.Product
except
select ProductID
from Sales.SalesOrderDetail


--5

select BusinessEntityID
from HumanResources.Employee
except
select BusinessEntityID
from Sales.SalesPerson
order by BusinessEntityID;



--6

select distinct OrderDate
from Sales.SalesOrderHeader
except
select distinct OrderDate
from Purchasing.PurchaseOrderHeader
order by OrderDate;


--7

select Name
from Production.Product
intersect
select Name
from Production.ProductModel;


--8

select distinct JobTitle
from HumanResources.Employee
where Gender = 'F'
except
select distinct JobTitle
from HumanResources.Employee
where Gender = 'M'
order by JobTitle;

--9

select distinct CustomerID
from Sales.Customer
except
select distinct CustomerID
from Sales.SalesOrderHeader
order by CustomerID asc;

--10

select distinct TerritoryID
from Sales.Customer
except
select distinct TerritoryID
from Sales.SalesOrderHeader
order by TerritoryID;






--------------------P10-----------------------


--1

select p.ProductID, p.Name AS ProductName, ps.Name AS SubcategoryName
from Production.Product p
join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID;

--2

select e.BusinessEntityID, p.FirstName, p.LastName, e.JobTitle
from HumanResources.Employee e
left join Person.Person p
on e.BusinessEntityID = p.BusinessEntityID;


--3

select poh.PurchaseOrderID, v.name as VendorName, poh.OrderDate
from Purchasing.PurchaseOrderHeader as poh
inner join Purchasing.Vendor as v
on poh.VendorID=v.BusinessEntityID
order by poh.OrderDate



--4

select pi.ProductID,p.name, pi.Quantity, l.Name AS LocationName
from Production.ProductInventory as pi
inner join Production.Location as l
on pi.LocationID = l.LocationID
inner join Production.Product as p
on pi.ProductID=p.ProductID


--5

select soh.SalesOrderID, soh.OrderDate, sm.Name AS ShipMethod
from Sales.SalesOrderHeader as soh
inner join Purchasing.ShipMethod as sm
on soh.ShipMethodID = sm.ShipMethodID;


--6

select wo.WorkOrderID, p.ProductID, p.Name
from Production.WorkOrder as wo
inner join Production.Product as p
on p.ProductID=wo.ProductID
order by wo.WorkOrderID


--7

select e.BusinessEntityID, p.FirstName, p.LastName, ea.EmailAddress
from HumanResources.Employee e
left join Person.Person p
on e.BusinessEntityID = p.BusinessEntityID
left join Person.EmailAddress ea
on p.BusinessEntityID = ea.BusinessEntityID

--8

select c.CustomerID, soh.SalesOrderID, soh.OrderDate
from Sales.Customer c
left join Sales.SalesOrderHeader soh
on c.CustomerID = soh.CustomerID;



--9

select  pr.ProductReviewID, p.ProductID, p.name as ProductName, pr.Rating, pr.Comments
from Production.Product as p
inner join Production.ProductReview as pr
on p.ProductID=pr.ProductID


--10

select v.BusinessEntityID AS VendorID, v.Name AS VendorName, pv.ProductID
from Purchasing.Vendor v
full join Purchasing.ProductVendor pv
on v.BusinessEntityID = pv.BusinessEntityID
order by pv.productID

