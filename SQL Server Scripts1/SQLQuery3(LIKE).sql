--LIKE

--%=> ile baslar, ile biter, icerir. sonrasi/�ncesi �nemli degil.(�ok harf bazl?)
select * from Employees  where FirstName like 'A%'
select * from Employees  where FirstName like 'a%'
select * from Employees  where FirstName like 'Ann%'
select * from Employees  where FirstName like 'A%e'
select * from Employees  where FirstName like '%e'
select * from Employees  where FirstName like 'a%nn%e'

--_ => �nemli degil (tek harf bazli)
--ilk harfi �nemsiz ikinci harf a olan sonras? �nemsiz.
select * from Employees  where FirstName like '_a%'
--ilk harfi j 4.harfi e olan sonras? �nemsiz.
select * from Employees  where FirstName like 'j__e%'

--[]=> ya da 
--isminin bas harfi e ile t arasinda olanlar. a ve n dahil.
select * from Employees  where FirstName like '[a-n]%'

-- ^=>olumsuz
--ismiinin bas harfi n olmanyanlar.
select * from Employees  where FirstName like '[^n]%'




