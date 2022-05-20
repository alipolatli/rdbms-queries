--STRING FONKSIYONLAR

select * from Employees
--soldan iki harf.
select LEFT(LastName,2)  from Employees
--sagdan iki harf.
select RIGHT(LastName,2)  from Employees
--büyült.
select UPPER(LastName)  from Employees
--küçült.
select LOWER(LastName)  from Employees
--belirtilen degerden (SIRA NUMARASINDAN) baslar, belirtilen degerde karakter.
select SUBSTRING('kemal',2,2) 
select SUBSTRING(LastName,1,2)  from Employees
--bosluklari keser.
select '             KEMAL'
select LTRIM('             KEMAL')
--ters çevirir.
select REVERSE(LastName)  from Employees
--belirtilen ifadeyi, belirtlilen ifade ile degisir.
select REPLACE('Ahmet','hm','AA')  from Employees
--index numarasi verir, ilk buldugu.
select FirstName, CHARINDEX('a',FirstName) IndexNum from Employees



--bosluga kadar olan karakterleri alma algoritmasi.
select SUBSTRING(Title, 0 , CHARINDEX(' ',Title)) from Employees
select SUBSTRING(Title, 1 , CHARINDEX(' ',Title)) from Employees

--bosluktan sonraki karakterleri alma algoritmasi.
select SUBSTRING(Title,CHARINDEX(' ',Title), LEN(Title)) from Employees













