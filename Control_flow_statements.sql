-- Control flow statements
-- If() 

select if ( 500>1000, 'yes', 'no');

select if(strcmp('Ramya', 'r@mya')= 0, 'correct', 'wrong');

-- Using the function on the employee table 
use sql_tutorial;
select * from employee;

select name, if (sum(working_hours) > 12, 'Remarkable', 'un-remarkable')
as emp_status
from employee
group by name;

-- IFNULL () function
-- The IFNULL function accepts two expressions, and if the first expression is not null, it returns the first arguments. 
-- If the first expression is null, it returns the second argument. 

select ifnull(0,23);

select ifnull(-215, 'abc');

select ifnull(null, 25);

-- NULLIF () function
-- The NULLIF function accepts two expressions, and if the first expression is equal to the second expression, it returns the NULL. Otherwise, it returns the first expression.
-- It is used to prevent division by zero error.

select nullif ('Hello', '1011');
select nullif ('Hello', 'hello'); -- it is not case sensitive
select 1/nullif(0,0);

-- CASE function
-- to write if else or if then else statements

## searched case statement : this method takes a value before and matches with the given statement

select case 2 
when 1 then 'One' when 2 then 'Two' else 'try again' end;

select case 10 
when 1 then 'One' when 2 then 'Two' else 'try again' end;

-- searched case
select case binary 'b' when 'a' then 1 when 'b' then '2' end;  -- this is case sensitive as 'b' is different from 'B'

-- Using CASE function on a table
use project_1;
show tables;
select * from inflation_data_2021;

select `PIN Code`, `Age group`, 
case `Gender Of Respondent`
when 'Male' then 'M'
when 'Female' then 'F'
else 'other'
end as Gender 
from inflation_data_2021;
//
-- IF ELSE clause
-- This is generally used in stored procedures that implement basic conditional constuct in MySQL. 

delimiter //
create procedure myResult(original_rate numeric(5,2), out discount_rate numeric(5,2))
no SQL
begin
if (original_rate >=500) then
set discount_rate= original_rate*0.05;
elseif original_rate between 300 and 500 then
set discount_rate= original_rate*0.08;
else 
set discount_rate=original_rate;
end if;
select discount_rate;
end//
delimiter ;

set @p = 350;
set @dp = 0;
call myResult(@p,@dp);
