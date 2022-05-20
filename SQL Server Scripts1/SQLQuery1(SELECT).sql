use Northwind
--SELECT

select 'Kemal'

print 'Kemal'

select * from Categories

select CategoryID, CategoryName from Categories

select FirstName +'' +LastName [Employee FullName] from  Employees

select FirstName +' - ' + LastName + ' - '+CAST(BirthDate as nvarchar) [Employee Basic] from  Employees

