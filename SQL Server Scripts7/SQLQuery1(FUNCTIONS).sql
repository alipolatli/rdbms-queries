--FUNCTIONS
--**her iki fonksiyon da fiziksel olarak veritabaninda olusturulmaktadir.
--**create ile olusturulur.
--Programmability -> Functions uzerinden erisilebilir.
--SCALAR FUNCTIONS
--**istenilen tipte deger doner.
--INLINE FUNCTIONS
--**tablo doner.
--geriye tablo doner, bu yonuyle view'lara benzer.
--view kullanilmasi inline func'a nazaran onerilir.


--SCALAR FUNC TANIMLAMA
create function Topla(@sayi1 int,@sayi2 int) returns int
as
begin
return @sayi1 + @sayi2
end
go
--SCALAR FUNC KULLANMA
--**fonskiyon kullanilirken semasiyla birlikte cagirilmalidir.
select dbo.Topla(12,3)
go
--herahangi bir urunun %18 kdv dahil olmak uzere toplam maliyeti.
create function Maliyet2(@birimFiyat decimal, @stokMik decimal) returns decimal
begin
declare @sonuc decimal = @birimFiyat *@stokMik * 1.18
return @sonuc
end
go
select dbo.Maliyet2(12.3,113.3)
go
--INLINE FUNC TANIMLAMA
--**begin, end kullanilmaz.
create function GetCategoryByName(@categoryName nvarchar(15)) returns table
return select * from Categories where CategoryName= @categoryName
go
--INLINE FUNC KULLANMA
--**inline funclar sanki bir tabloymus gibi cagirilir. pek de islevli degildir.
select * from  dbo.GetCategoryByName('Seafood')

go
--FONKSIYONLARDA WITH ENCRYPTION
--**wiewlardaki gibi design yolunu kapatir. geri donusu yoktur.
create function Sayi() returns int
with encryption 
begin
return 12
end
go
--alter ile düzenlenirse erisim gerceklesir.
alter function Sayi() returns int
begin
return 12
end
go
--COMPUTED COLUM(otomatik hesaplanabilir kolonlonlar)
create function Carp(@s1 int, @s2 int) returns int
as
begin
return @s1 * @s2
end
go
select ProductName, UnitPrice, UnitsInStock, dbo.Carp(UnitPrice,UnitsInStock) GELIR from Products
go
--____ kategorisindeki ____ urununun toplam geliri________'dir.
create function Rapor(@categoryName nvarchar(40),@productName nvarchar(40),@stock int,@price int)
returns nvarchar(max)
as
begin
declare @cikti nvarchar(max) = @categoryName +' kategorisndeki' + @productName +'urunun toplam fiyati' + Cast(@stock * @price as nvarchar(max))+'dir.'
return @cikti
end
go
select dbo.Rapor(C.CategoryName,P.ProductName,P.UnitsInStock,P.UnitPrice) RAPOR from Categories C 
inner join Products P on C.CategoryID= P.ProductID

