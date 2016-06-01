CREATE function [dbo].[function_getAge] (@DOB datetime)
returns int
as
begin
declare @year int , @age int;
select @year = DATEDIFF(year,@DOB,getdate())-
               case when ((month(@DOB) > month(GETDATE())) or ((month(getDate())=month(@DOB)) and (DAY(@DOB)>day(GETDATE()))))
			   then 1 else 0
			   end
			   return @year;
			   end