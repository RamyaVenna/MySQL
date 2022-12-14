## User management is crucial when we want to give database access to others without granting them full control. 
## this tutorial explains on how to write code for creating new users, grant privileges and drop users without using Adminstration section 	 

## to view existing users
select user from mysql.user;

## Creating a new user
create user ramya@localhost identified by 'brownie'; 		

## granting few privileges to new users
grant select, create, update on *.* to ramya@localhost;

## granting all privileges to new users
grant all privileges on *.* to ramya@localhost;

## To view the existing privileges to a user
show grants for ramya@localhost;

## to disable all privileges 
flush  privileges; 

## creating user with 'if not exists' command 
create user if not exists sqlprac_localhost identified by 'burger';

## to get to know the current user 
select user();
## or
select current_user();

## changing user account password
use mysql;
alter user ramya@localhost identified by 'hurricane';
flush privileges;

## how to remove user and finally check whether the user is removed from the list
drop user sqlprac_localhost;
select user from mysql.user;    


