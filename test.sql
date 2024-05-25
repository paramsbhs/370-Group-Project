CREATE DATABASE SportsDB;
USE SportsDB;
CREATE TABLE Sports (
    SportID INT PRIMARY KEY,
    SportName VARCHAR(128),
    Department VARCHAR(128)
);
SELECT * FROM Sports;

CREATE TABLE User (
	UserId INT PRIMARY KEY,
    Username VARCHAR(128)
);