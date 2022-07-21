--Select field_name from table_name limit [offset,] rowcount;

-- SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit DESC LIMIT 5;
-- SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit,customerNumber LIMIT 5;

-- --below code returns queries of 20 to 30
-- SELECT customerNumber, customerName FROM customers ORDER BY customerName LIMIT 20, 10;

-- select DISTINCT state fROM CUSTOMERS WHERE state IS NOT NULL;

-- select CONCAT_WS(', ', lastName, firstName) AS 'Full Name' FROM employees;

-- select orderNumber AS `Order no.`, SUM(priceEach*quantityOrdered) AS Total FROM orderdetails GROUP BY `Order no.` HAVING Total > 60000;

-- SELECT customers.customerNumber, customers.customerName, payments.amount from customers INNER JOIN payments ON customers.customerNumber = payments.customerNumber;
-- SELECT c.customerNumber, c.customerName, p.amount from customers AS c INNER JOIN payments AS p USING(customerNumber);
 
-- SELECT CONCAT(m.lastName, ', ', m.firstName) AS Manager, CONCAT (e.lastName, ', ', e.firstName) AS 'Direct report' FROM employees e INNER JOIN employees m ON m.employeeNumber = e.reportsTo ORDER BY Manager;

DROP DATABASE IF EXISTS u_project_b;
CREATE DATABASE u_project_b;
USE u_project_b;

CREATE TABLE user(
	id INT AUTO_INCREMENT,
	media_id INT ,
	name VARCHAR(45) NOT NULL,
	PRIMARY KEY(id)
);


CREATE TABLE project(
	id INT AUTO_INCREMENT,
	name VARCHAR(45) NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE project_has_user(
	project_id INT,
	user_id INT,
	manager TINYINT(1),
	PRIMARY KEY (project_id, user_id)
);


CREATE TABLE media(
	id INT AUTO_INCREMENT,
	user_id INT,
	path VARCHAR(70) NOT NULL,
	filetype VARCHAR(20),
	filesize DECIMAL(65,2),
	PRIMARY KEY(id)	
);
	


CREATE TABLE comment(
	id INT AUTO_INCREMENT,
	bug_project_id INT,
	bug_id INT,
	text TEXT,
	PRIMARY KEY(id)
);


CREATE TABLE bug(
	id INT AUTO_INCREMENT,
	project_id INT,
	name VARCHAR(45) NOT NULL,
	PRIMARY KEY(id)
);



CREATE TABLE bug_has_media(
	bug_id INT,
	bug_project_id INT,
	media_id INT,
	PRIMARY KEY(bug_id, bug_project_id, media_id)
);

CREATE TABLE comment_has_media(
	comment_id INT,
	comment_bug_project_id INT,
	comment_bug_id INT,
	media_id INT,
	PRIMARY KEY(comment_id, comment_bug_project_id, comment_bug_id, media_id)
);

ALTER TABLE user
ADD CONSTRAINT user_fk_media FOREIGN KEY (media_id) References media(id);

ALTER TABLE project_has_user
ADD constraint project_fk_project FOREIGN KEY (project_id) REFERENCES project(id),
ADD constraint project_fk_user FOREIGN KEY (user_id) REFERENCES user(id);

ALTER TABLE media
ADD Constraint media_fk_user FOREIGN KEY(user_id) REFERENCES user(id);

ALTER TABLE comment
ADD CONSTRAINT comment_fk_project FOREIGN KEY (bug_project_id) REFERENCES project(id),
ADD CONSTRAINT comment_fk_bug FOREIGN KEY (bug_id) REFERENCES bug(id);

ALTER TABLE bug
ADD CONSTRAINT bug_fk_project FOREIGN KEY (project_id) REFERENCES project(id);

ALTER TABLE bug_has_media
ADD Constraint bug_has_media_fk_bug_id FOREIGN KEY(bug_id) REFERENCES bug(id),
ADD Constraint bug_has_media_fk_bug_project_id FOREIGN KEY(bug_project_id) REFERENCES project(id),
ADD Constraint bug_has_media_fk_media_id FOREIGN KEY(media_id) REFERENCES media(id);

ALTER TABLE comment_has_media
ADD Constraint Comment_has_media_fk_comment_id FOREIGN KEY(comment_id) REFERENCES comment(id),
ADD Constraint Comment_has_media_fk_comment_bug_project_id FOREIGN KEY(comment_bug_project_id) REFERENCES project(id),
ADD Constraint Comment_has_meSdia_fk_comment_bug_id FOREIGN KEY(comment_bug_id) REFERENCES bug(id),
ADD Constraint Comment_has_media_fk_media_id FOREIGN KEY(media_id) REFERENCES media(id);

