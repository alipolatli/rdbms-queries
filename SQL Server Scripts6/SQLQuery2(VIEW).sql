--VIEW
--KULLANIM AMACI
--genellikle karmas?k sorgularin tek bir sorgu uzerinden calistirilabilmesi,
--bu amacla raporlama islemelerinde kullanilabilmesi,
--güveenlik icin sorgunun 2. 3. sahislardan sakalanbilmesi amaciyla kullanilir.
--GENEL OZELLIKLERI
--sorgunun sonucunu tablo olarak al?p , ondan sorgu cekilebilir,
--insert, update, delete yapilabilir fakat FIZIKSEL TABLOYA YANSIR,
--view yapilari fiziksel olarak olusturulur. ekstra alan ihtiyaci vardir,
--normal sorgulardan daha yavas calisirlar,
--ozetle performans icin cok gerekli oldugu durumlarda kullanilmalidir.

--VIEW OLUSTURMA

--100 dolar üzeri siparislerde en cok satis yapan calisanlarin kac adet satis yaptigi ve ismi ve
--sagladigi kazanca göre siralama
--VIEWLARDA ORDER BY KULLANIMI PERFORMANS ACISINDAN ONERILMEZ
--EGER ORDER BY KULLANILACAKSA MUTLAKA TOP KULLANILMADLIDIR
create view BestEmployees12
as
select top (5) CONCAT(E.FirstName,E.LastName) FULLNAME  , COUNT(O.OrderID) SATISADEDI, SUM(OD.UnitPrice * OD.Quantity) KAZANC from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID 
inner join [Order Details] OD on O.OrderID = OD.OrderID
where OD.UnitPrice> 100
group by CONCAT(E.FirstName,E.LastName)
order by SUM(OD.UnitPrice * OD.Quantity) desc

select * from BestEmployees12
--------------------------------------
go
--------------------------------------
create view BestEmployees
as
select CONCAT(E.FirstName,E.LastName) FULLNAME  , COUNT(O.OrderID) SATISADEDI, SUM(OD.UnitPrice * OD.Quantity) KAZANC from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID 
inner join [Order Details] OD on O.OrderID = OD.OrderID
where OD.UnitPrice> 100
group by CONCAT(E.FirstName,E.LastName)
-------------------------------------
--VIEW OLUSTURMA

go
--VIEWLARDA YAPILAN DEGISIKLIKLER FIZIKSEL VERI TABANINA YANSIR(view veritabani)
create view EmployeesName
as
select FirstName, LastName from Employees
insert EmployeesName(FirstName,LastName) values('Ali' ,'Polatli') 
select * from EmployeesName
go



--WITH ENCRYPTION ile design modu kapatilir.yani kaynak koduna erisilemez.BIR DAHA ERISILEMEZ.
create view EmployeesName2
with encryption
as
select FirstName, LastName from Employees
select * from EmployeesName2
go
--WITH ENCRYPTION


--WITH SCHEMABINDING ile viewin kullandigi tablolardaki degisikler engellenir. 
--WITH SCHEMABINDING kullanilacaksa dbo.(namespace) ile kullanilmalidir.
create view EmployeesName3
with schemabinding
as
select FirstName, LastName from dbo.Employees
select * from EmployeesName2

insert Employees(FirstName,LastName) values('cansel','mundus')
--hata verir.
alter table Employees
alter column FirstName int
--WITH SCHEMABINDING


--WITH CHECK OPTION 
--view'in yapisina uygun insert'leri kabul eder. where sorgusundan sonra kullanilir.
go
create view EmployeesCheckView
as
select FirstName , LastName from Employees where FirstName like 'a%'
with check option
--basarili
insert EmployeesCheckView (FirstName,LastName) values ('aybuke','sonmez')
--hatali
insert EmployeesCheckView (FirstName,LastName) values ('rezzak','dagdelen')
--WITH CHECK OPTION 