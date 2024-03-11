CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS salespersons;

CREATE TABLE invoices (
    id INT NOT NULL AUTO_INCREMENT,
    invoice_number INT,
    staff_id VARCHAR(10) NOT NULL,
    date DATE NOT NULL, 
    VIN VARCHAR(50) NOT NULL,
    customer_id INT NOT NULL, 
    PRIMARY KEY (id),
    INDEX (customer_id),
    INDEX (VIN),
    INDEX (staff_id)
);

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    customer_name VARCHAR(20) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    e_mail VARCHAR(50) NULL,
    address VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    zip_postal_code VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    index (customer_id)
);

CREATE TABLE cars (
    id INT NOT NULL AUTO_INCREMENT,
    VIN VARCHAR(50) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    index (VIN)
);

CREATE TABLE salespersons (
    id INT NOT NULL AUTO_INCREMENT,
    staff_id VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL,
    store_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    index (staff_id)
);



INSERT INTO customers (customer_id, customer_name, phone_number, address, city, state_province, country, zip_postal_code)
VALUES 
    (10001, 'Pablo Picasso', '+34636176382', 'Paseo de la Chopera 14', 'Madrid', 'Madrid', 'Spain', '28045'),
    (20001, 'Abraham Lincoln', '+13059077086','120 SW 8th St', 'Miami', 'Florida','United States','33130'),
    (30001, 'Napoléon Bonaparte','+33179754000','40 Rue du Colisée','Paris','Île-de-France','France','75008');

INSERT INTO cars (VIN, manufacturer, model, year, color) 
VALUES 
    ('K096I98581DHSNUP','Volkswagen','Tiguan',2019, 'Blue'),
    ('ZM8G7BEUQZ97IH46V','Peugeot', 'Rifter',2019,'Red'),
    ('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White'),
    ('HKNDGS7CU31E9Z7JW','Toyota', 'RAV4',2018,'Silver'),
    ('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray'),
    ('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');

INSERT INTO salespersons (staff_id, name, store_name)
VALUES 
    ('00001','Petey Cruiser','Madrid'),
    ('00002', 'Anna Sthesia', 'Barcelona'),
    ('00003', 'Paul Molive','Berlin'),
    ('00004', 'Gail Forcewind','Paris'),
    ('00005', 'Paige Turner', 'Miami'),
    ('00006', 'Bob Frapples', 'Mexico City'),
    ('00007', 'Walter Melon', 'Amsterdam'),
    ('00008', 'Shonda Leer', 'São Paulo');

INSERT INTO invoices (invoice_number, date, VIN, customer_id, staff_id)
VALUES 
    (852399038, '2018-08-22', 'K096I98581DHSNUP', 10001, '00003'),
    (731166526, '2018-12-31', 'RKXVNNIHLVVZOUB4M', 20001, '00005'),
    (271135104, '2019-01-22', 'ZM8G7BEUQZ97IH46V', 30001, '00007');
    

ALTER TABLE invoices ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE invoices ADD FOREIGN KEY (VIN) REFERENCES cars(VIN);
ALTER TABLE invoices ADD FOREIGN KEY (staff_id) REFERENCES salespersons(staff_id);
    
DELETE FROM cars
WHERE id = 4;

INSERT INTO customers (customer_name, e_mail)
VALUES 
    ('Pablo Picasso', 'ppicasso@gmail.com'),
    ('Abraham Lincoln', 'lincoln@us.gov'),
    ('Napoléon Bonaparte', 'hello@napoleon.me');