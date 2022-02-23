DROP TABLE companies; 
CREATE TABLE companies
(
company_id INT auto_increment,
headquarters_phone_number VARCHAR(255),
company_name VARCHAR(255) NOT NULL,
primary key (company_id)
);

/*To drop NOT NULL*/ 

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

/*To add NOT NULL to a pre-existing table*/  

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;