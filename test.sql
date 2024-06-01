CREATE DATABASE SportsDB;
USE SportsDB;
CREATE TABLE League (
    LeagueID INT PRIMARY KEY,
    Sport VARCHAR(128),
    Date VARCHAR(128),
    Time VARCHAR(128),
    EntryFee VARCHAR(128),
    Prizes VARCHAR(128)
);

CREATE TABLE Playoffs (
    PlayOffId INT PRIMARY KEY,
    Sport VARCHAR(128),
    TeamId VARCHAR(128),
    Time VARCHAR(128),
    Date VARCHAR(128)
);
CREATE TABLE User (
    UserId INT PRIMARY KEY,
    PhoneNumber VARCHAR(128),
    Email VARCHAR(128),
    FirstName VARCHAR(128),
    LastName VARCHAR(128)
);

CREATE TABLE SportEvent (
    EventId INT PRIMARY KEY,
    UserId VARCHAR(128),
    Sport VARCHAR(128),
    Time VARCHAR(128),
    Date VARCHAR(128)
);

CREATE TABLE Team (
    TeamId INT PRIMARY KEY,
    Sports VARCHAR(128),
    MemberCount VARCHAR(128),
    Requirements VARCHAR(128),
    Rank VARCHAR(128)
);
SELECT * FROM Sports;

CREATE TABLE User (
	UserId INT PRIMARY KEY,
    Username VARCHAR(128)
);