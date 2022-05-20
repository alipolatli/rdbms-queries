--TRANSACTION
--birden cok islemin yap?ld?g? durumlarda eger parcayi olusturan islemlerden herhangi birinde sorun c?karsa tum islemleri iptal etmeye yarar.

--begin transaction => transaction islemini baslatir.
--commit transaction=> transaction islemini basariyla sonra erdirir. islem(ler)i gerceklestirir.
--rollback transaction=>transaction islemini iptal eder.

--!!commit transaction yerine commit, rollback transaction yerine rollback yazilabilir.

--normalde default olarak her sey begin tran ile baslayip, commit tran ile biter.(bu yapilar kullanilmasa bile.)


insert Region (RegionID,RegionDescription) values(6,'MEZOPOTAMYA') --varsayilan olarak transaction calisti ve commit edildi.

begin transaction CheckRegion
insert Region values(6,'MEZOPOTAMYA')
commit tran


begin tran DeleteRegion
declare @x int 
delete from Region where RegionID<10
set @x= @@ROWCOUNT
if @x =1
begin
print 'kayit basariyla silindi.'
commit transaction
end
else
begin
raiserror('1den fazla bolge silinemez',1,1)
rollback transaction
end


--ORNEK 
create database BankaDb
go
use BankaDb
go
create Table ABanka
(
HesapNo int,
Bakiye money
)
go
create table BBanka 
(
HesapNo int,
Bakiye money
)
go
insert ABanka values(1,1000),(2,2300)
go
insert BBanka values(1,1230),(2,2400)
go
alter procedure AdanByeHavale
(
@gonderenBanka nvarchar(max),
@gonderenHesapNo int,
@aliciHesapNo int,
@gonderilenBakiye money
)
as
begin 
begin transaction kontrol
declare @mevcutBakiye money, @ABakiye money,@BBakiye money
if @gonderenBanka ='ABanka'
select @ABakiye= Bakiye from ABanka where HesapNo = @gonderenHesapNo
if @gonderilenBakiye > @ABakiye
begin
print 'yetersiz bakiye, islem basarisiz.'
rollback transaction
end
else
begin
update ABanka set Bakiye = Bakiye-@gonderilenBakiye where HesapNo= @gonderenHesapNo
update BBanka set Bakiye = Bakiye+@gonderilenBakiye where HesapNo = @aliciHesapNo
print 'A Bankasindaki' + CAST(@gonderenHesapNo as nvarchar(max)) + 'numarali hesaptan B bankasindaki '+ Cast(@aliciHesapNo as nvarchar(max)) +' numarali hesaba' + CAST(@gonderilenBakiye as nvarchar(max)) +'degrinde para yollanmistir.'
print 'son degerler tablodaki gibidir.'
select * from ABanka where HesapNo = @gonderenHesapNo
select * from BBanka where HesapNo = @aliciHesapNo
commit transaction
end
end
go
exec AdanByeHavale  'ABanka',2,1,1000
