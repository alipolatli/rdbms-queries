--ALTER(SONRADAN - EKLEME ,GUNCELLEME,SILME) 
--alter [nesne] [nesnenin adi]
--(yapiya göre islemler)

--options 
alter database CustomDatabase
modify file
(
name='CD',
size=20
)
--kolon ekleme
alter table CustomTable1
add Country nvarchar(max)
--kolon tip güncelleme
alter table CustomTable1
alter column Country varchar(40)
--kolon silme 
alter table CustomTable1
drop column Country 
--constraint ekleme 
alter table CustomTable1
add constraint customConstraint default 'Bos' for Country
--constraint silme 
alter table CustomTable1
drop constraint customConstraint
--tablo ismi degisme
SP_RENAME 'CustomTable1','CustomTable'
--kolon ismi degisme
SP_RENAME 'CustomTable.Country','Countryy','column'


