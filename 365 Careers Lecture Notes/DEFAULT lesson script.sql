CREATE TABLE customers
(
customer_id INT AUTO_INCREMENT,
first_name VARCHAR(255),
last_name VARCHAR(255),
email_address VARCHAR(255),
number_of_complaints INT Default 0,
PRIMARY KEY (customer_id)
);

'Or you can alter the table' 

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT default 0;

'To drop the default'

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT; 