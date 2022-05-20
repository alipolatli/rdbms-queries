--WHILE

declare @sayac int =1
while @sayac <100
begin 
print @sayac
set @sayac +=1
end

--WHILE ile BREAK
go 

declare @sayac int =1
while @sayac <100
begin
if @sayac =50
break
print @sayac
set @sayac +=1
end
go
--WHILE ile CONTINUE
declare @sayac int =1
while @sayac <100
begin
set @sayac +=1
if @sayac % 2 =0
continue
print @sayac
end
