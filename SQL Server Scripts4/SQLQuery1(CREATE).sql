--DDL (DATA DEF?N?T?ON LANGUAGE)
--create,alter,drop

--CREATE(veritabani nesnesi olusturmayi saglar => database,table,view,storeprocedure,trigger vs.)
--custom ayarlar icin on, log ayarlari icin log kullanilir. log verilmezse default atanir.
create database PerDiem
on
(
name ='perdiem',
filename = 'C:\perdiem.mdf',
size= 5,--ilk balsadiginda kac mb
filegrowth=3--5i gecerse 3 artar ,8i gecerse 3 artar.
)
Log
on 
(
name ='perdiem',
filename = 'C:\perdiem.mdf',
size= 5,--ilk balsadiginda kac mb
filegrowth=3--5i gecerse 3 artar ,8i gecerse 3 artar.
)

create database CustomDatabase

create table CustomTable1
(
Id int primary key identity,
FirstName nvarchar(50),
LastName varchar(20),
Age int,
Job  varchar(40),
Email nvarchar(40) unique,
)



