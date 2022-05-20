select CompanyName,Region from Customers
-- CASE WHEN THEN ELSE END ile YONTEM1 
select CompanyName,
case
when Region is null then 'Bilinmiyor' 
else Region
end
from Customers

--COELESCE ile (birlestir) YONTEM2
select CompanyName,COALESCE(Region,'BILINMIYOR') As BOLGE from Customers
--ISNULL ile YONTEM3
select CompanyName,ISNULL(Region,'BILINMIYOR') As BOLGE from Customers

--NULLIF (ikinci parametre birinciye esitse null doner, degilse birinci parametre doner)
select NULLIF(1,2)
select NULLIF(1,1)
select ReorderLevel from Products 
select AVG(ReorderLevel) from Products 
--1.yol
select AVG(ReorderLevel) from Products  where ReorderLevel !=0
--2.yol
select AVG(NULLIF(ReorderLevel,0)) from Products

--veritabanindaki tablolari listeleme
select * from sys.tables








