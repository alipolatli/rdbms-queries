--tabloyu fiziksek olarak kopyalama
select  * from Employees
--pk ve fk constraintleri gelmez, onun haricindeki her sey kopyalanir.
select * into EmployeesCopy from Employees
select * from EmployeesCopy

--# ile tabloyu gecici olarak ram'e kopyalama
--**SQL SERVER'DA OTURUM ACAN KULLANICININ BELLEGINDE OLSUUR, KAPANDIGI TAKDIRDE TUM VERILER SILINIR.
select * into #Emlopyees from Employees
select * from #Emlopyees
--gecici tablo üzerinde degisiklikler 
insert #Emlopyees (FirstName,LastName) values ('Ahmet','Tas')
delete #Emlopyees where EmployeeID=1
update top (3) #Emlopyees set FirstName ='Beyza'
alter table #Emlopyees
add Sehir nvarchar(100) 
alter table #Emlopyees
alter column Sehir nvarchar (50) 
select * from #Emlopyees

--## ile tabloyu gecici olarak ram'e kopyalama
--TEK FARKI olusturulan sql server'?n oturum bilgileri ile 3. sahislar da kullanabilir.
--oturum acan sql serverdan diconnet olursa silinir.
