--mevcut zamani getirir.
select GETDATE()
--zaman ekler.
select DATEADD(DAY,365,GETDATE())
select DATEADD(MONTH,12,GETDATE())
select DATEADD(YEAR,1,GETDATE())
--aradaki farki hesaplar
select DATEDIFF(DAY,'05.10.2022',GETDATE())--UK date format
--zaman dilimindeki yeri hesaplar
select DATEPART(DAY,GETDATE())
select DATEPART(MONTH,GETDATE())
select DATEPART(DW,GETDATE())--haftanin 3.günü-sali.(LONDON)


