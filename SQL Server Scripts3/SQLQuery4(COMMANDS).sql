--UNION ( fakli tablolari alt alta getirir.)
select * from Categories 
select * from Products

--hata verir.
select * from Categories 
union
select * from Products

--üsteki tablonun kolon isimleri baz alinir.
--kolon tipleri uyumlu olmalidir..
select CategoryID,CategoryName from Categories 
union
select ProductID,ProductName from Products
--UNION


--UNION ALL (tekrarli kayitlari getirmez.)


--CASE -WHEN -THEN -ELSE -END KALIPLARI
--eger unvan eki mr. ise erkek mrs. ya da ms. ise kadin yaz ikisi de degilse aynen kalsin.
select FirstName,LastName,
case
when TitleOfCourtesy = 'Mr.' then 'Erkek'
when TitleOfCourtesy = 'Ms.' then 'Kadin'
when TitleOfCourtesy = 'Mrs.' then 'Kadin'
else TitleOfCourtesy
end
from Employees
--fiyata göre 
select ProductID, UnitPrice,
case
when UnitPrice< 30 then 'Ucuz'
when UnitPrice >=30 and UnitPrice<50 then 'Pahali'
when UnitPrice >=50 then 'Cok Pahali'
end
from Products 
--CASE -WHEN -THEN -ELSE -END KALIPLARI

--TRUNCATE (tablodaki tüm verileri siler ve ayni zamanda identity sifirlar.(delete'dan farkli) ) 
truncate table Territories
--genellikle test asamasindan sonra kullanilir.
--TRUNCATE


--SUBQUERY(inner join kullanilabildigi durumlarda mutlaka kullanilmalidir.)
--**içerdeki satir bir adet olmalidir.
--inner join
select ProductName from Categories C inner join Products P on C.CategoryID= P.CategoryID where CategoryName='Seafood'
--subquery
select ProductName from Products where CategoryID = (select CategoryID from Categories where CategoryName='Seafood')
--SUBQUERY









