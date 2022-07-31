CREATE DATABASE MVN_PRO;

USE MVN_PRO;

CREATE TABLE IF NOT EXISTS employee (
       id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
     , fullname VARCHAR(50) NOT NULL
     , age INT 
     , email VARCHAR(50) NOT NULL
     , gender VARCHAR(20) NOT NULL
     , hobby VARCHAR(50) NOT NULL
     , country VARCHAR(50) NOT NULL
     , address VARCHAR(50) NOT NULL
    )
    ;
    