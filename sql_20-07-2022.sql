CREATE TABLE employee_list(
	employee_id	INT NOT NULL AUTO_INCREMENT,
	employee_name	VARCHAR(22) NOT NULL,
	employee_phone	VARCHAR(10) NOT NULL,
	employee_field	VARCHAR(10) NOT NULL,
	employee_dob	DATE,
	PRIMARY KEY(employee_id)
)

DROP TABLE employee_list;

INSERT INTO employee_list ( employee_name, employee_phone, employee_field, employee_dob) VALUES ("Akhil", "9999955555","IT", NOW()),
												("Suraj", "8888884444", "CT", NOW());

select * from employee_list;
select employee_name from employee_list;
select CONCAT('AKHIL','BHAT') AS "fULLnAME";

UPDATE employee_list SET employee_name = "Saxena" WHERE employee_id = 2;

DELETE FROM employee_list WHERE employee_id = 4;

RENAME TABLE old_table_name To new_table_name;

RENAME TABLE employee_list to Prodaptian;
RENAME TABLE Prodaptian to employee_list;

ALTER TABLE table_name
ADD
	nEW_column_name column_DATA_TYPE;

Alter table employee_list
ADD
	employee_project VARCHAR(15);

DESCRIBE employee_list;

------Modify column data type----
ALTER TABLE employee_list
	MODIFY employee_project VARCHAR(55) NOT NULL;
-----Rename column name----------
ALTER TABLE employee_list
	CHANGE COLUMN employee_project e_p INT NOT NULL;

ALTER TABLE employee_list
	DROP COLUMN col_name;


--------relations------------
CREATE TABLE projects(
	Pid INT NOT NULL,
	Eid  INT NOT NULL,
	Pname varchar(20) not null,
	PRIMARY KEY(Pid),
	CONSTRAINT FK_P FOREIGN KEY(Eid) REFERENCES employee_list(employee_id)
)

ALTER TABLE projects
ADD CONSTRAINT FK_P FOREIGN KEY(Eid) REFERENCES employee_list(employee_id)

ALTER TABLE projects DROP CONSTRAINT FK_P;

SELECT * employees
order by jobTitle desc;


-----orderdetails table-----
SELECT 
	orderNumber,
	orderLineNumber,
	quantityOrdered * priceEach AS subtotal
FROM
	orderdetails
Order BY
	subtotal DESC;


-------field---------------

select
	orderNumber, status 
from 
	orders
order by Field(status,
	"processing",
	"delivered"
);



-------------
select 
	firstname, lastname, reportto
from
	employees
order by 
	reportto desc;

----------------------------------------

select
	firstName,
	lastName,
	jobTitle
From
	employees
Where
	jobTitle = "Sales Rep"

--------------------------------------

select
	firstName,
	lastName,
	jobTitle
From
	employees
Where
	jobTitle = "Sales Rep" AND officeCode =1;
------------------------------------------

select
	firstName,
	lastName,
	jobTitle,
	officeCode
From
	employees
Where
	jobTitle = "Sales Rep" OR officeCode =1
ORDER BY 
	officeCode,
	jobTitle;


------------------------------------------

select
	firstName,
	lastName,
	jobTitle,
	officeCode
From
	employees
Where
	officeCode BETWEEN 1 AND 3
ORDER BY officeCode;


----------LIKE clause--------------------

-- "Tho%"
-- "%son"
-- "r%"
-- "a_%"
-- "a__%"
-- "t%n"
----------In Operator-----------------

select
	firstName,
	lastName,
	officeCode
From
	employees
Where
	officeCode IN (1,2,3)
ORDER BY officeCode;












