--AGGREGATE FONKSIYONLAR
use Northwind
--(toplam)
select SUM(UnitPrice)  from Products
--(artimetik ortalama)
select AVG(UnitPrice) as FiyatOrtalamasi from Products
--(en b�y�k)
select MAX(UnitPrice)  from Products
--(en k���k)
select MIN(UnitPrice)  from Products
--(adet-satir sayisi)
select Count(ProductID)  from Products
select Count(UnitPrice)  from Products

--
select SUM(UnitPrice)  from Products where ProductID <5




