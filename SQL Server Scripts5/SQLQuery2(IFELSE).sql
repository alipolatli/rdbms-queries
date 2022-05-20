declare @firstName nvarchar(max)
set @firstName='Ali'
if @firstName ='Ali'
print 'Evet'
else
print 'Hayir'

--begin end(scope)
declare @sayi1 int =3
declare @sayi2 int=4
if @sayi1 <@sayi2
begin
print 'sayi 1 sayi 2den kücük'
select @sayi1 [Sayi 1] ,@sayi2 [sayi 2]
end
else
begin
print 'sayi 1 sayi 2den büyük'
select @sayi1 [Sayi 1] ,@sayi2 [sayi 2]
end

--usa ülkeli calisan var mi
select * from Employees where Country='USA'
if @@ROWCOUNT >=1
print 'evet'
else
print 'hayir'

--ismi ali olan soyadi polatli olan personel var mi? varsa evet yoksa kaydet
declare @isim nvarchar(max) = 'ali'
declare @soyisim nvarchar(max) = 'polatli' 
select * from Employees where FirstName= @isim and LastName= @soyisim
if @@ROWCOUNT >=1
print 'evet'
else
begin
insert Employees (FirstName,LastName) values(@isim,@soyisim)
print 'basariyla eklendi'
select FirstName, LastName from Employees 
end

--if, else if, else (SYNTAX)
declare @age int =12
if @age >18
print 'Girebilirsiniz'
else if @age =18
print 'Seneye girebilirsiniz'
else
print 'Giremezsiniz'

--EXIST
if Exists(select *from Employees)
print'dolu'
else
print 'bos'