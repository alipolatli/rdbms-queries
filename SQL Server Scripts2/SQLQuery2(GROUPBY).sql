select CategoryID, SUM(UnitsInStock) TOPLAMSTOK, AVG(UnitPrice) ORTALAMAFIYAT  from Products
group by CategoryID

--XXX--
select CategoryID, SUM(UnitsInStock) TOPLAMSTOK, AVG(UnitPrice) ORTALAMAFIYAT  from Products
where UnitsInStock <= 10
group by CategoryID

--HATA VERIR CUNKU ONCE GRUPLAMA YAPILIR,DAHA SONRA HAVING CALISIR. HALIYLE SUM CALISTIKTAN SONRA HAVING CALISAMAZ.
select CategoryID, SUM(UnitsInStock) TOPLAMSTOK, AVG(UnitPrice) ORTALAMAFIYAT  from Products
group by CategoryID
having UnitsInStock<=10 
--XXX--


--XXX--
select CategoryID, SUM(UnitsInStock) TOPLAMSTOK, AVG(UnitPrice) ORTALAMAFIYAT  from Products
group by CategoryID
having CategoryID <= 10

select CategoryID, SUM(UnitsInStock) TOPLAMSTOK, AVG(UnitPrice) ORTALAMAFIYAT  from Products
where CategoryID<=10
group by CategoryID
--XXX--

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


