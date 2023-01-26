CREATE DATABASE juejin_person;
USE juejin_person;

CREATE TABLE admin
(
	id       INT PRIMARY KEY AUTO_INCREMENT,
	name     VARCHAR(255) NOT NULL,
	email    VARCHAR(255) NOT NULL,
	password CHAR(32)     NOT NULL
);

CREATE TABLE role
(
	id       INT PRIMARY KEY,
	is_super TINYINT(1) NOT NULL,
	is_front TINYINT(1) NOT NULL,
	is_audit TINYINT(1) NOT NULL,
	FOREIGN KEY (id) REFERENCES admin (id)
);

CREATE TABLE user
(
	id       INT PRIMARY KEY AUTO_INCREMENT,
	name     VARCHAR(255) NOT NULL,
	email    VARCHAR(255) NOT NULL,
	password CHAR(32)     NOT NULL
);

CREATE TABLE permission
(
	id        INT PRIMARY KEY,
	is_allow  TINYINT(1) NOT NULL,
	is_author TINYINT(1) NOT NULL,
	FOREIGN KEY (id) REFERENCES user (id)
);