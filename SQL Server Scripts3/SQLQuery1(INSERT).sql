--DML (DATA MANIPULATION LANGUAGE)
--select,insert,update,delete

--INSERT
--insert [TabloAdi](Kolonlar) Values	
insert Employees(FirstName,LastName,Country,City) values('Ali','Polatli','Turkey','Yalova')

--into da kullan?labilir, eskidir.
insert into Employees(FirstName,LastName,Country,City) values('Aliye','Polatsiz','Turkey','Yalova')

--PRATIK KULANIM
insert Employees(FirstName,LastName) values ('Kemalettin','Günebakan'), ('Ahmet','Günebakmayan')

--kolon belirtmeden(full doldurulmasi gerekir, null olsa bile.)
insert Employees values ('Ali','Polatli','Developer','kl.','21.10.1999',GETDATE(),'BahceliEvler','Yalova',
'Marmara','35290','Turkey','(206) 555-9857','850',null,null,null,null,null)

--farkli tablodan mevcut tabloya veri cekmek. kolon adedi esdeger olmali
insert FormalNames select FirstName,LastName from Employees

--farkli tablodan yeni tablo olusturma(yeni tablo olusturur , kolon ve sat?rlara deger atar) //primay-foreign kullanilamaz.
select FirstName, LastName,Title,Country into SmallEmployess from Employees







