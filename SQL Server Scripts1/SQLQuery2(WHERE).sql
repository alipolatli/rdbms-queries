--WHERE

select * from Employees

select * from  Employees where City ='London'

select * from  Employees where ReportsTo<5

select * from  Employees where City ='London' and TitleOfCourtesy ='Mr.'

select * from  Employees where Country ='USA' or TitleOfCourtesy ='Ms.'

select * from  Employees where EmployeeID =4

select * from  Employees where EmployeeID <> 4

select * from  Employees where EmployeeID >= 4

select * from  Employees where DAY(BirthDate) =08

--BETWEEN
select * from  Employees where YEAR(HireDate) >1950 and  YEAR(HireDate) < 1993
select * from Employees where YEAR(BirthDate) between 1950 and 1965 

--IN
select * from  Employees where Country ='USA' or Country ='UK'
select * from Employees where Country in('USA','UK')
















