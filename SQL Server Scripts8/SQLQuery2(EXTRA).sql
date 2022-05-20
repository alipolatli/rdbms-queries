--SCOPE IDENTITY
--@@identity trigger kullaniminda dogru calismaz. cunkü calistigi scope'a bakmaksizin son calisan identity degerini doner.
--scope_identity() kullanilmalidir.

--DEFAULT VALUES 
--**default constraint'leri uygular.
--**sadece identity kolonuna veri eklenecegi durumlarda,
--**eger ki veritabaninda gorevi sadece diger tablolar tarafindan referans alinacagi id'leri üretecek ve barindiracak tabloya ihtiyac varsa kullanilir.

create database ORNEKDATABASE
create table ornektablo
(
id int primary key identity(1,1),
firstName nvarchar(max) default 'Ahmet'
)

insert ornektablo
default values

select *from ornektablo

--TOP KEYWORDU ILE UPDATE/DELETE ISLEMI
select * from Products

update top(5) Products set UnitPrice = UnitPrice-5

delete from Products where ProductID <=5
delete top(5) from Products

--ROW_NUMBER() FONKSIYONU BENZERSIZ SIRALI NUMARA
--**primary kolonundan bagimsiz sirali  index numara atamasi yapar. 
--prototype
--select ROW_NUMBER() OVER(order by KOLONADI) indexer, * from [TabloAdi]

select ROW_NUMBER() OVER(order by ProductId) Indexer,* from Products order by ProductName

--PARTITION BY ILE GRUPLAMA
--select ROW_NUMBER() OVER(partition by KOLONADI1 order by KOLONADI2) indexer, * from [TabloAdi]
select ROW_NUMBER() OVER(partition by CategoryID order by UnitPrice) Indexer , * from Products