-- Consultas Simples --

-- 1) Selecione todos os produtos da tabela Production.Product.
SELECT *
FROM Production.Product;

-- 2) Liste os nomes e números dos produtos que têm um preço de lista (ListPrice) maior que 100.
SELECT Name, ProductNumber, ListPrice
FROM Production.Product
WHERE ListPrice > 100;

-- 3) Mostre os nomes dos produtos que pertencem à categoria "Bikes".
SELECT p.ProductID, p.Name
FROM Production.Product p
JOIN Production.ProductSubcategory s ON p.ProductSubcategoryID = s.ProductSubcategoryID
JOIN Production.ProductCategory c ON s.ProductCategoryID = c.ProductCategoryID
WHERE c.Name = 'Bikes';

-- Consultas com JOINS --

--4) Liste os nomes dos clientes (Customer) e as datas de suas ordens de venda (SalesOrderHeader).
select c.CustomerID, p.FirstName, p.LastName, soh.OrderDate 
from Sales.Customer c
inner join Person.Person p on c.PersonID = p.BusinessEntityID
inner join Sales.SalesOrderHeader soh on c.CustomerID = soh.CustomerID 

--5) Mostre os nomes dos produtos vendidos em cada ordem de venda (SalesOrderDetail).
select sod.SalesOrderID, p.Name, sod.OrderQty 
from Sales.SalesOrderDetail sod 
inner join Production.Product p on p.ProductID  = sod.ProductID 


--6) Liste os funcionários (Employee) e os nomes dos departamentos em que trabalham.
select e.BusinessEntityID, p.FirstName, p.LastName, d.Name 
from HumanResources.Employee e 
inner join Person.Person p on p.BusinessEntityID = e.BusinessEntityID
inner join HumanResources.EmployeeDepartmentHistory edh on edh.BusinessEntityID = e.BusinessEntityID 
inner join HumanResources.Department d on d.DepartmentID  = edh.DepartmentID 

-- Consultas com Agregações --

--7) Calcule o total de vendas (TotalDue) por cliente.


