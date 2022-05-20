--TRIGGERS(Tetikleyiciler) => islem sürecinde veya sonrasinda devreye giren yapilardir. aop'a benzer.(for),(after)
--DML Trigger =>insert, update, delete.
--DDL Trigger => create,alter,drop .

--DML TRIGGER
--INSERTED TABLE
--**eger bir tabloda insert islemi yapiliyorsa arka planda RAM'de olusturulan inserted isimli bir tablo uzerinde yapilir. problem yoksa fiziksel tabloya insert edilir. islem bittiginde ramde olusturulan inserted tablosu silinir. 
--DELETED TABLE
--**tabloda yapilan delete islemi icin ayni algoritma calisir ve deleted tablosu olusur. problem yoksa fiziksel tabloya yansir ve RAM'den deleted tablosu silinir.
--**UPDATED islemlerinde hem inserted hem deleted olusur.SQL SERVER'da once deleted sonra inserted olusur. eski veriler deleted tablosunda yeni veriler insetred tablosunda bulunur.
--!!inserted ve deleted tablolari ayni kolonlara sahip olur. select sorgulari yapilabilir.
--!!tanimlanan triggerlara tablo dizininden erisilebilir.

--PROTOTYPE
--create trigger [trigger ismi]
--on [Tablo ismi]
--for veya after insert,update,delete
--as
--sql kodlari...

--TRIGGER OLUSTURMA
create trigger AddRegionTrigger
on Region
after insert
as
begin
select * from inserted
select 'basariyla bolge eklendi.'
end

go

insert Region (RegionID,RegionDescription) values (5,'Marmara')

go
--tedarikciler tablosundan bir veri silindiginde tum urunlrin fiyati 10 artsin
create trigger DeleteSuppliersTrigger
on Suppliers
after delete
as
begin
update Products set UnitPrice = UnitPrice +10
select * from Products

end

go

delete from Suppliers where SupplierID=30

--personeller tablosundan bir kayit silindiginde kaydin ismi soyismi kim tarafindan silindigi ve hangi tarihte silindigi farkli bir tabloya kayit edilsin
create table DeleteEmployeeLog
(
silinenEmployeeIsim nvarchar(max),
silinenEmployeeSoyisim nvarchar (max),
silenKisiIsim nvarchar(max),
silmeTarihi datetime default getDate()
)
go
create trigger DeleteEmployeeTrigger
on Employees
after delete
as
begin
declare @firstname nvarchar(max)
declare @lastName nvarchar(max)
select @firstname=FirstName, @lastName= LastName from deleted
insert DeleteEmployeeLog (silinenEmployeeIsim,silinenEmployeeSoyisim,silenKisiIsim) values (@firstname,@lastName,'Ahmet')
select * from DeleteEmployeeLog
end
delete from Employees where EmployeeID=36

--personeller tablosunda update ile ismi ----- olan ve --- yeni adiyla --- olan personel ----tarafindan ---- tarhinde guncellendi.
create trigger UpdateEmployeeTrigger
on Employees
after update
as
begin
declare @oldfirstname nvarchar(max)
declare @newfirstName nvarchar(max)
declare @nowDate nvarchar(max)= CAST(GETDATE() as nvarchar(max))
declare @user nvarchar(max)= CAST(SUSER_SNAME() as nvarchar(max))
select @oldfirstname= FirstName from deleted
select @newfirstName= FirstName from inserted
select 'personeller tablosunda update ile ismi ' +@oldfirstname+'---- olan ve yeni adiyla'+ @newfirstName +' olan personel'+ @user +'-tarafindan'+ @nowDate  +' tarhinde guncellendi.'
end
select * from Employees
update Employees set FirstName ='Cansel' where EmployeeID=35

--INSTEAD OF TRIGGERS(yapilan islemler yerine su islemleri yap mantiginda calisir.)
create trigger RegionUpdateTrigger
on Region 
instead of update
as
begin
select 'Guncelleme yapilmak istendi fakat trigger müsade edemez'
end

update Region set RegionDescription ='EGE' where RegionID=5

--DDL TRIGGERS
--create, alter, drop islemleri sonucu devreye girer.
create trigger DDLTrigger
on database
after drop_table,alter_table,create_function,create_procedure --vs...
as
select 'DDL KOMUTU CALISTI.'

--trigger'i devre disi birakma
disable trigger  UpdateEmployeeTrigger on Employees
--tekrar etkinlestirme
enable trigger  UpdateEmployeeTrigger on Employees



