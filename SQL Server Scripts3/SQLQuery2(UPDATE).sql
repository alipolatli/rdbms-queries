--UPDATE
--update [TabloAdi] set [KolonAdi] = deger
update Employees set FirstName ='Hüsamettin' where FirstName='Ali'

--join kullanarak birden fazla tabloda güncelleme yapmak
update Products set ProductName=Categories.CategoryID from 
Products inner join Categories on Products.CategoryID = Categories.CategoryID
where Categories.CategoryID=1

--subquery ile güncelleme yapmak
update Employees set FirstName = (select * from Employees where FirstName='Janet') where EmployeeID=1

--top ile güncelleme yapmak
update top (3) Employees set FirstName ='ALi'


