--DEGISKENLER(VARIABLES)

--declare @degiskenadi degiskentipi
declare @firstName nvarchar
declare @age int
declare @salary money 
declare @x int, @y datetime, @z bit
declare @hireDate datetime= getDate()
--tanimlanmis degiskenlere deger atama
--SET(tanimlamayla birlikte calistirilmalidir. aksi takdirde hata verir.)
declare @age int
set @age = 23
--degiskenin degerini elde etme
declare @role nvarchar(50)
set @role= 'Admin'
select @role 
print @role
--sorgu sonucu gelen verileri degiskenle elde etme
--**1) sorgu sonucu gelen satir sayisi bir adet olmalidir.
select * from Employees where Id=4
--**2)kolonlardaki verilerin tipleriyle degiskenelerin tipleri benzer olmalidir.
declare @id int
declare @userId int
declare @hireDate datetime
select @hireDate= HireDate from Employees where Id=4
select @hireDate

--BATCH KAVRAMI- go (sorgulari ayirir.)
create database ornekdb
go
use ornekdb
go
create table ornektable
(
id int,
firstName nvarchar(40)
)

