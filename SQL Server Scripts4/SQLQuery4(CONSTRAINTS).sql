--CONSTRAINTS
create database InfoBlog
create table Users
(
Id int primary key identity(1,1),
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
City nvarchar(50),
Country nvarchar(50),
Email nvarchar(20) unique,
)
--null gelirse default deger atar

add constraint CityConstraint default 'Belirtilmemis' for City
--uniqueidentifier veri tipi (guid)
alter table Users
add CustomId uniqueidentifier
alter table Users
--genel olarak deger kisitlamasi yapar. yas isim vs.
alter table Users
add constraint AgeConstraint check (Age >= 18)
--foreign key
create table Employees
(
Id int primary key identity(1,1),
UserId int unique,
HireDate datetime default GETDATE()
foreign key (UserId) references Users(Id)
)
--sonradan ekleme icin
alter table Employees
add constraint AddForeignKey foreign key (UserId) references Users(Id)

--silme güncelleme konfigurasyonu degisme 
--CASCADE (ana tablodan veri silindiginde bagli tablolar silinir veya güncellenir.) 
alter table Employees
add constraint AddForeignKey foreign key (UserId) references Users(Id)
on delete cascade
on update cascade

--SET NULL (ana tablodan veri silindiginde bagli tablolardakiler null atanir.)
alter table Employees
add constraint AddForeignKey foreign key (UserId) references Users(Id)
on delete set null
on update set null

--SET DEFAULT (ana tablodan veri silindiginde bagli tablolardakiler default constraint'te verieln deger  atanir.)
alter table Employees
add constraint AddForeignKey foreign key (UserId) references Users(Id)
on delete set default
on update set default	



