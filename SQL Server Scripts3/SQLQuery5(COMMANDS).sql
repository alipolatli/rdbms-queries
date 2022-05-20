--WITH(veritabanina kaydedilmeden complex sorgularda iyi görünüm acisindan kullanilir.)
select * from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID inner join [Order Details] OD 
on O.OrderID = OD.OrderID

with PersonelSatis(id,ad,soyad,satisId,satisFiyat)
as
(
select E.EmployeeID, E.FirstName,E.LastName,O.OrderID,OD.UnitPrice from Employees E inner join Orders O 
on E.EmployeeID = O.EmployeeID inner join [Order Details] OD 
on O.OrderID = OD.OrderID 
)
select *from PersonelSatis 
--WITH

--BULK INSERT (harici kaynaktan tabloya veri ekleme )
--kisiler tablosu önceden olusturulmalidir.
bulk insert Kisiler 
from 'C:\Kisiler.txt'
with
(
FieldTerminator ='\t',
RowTerminator  ='\n'
)
--BULK INSERT


--IDENTITY
insert Employees (FirstName,LastName) values ('ali','kemal')
--son olusan degerin identitiy degerini getirir.
select @@IDENTITY
insert Employees (FirstName,LastName) values ('ada','melis')
select @@IDENTITY
--IDENT?TY

--ROWCOUNT(yapilan islem neticesinde kac eleman etkilendigini döndürür.)
insert Employees (FirstName,LastName) values ('ada','melis')
delete Employees where FirstName= 'ada'
select @@ROWCOUNT

select * from Employees
select @@ROWCOUNT

--DBCC CHECKIDENT ( identitiy kolonuna müdahele eder ve 3.parametrede verilen degerden baslar.
--.TAVSIYE EDILMEZ)
DBCC checkident (CustomTable,reseed,12)
--DBCC CHECKIDEN

--WITH TIES (sonuncuyla esit olanlari da getir.)
select top (6) * from [Order Details]
select top (6) with ties * from [Order Details] order by OrderID
--WITH TIES 