--STORED PROCEDURES(SAKLI YORDAMLAR)
--**normal sorgulardan daha hizli calisirlar.
--**normal sorgular execute edilirken 'execute plan' islemi yapilir. bu islem sirasinda hangi tablodan veri cekilecek, hangi kolonlardan gelecek vs. islemler yapilir. bir sorgu calistirildiginda her seferinde bu islemler yapilir.fakat sorgu STORED PROCEDURE ile calistirilsa yalnizca ilk sorgulamada yapilir. daha sonraki sorgularda yapilmaz. haliyle performans artisi saglar.
--**icerisinde select,insert,update,delete islemleri yapilabilir.
--**ic ice kullanilabilir.
--**iclerinde fonksiyon olusturulabilir.
--**sorgularin disaridan alacagi degerler parametre olarak store procedure'lere gecirilir, haliyle 'SQL INJECTION' yemeleri de onlenmis olur, daha güvenlidir.
--**store procedure'lar veritabani nesnesidir. haliyle create ile olusturulur.
--**fiziksel olarak Programmabilty -> Store Procedure yoluyla erisilebilir.

--PROTOTYPE(prototip)
--create procedure ya da proc [isim]
--(
--varsa parametreler
--)
--as
--sorgular,fonskiyonlar,komutlar,sartlar vs..


--STORE PROCEDURE OLUSTURMA
create procedure TopTenEmployees
as
select * from Employees where EmployeeID <10

--parametre tanimlanirken parantez kullanmak zorunlu degildir.fakat okunulabilrik icin kullanilmalidir.

--ekleme
create proc AddEmployee
(
@firstName nvarchar(max),
@lastName nvarchar(max)
)
as
insert Employees (FirstName,LastName) values (@firstName,@lastName)

--guncelleme
create proc UpdateEmployee
(
@id int,
@firstName nvarchar(max),
@lastName nvarchar(max)
)
as
update Employees set FirstName= @firstName ,LastName =@lastName where EmployeeID= @id

--silme
create proc DeleteEmployee
(
@id int
)
as
delete from Employees where EmployeeID = @id

--STORE PROCEDURE KULLANIMI
exec TopTenEmployees
exec AddEmployee'Ahmet','Bilmemne'
exec UpdateEmployee 1,'Kemal','Bilmemne'
exec DeleteEmployee 1

--geriye deger donen store procedure
go
alter proc GetProduct
(
@price money
)
as
begin
select * from Products where UnitPrice = @price
return @@ROWCOUNT
end

declare @sonuc int
exec @sonuc=  GetProduct 18
select @sonuc

--output parametre ile deger dondurme select'e girilen degerleri tumu output olmalidir.
go
alter proc GetCategory 
(
@id int,
@categoryName nvarchar(max) output
)
as
select @categoryName=CategoryName  from Categories where CategoryID = @id

go

declare @categoryName nvarchar(max)
exec GetCategory 4, @categoryName output
select @categoryName

--store procesure parametresine varsayilan deger verme
--**genellikle calismakta olan ve sonradan duzenlenen proc'larda hata onlemek icin kullanilir.
go
create proc AddEmployee2
(
@firstName nvarchar(max) ='Isimsiz',
@lastName nvarchar(max)='Soyisimsiz'
)
as
insert Employees (FirstName,LastName) values (@firstName,@lastName)

exec AddEmployee2 
select *from Employees


--EXEC KOMUTU
exec ('select * from Employees')
--**her exec birbirinden farklidir.
--yanlis
exec('declare @sayac int =1')
exec('print @sayac')
--dogru
exec('declare @sayac int =1 print @sayac')


--STORE PROCEDURE ICINDE NESNE OLUSTURULABLIR.


