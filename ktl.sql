DROP DATABASE IF EXISTS `KTL`;
CREATE DATABASE `KTL`;

USE `KTL`;

CREATE TABLE employee (
 employee_no int UNSIGNED PRIMARY KEY,
 name varchar(100) NOT NULL,
 home_address varchar(100) NOT NULL,
 salary decimal NOT NULL,
 date_of_birth date NOT NULL,
 nin char(9) NOT NULL,
 dept_no int UNSIGNED NOT NULL
);

CREATE TABLE department (
 dept_no int UNSIGNED PRIMARY KEY,
 name varchar(100) NOT NULL,
 manager_no int UNSIGNED NOT NULL,
 no_of_employees int UNSIGNED NOT NULL,
 head_office_location varchar(100) NOT NULL
);

ALTER TABLE department
ADD FOREIGN KEY(manager_no) REFERENCES employee(employee_no);

ALTER TABLE employee
ADD FOREIGN KEY(dept_no) REFERENCES department(dept_no);

CREATE TABLE train_driver (
 employee_no int UNSIGNED PRIMARY KEY,
 hours_per_week int UNSIGNED NOT NULL,
 FOREIGN KEY (employee_no) REFERENCES employee(employee_no)
);

CREATE TABLE complaint (
 complaint_no int UNSIGNED PRIMARY KEY,
 date_of_complaint date NOT NULL,
 passenger_name varchar(100) NOT NULL,
 reason varchar(3000) NOT NULL,
 hr_staff_no int UNSIGNED,
 FOREIGN KEY(hr_staff_no) REFERENCES employee(employee_no)
);

CREATE TABLE train (
 train_id varchar(10) PRIMARY KEY,
 name varchar(100) NOT NULL,
 no_of_carriages int UNSIGNED NOT NULL
);

CREATE TABLE station (
 station_name varchar(100) PRIMARY KEY,
 location varchar(100) NOT NULL
);

CREATE TABLE route (
 route_name char(7) PRIMARY KEY,
 start_station varchar(100) NOT NULL,
 end_station varchar(100) NOT NULL,
 FOREIGN KEY (start_station) REFERENCES station(station_name),
 FOREIGN KEY (end_station) REFERENCES station(station_name)
);

CREATE TABLE booking (
 booking_id int UNSIGNED PRIMARY KEY,
 passenger_name varchar(100) NOT NULL,
 route_name char(7) NOT NULL,
 train_id varchar(10) NOT NULL,
 cost decimal NOT NULL,
 FOREIGN KEY (route_name) REFERENCES route(route_name),
 FOREIGN KEY (train_id) REFERENCES train(train_id)
);