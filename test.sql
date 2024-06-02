CREATE DATABASE SportsDB;
USE SportsDB;
CREATE TABLE if NOT EXISTS League (
    LeagueID INT PRIMARY KEY AUTO_INCREMENT,
    Sport VARCHAR(128)NOT NULL,
    Date VARCHAR(128) NOT NULL,
    Time VARCHAR(128) NOT NULL,
    EntryFee VARCHAR(128) NOT NULL,
    Prizes VARCHAR(128) NOT NULL
);

CREATE TABLE if NOT EXISTS Playoffs (
    PlayOffId INT PRIMARY KEY AUTO_INCREMENT,
    Sport VARCHAR(128) NOT NULL,
    TeamId VARCHAR(128) NOT NULL,
    Time VARCHAR(128) NOT NULL,
    Date VARCHAR(128) NOT NULL
);
CREATE TABLE if NOT EXISTS User (
    UserId INT PRIMARY KEY AUTO_INCREMENT,
    PhoneNumber VARCHAR(128) NOT NULL,
    Email VARCHAR(128) NOT NULL,
    FirstName VARCHAR(128) NOT NULL,
    LastName VARCHAR(128) NOT NULL
);

CREATE TABLE if NOT EXISTS SportEvent (
    EventId INT PRIMARY KEY AUTO_INCREMENT,
    UserId VARCHAR(128) NOT NULL,
    Sport VARCHAR(128) NOT NULL,
    Time VARCHAR(128) NOT NULL,
    Date VARCHAR(128) NOT NULL
);

CREATE TABLE if NOT EXISTS Team (
    TeamId INT PRIMARY KEY AUTO_INCREMENT,
    Sports VARCHAR(128) NOT NULL,
    MemberCount VARCHAR(128) NOT NULL,
    Requirements VARCHAR(128) NOT NULL,
    Ranking VARCHAR(128) NOT NULL
);

CREATE TABLE if NOT EXISTS UserTeam(
	UserId INT NOT NULL,
	TeamId INT NOT NULL,
    PRIMARY KEY (UserId, TeamId),
    FOREIGN KEY (UserId) REFERENCES User(UserId),
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);
    
CREATE TABLE if NOT EXISTS TeamLeague(
	TeamId INT NOT NULL,
    LeagueID INT NOT NULL,
	PRIMARY KEY (TeamId, LeagueId),
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId),
    FOREIGN KEY (LeagueID) REFERENCES League(LeagueId)
);
SELECT * FROM Sports;

INSERT INTO League (Sport, Date, Time, EntryFee, Prizes) VALUES
('Soccer', '2024-06-01', '15:00', '$100', 'Trophy'),
('Basketball', '2024-06-02', '16:00', '$150', 'Medal'),
('Tennis', '2024-06-03', '17:00', '$50', 'Cash'),
('Baseball', '2024-06-04', '18:00', '$200', 'Cup'),
('Hockey', '2024-06-05', '19:00', '$120', 'Medal'),
('Cricket', '2024-06-06', '20:00', '$90', 'Trophy'),
('Rugby', '2024-06-07', '21:00', '$80', 'Cup'),
('Football', '2024-06-08', '14:00', '$130', 'Cash'),
('Swimming', '2024-06-09', '13:00', '$70', 'Medal'),
('Volleyball', '2024-06-10', '12:00', '$110', 'Trophy');

INSERT INTO Playoffs (Sport, TeamId, Time, Date) VALUES
('Soccer', '1', '15:00', '2024-06-11'),
('Basketball', '2', '16:00', '2024-06-12'),
('Tennis', '3', '17:00', '2024-06-13'),
('Baseball', '4', '18:00', '2024-06-14'),
('Hockey', '5', '19:00', '2024-06-15'),
('Cricket', '6', '20:00', '2024-06-16'),
('Rugby', '7', '21:00', '2024-06-17'),
('Football', '8', '14:00', '2024-06-18'),
('Swimming', '9', '13:00', '2024-06-19'),
('Volleyball', '10', '12:00', '2024-06-20');

INSERT INTO User (PhoneNumber, Email, FirstName, LastName) VALUES
('1234567890', 'john.doe@example.com', 'John', 'Doe'),
('0987654321', 'jane.smith@example.com', 'Jane', 'Smith'),
('5556667777', 'alice.jones@example.com', 'Alice', 'Jones'),
('4445556666', 'bob.brown@example.com', 'Bob', 'Brown'),
('3334445555', 'carol.wilson@example.com', 'Carol', 'Wilson'),
('2223334444', 'dave.moore@example.com', 'Dave', 'Moore'),
('1112223333', 'eve.taylor@example.com', 'Eve', 'Taylor'),
('9998887777', 'frank.hall@example.com', 'Frank', 'Hall'),
('8887776666', 'grace.lee@example.com', 'Grace', 'Lee'),
('7776665555', 'henry.white@example.com', 'Henry', 'White');

INSERT INTO SportEvent (UserId, Sport, Time, Date) VALUES
(1, 'Soccer', '15:00', '2024-06-01'),
(2, 'Basketball', '16:00', '2024-06-02'),
(3, 'Tennis', '17:00', '2024-06-03'),
(4, 'Baseball', '18:00', '2024-06-04'),
(5, 'Hockey', '19:00', '2024-06-05'),
(6, 'Cricket', '20:00', '2024-06-06'),
(7, 'Rugby', '21:00', '2024-06-07'),
(8, 'Football', '14:00', '2024-06-08'),
(9, 'Swimming', '13:00', '2024-06-09'),
(10, 'Volleyball', '12:00', '2024-06-10');

INSERT INTO Team (Sports, MemberCount, Requirements, Rank) VALUES
('Soccer', '11', 'Experienced', '1'),
('Basketball', '5', 'Professional', '2'),
('Tennis', '2', 'Amateur', '3'),
('Baseball', '9', 'Experienced', '4'),
('Hockey', '6', 'Professional', '5'),
('Cricket', '11', 'Amateur', '6'),
('Rugby', '15', 'Experienced', '7'),
('Football', '11', 'Professional', '8'),
('Swimming', '4', 'Amateur', '9'),
('Volleyball', '6', 'Experienced', '10');

INSERT INTO UserTeam (UserId, TeamId) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

INSERT INTO TeamLeague (TeamId, LeagueID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);
