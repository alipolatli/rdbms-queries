select * from Customers
select * from Orders

select * from Customers,Orders

--INNER JOIN

--1
select O.CustomerID,O.OrderDate,O.OrderID,C.ContactName from Orders O inner join Customers C
on C.CustomerID =O.CustomerID

--2 
select C.CategoryID, C.CategoryName,P.ProductID,P.ProductName,P.UnitsInStock  from Categories C inner join Products P 
on C.CategoryID = P.CategoryID 
where  P.UnitsInStock<10

--3 (uc tablo birlestirme)
select * from Customers C inner join Orders O 
on C.CustomerID = O.CustomerID 
inner join Employees E on O.EmployeeID =E.EmployeeID

--4(nancy'nin 1997den once satis yapt?g? firmalarin isimleri, order ?dleri,tarihe göre)
select E.FirstName,E.HireDate,O.OrderID ,C.CompanyName from Customers C inner join Orders O 
on C.CustomerID = O.CustomerID 
inner join Employees E on O.EmployeeID =E.EmployeeID
where E.FirstName='Nancy' and YEAR(E.HireDate)<1997
order by E.HireDate desc

--(category,product,supplier) (category'si seafood olan ve unitprice'i 100den kücük ve stocku 30'dan kücük olan
--supplier'larla birlikte getir.
select C.CategoryID,C.CategoryName,P.ProductID,P.ProductName,S.SupplierID,S.CompanyName,P.UnitPrice from Categories C inner join Products P on P.CategoryID= C.CategoryID 
inner join Suppliers S on P.SupplierID= S.SupplierID 
where P.UnitsInStock<30 and P.UnitPrice<100 and C.CategoryName='Seafood'
order by P.UnitPrice

--ayni tabloyu iliskisel olarak birlestirme(rol bazl? farkli tablo olusuturulsa daha dogru olur)
select E1.EmployeeID,E1.FirstName,E1.ReportsTo, E2.EmployeeID,E2.FirstName,E2.ReportsTo from Employees E1 inner join Employees E2 on E1.EmployeeID = E2.ReportsTo 

--INNER JOIN VE GROUP BY KULLANIMI
select P.ProductName,  COUNT(P.CategoryID) from Categories C inner join Products P
on C.CategoryID = P.CategoryID
group by P.ProductName

--
select E.FirstName + ' ' + E.LastName EMPLOYEE, COUNT(O.OrderID) SATISADEDI from Employees E inner join Orders O
on E.EmployeeID = O.EmployeeID
group by E.FirstName + ' '+ E.LastName 

--
select E.FirstName + ' ' + E.LastName EMPLOYEE, COUNT(O.OrderID) SATISADEDI from Employees E inner join Orders O
on E.EmployeeID = O.EmployeeID
group by E.FirstName + ' '+ E.LastName 
having COUNT(O.OrderID)>100

--hangi katgoriden kac ürün var
select C.CategoryName, COUNT(P.ProductID) URUNADEDI from Categories C inner join Products P 
on C.CategoryID = P.CategoryID 
group by C.CategoryName

--avrupada olan tedarikcilerin hangi kategoriden kac ürünü var
select C.CategoryName, COUNT(P.ProductID) URUNADEDI from Categories C inner join Products P 
on C.CategoryID = P.CategoryID inner join Suppliers S on  P.SupplierID =S.SupplierID 
where S.Country in('UK,USA','Sweden','Germany')
group by C.CategoryName 

--avrupada olan tedarikcilerin hangi kategoriden 2 ürün üstü olanlar
select C.CategoryName, COUNT(P.ProductID) URUNADEDI from Categories C inner join Products P 
on C.CategoryID = P.CategoryID inner join Suppliers S on  P.SupplierID =S.SupplierID 
where S.Country in('UK,USA','Sweden','Germany')
group by C.CategoryName
having COUNT(P.ProductID) >2

--hangi personel kac adet satis yapmis.
select E.FirstName, Count(O.OrderID) SATISADEDI from Employees E inner join Orders O 
on E.EmployeeID= O.EmployeeID
group by E.FirstName

--en cok satis yapan personel ve adedi.
select top 1 E.FirstName, COUNT(O.OrderID) SATISADEDI from Employees E inner join Orders O 
on E.EmployeeID = O.EmployeeID 
group by E.FirstName
order by COUNT(O.OrderID) desc

--en cok sat?s yapan personelin satis adedi
select MAX(E.SATISADEDI) MAXSATISADEDI from (select E.FirstName, Count(O.OrderID) SATISADEDI from Employees E inner join Orders O 
on E.EmployeeID= O.EmployeeID
group by E.FirstName)  E 

--adinda a harfi olan ve personellerin satis id'si 10500'den büyük olan
--ve satislarin toplam tutari 5000den fazla olanlari
--ve bu satislarin hangi tarihte gerceklestigini yeniye göre listele.
select O.OrderDate, SUM(OD.UnitPrice*OD.Quantity) TOPLAMTUTAR from Employees E inner join Orders O 
on E.EmployeeID = O.EmployeeID inner join
[Order Details] OD on OD.OrderID = O.OrderID 
where E.FirstName like '%a%' and O.OrderID>10500
group by O.OrderDate
having SUM(OD.UnitPrice*OD.Quantity) > 5000
order by O.OrderDate desc










