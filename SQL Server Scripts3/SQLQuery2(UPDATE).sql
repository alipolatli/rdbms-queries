--UPDATE
--update [TabloAdi] set [KolonAdi] = deger
update Employees set FirstName ='H�samettin' where FirstName='Ali'

--join kullanarak birden fazla tabloda g�ncelleme yapmak
update Products set ProductName=Categories.CategoryID from 
Products inner join Categories on Products.CategoryID = Categories.CategoryID
where Categories.CategoryID=1

--subquery ile g�ncelleme yapmak
update Employees set FirstName = (select * from Employees where FirstName='Janet') where EmployeeID=1

--top ile g�ncelleme yapmak
update top (3) Employees set FirstName ='ALi'


