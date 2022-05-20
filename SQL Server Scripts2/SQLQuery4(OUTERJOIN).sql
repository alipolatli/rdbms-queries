--OUTER JOIN
--hepsini getirir, eslesmeyen null gelir.
--LEFT JOIN
--soldaki tamami, sagdaki eslesmeyen null
select * from Employees E left join Orders O on E.EmployeeID = O.EmployeeID inner join [Order Details] OD 
on OD.OrderID = O.OrderID
--RIGHT JOIN
--sagdaki tamami, soldaki eslesmeyen null
select * from  Orders O right join Employees E on E.EmployeeID = O.EmployeeID inner join [Order Details] OD 
on OD.OrderID = O.OrderID
--FULL JOIN 
--ikisinin de tamami,eslesmeyenler null
select * from  Orders O full join Employees E on E.EmployeeID = O.EmployeeID inner join [Order Details] OD 
on OD.OrderID = O.OrderID

--CROSS JOIN
--iki tablo aras?nda kartezyen carpimi yapar. PEK KULLANILMAZ.
select Count(*) from Categories
select Count(*) from Products

select Count(*) from Categories cross join Products






