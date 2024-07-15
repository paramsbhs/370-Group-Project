CREATE DATABASE SportsDB;
USE SportsDB;

CREATE TABLE IF NOT EXISTS League (
    LeagueId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sport VARCHAR(128) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    EntryFee DECIMAL(10, 2) NOT NULL CHECK (EntryFee >= 0),
    Prizes VARCHAR(128) NOT NULL,
    UNIQUE(Sport, Date, Time) -- Ensuring no two leagues can have the same sport at the same time
);

CREATE TABLE IF NOT EXISTS Playoffs (
    PlayOffId INT PRIMARY KEY AUTO_INCREMENT,
    Sport VARCHAR(128) NOT NULL,
    Team1Id INT NOT NULL,
    Team2Id INT NOT NULL,
    DateTime DATETIME NOT NULL,
    FOREIGN KEY (Team1Id) REFERENCES Team(TeamId),
    FOREIGN KEY (Team2Id) REFERENCES Team(TeamId),
    CHECK (Team1Id != Team2Id) -- A team cannot play against itself
);

CREATE TABLE if NOT EXISTS User (
    UserId INT PRIMARY KEY AUTO_INCREMENT,
    PhoneNumber VARCHAR(128) NOT NULL,
    Email VARCHAR(128) NOT NULL,
    FirstName VARCHAR(128) NOT NULL,
    LastName VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS SportEvent (
    EventId INT PRIMARY KEY AUTO_INCREMENT,
    UserId INT NOT NULL,
    Sport VARCHAR(128) NOT NULL,
    Time TIME NOT NULL,
    Date DATE NOT NULL,
    FOREIGN KEY (UserId) REFERENCES User(UserId),
    UNIQUE(UserId, Sport, Date, Time) -- Ensuring a user cannot create multiple events for the same sport at the same time
);

CREATE TABLE IF NOT EXISTS Team (
    TeamId INT PRIMARY KEY AUTO_INCREMENT,
    Sports VARCHAR(128) NOT NULL,
    MemberCount INT NOT NULL CHECK (MemberCount >= 1),
    Requirements VARCHAR(128) NOT NULL,
    Ranking INT NOT NULL CHECK (Ranking >= 1 AND Ranking <= 100), -- Assuming ranking is between 1 and 100
    TeamName VARCHAR(128) NOT NULL UNIQUE
);


CREATE TABLE if NOT EXISTS UserTeam(
	UserId INT NOT NULL,
	TeamId INT NOT NULL,
    PRIMARY KEY (UserId, TeamId),
    FOREIGN KEY (UserId) REFERENCES User(UserId),
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId)
);
    
CREATE TABLE IF NOT EXISTS TeamLeague(
    TeamId INT NOT NULL,
    LeagueId INT NOT NULL,
    PRIMARY KEY (TeamId, LeagueId),
    FOREIGN KEY (TeamId) REFERENCES Team(TeamId),
    FOREIGN KEY (LeagueId) REFERENCES League(LeagueId)
);



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
('Volleyball', '2024-06-10', '12:00', '$110', 'Trophy'),
('Golf', '2024-06-11', '15:00', '$100', 'Trophy'),
('Athletics', '2024-06-12', '16:00', '$150', 'Medal'),
('Cycling', '2024-06-13', '17:00', '$50', 'Cash'),
('Boxing', '2024-06-14', '18:00', '$200', 'Cup'),
('Wrestling', '2024-06-15', '19:00', '$120', 'Medal'),
('Table Tennis', '2024-06-16', '20:00', '$90', 'Trophy'),
('Badminton', '2024-06-17', '21:00', '$80', 'Cup'),
('Squash', '2024-06-18', '14:00', '$130', 'Cash'),
('Martial Arts', '2024-06-19', '13:00', '$70', 'Medal'),
('Skating', '2024-06-20', '12:00', '$110', 'Trophy'),
('Skiing', '2024-06-21', '15:00', '$100', 'Trophy'),
('Snowboarding', '2024-06-22', '16:00', '$150', 'Medal'),
('Surfing', '2024-06-23', '17:00', '$50', 'Cash'),
('Kayaking', '2024-06-24', '18:00', '$200', 'Cup'),
('Canoeing', '2024-06-25', '19:00', '$120', 'Medal'),
('Rowing', '2024-06-26', '20:00', '$90', 'Trophy'),
('Archery', '2024-06-27', '21:00', '$80', 'Cup'),
('Fencing', '2024-06-28', '14:00', '$130', 'Cash'),
('Horse Riding', '2024-06-29', '13:00', '$70', 'Medal'),
('Gymnastics', '2024-06-30', '12:00', '$110', 'Trophy'),
('Handball', '2024-07-01', '15:00', '$100', 'Trophy'),
('Lacrosse', '2024-07-02', '16:00', '$150', 'Medal'),
('Polo', '2024-07-03', '17:00', '$50', 'Cash'),
('Softball', '2024-07-04', '18:00', '$200', 'Cup'),
('Squash', '2024-07-05', '19:00', '$120', 'Medal'),
('Triathlon', '2024-07-06', '20:00', '$90', 'Trophy'),
('Water Polo', '2024-07-07', '21:00', '$80', 'Cup'),
('Weightlifting', '2024-07-08', '14:00', '$130', 'Cash'),
('Wrestling', '2024-07-09', '13:00', '$70', 'Medal'),
('Judo', '2024-07-10', '12:00', '$110', 'Trophy'),
('Karate', '2024-07-11', '15:00', '$100', 'Trophy'),
('Kickboxing', '2024-07-12', '16:00', '$150', 'Medal'),
('Taekwondo', '2024-07-13', '17:00', '$50', 'Cash'),
('Skateboarding', '2024-07-14', '18:00', '$200', 'Cup'),
('Mountain Biking', '2024-07-15', '19:00', '$120', 'Medal'),
('Rock Climbing', '2024-07-16', '20:00', '$90', 'Trophy'),
('Bouldering', '2024-07-17', '21:00', '$80', 'Cup'),
('Speed Climbing', '2024-07-18', '14:00', '$130', 'Cash'),
('Figure Skating', '2024-07-19', '13:00', '$70', 'Medal'),
('Ice Hockey', '2024-07-20', '12:00', '$110', 'Trophy');

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

INSERT INTO Team (Sports, MemberCount, Requirements, Ranking, TeamName) VALUES
-- Insert teams for Soccer
('Soccer', 11, 'Uniform, Cleats', 1, 'Soccer Strikers'),
('Soccer', 11, 'Uniform, Cleats', 2, 'Goal Getters'),
('Soccer', 11, 'Uniform, Cleats', 3, 'Field Fighters'),
('Soccer', 11, 'Uniform, Cleats', 4, 'Net Navigators'),
('Soccer', 11, 'Uniform, Cleats', 5, 'Penalty Pros'),
('Soccer', 11, 'Uniform, Cleats', 6, 'Kick Kings'),
('Soccer', 11, 'Uniform, Cleats', 7, 'Turf Titans'),
('Soccer', 11, 'Uniform, Cleats', 8, 'Soccer Stars'),

-- Insert teams for Basketball
('Basketball', 5, 'Uniform, Basketball Shoes', 1, 'Hoop Heroes'),
('Basketball', 5, 'Uniform, Basketball Shoes', 2, 'Basketball Bouncers'),
('Basketball', 5, 'Uniform, Basketball Shoes', 3, 'Court Crusaders'),
('Basketball', 5, 'Uniform, Basketball Shoes', 4, 'Net Knights'),
('Basketball', 5, 'Uniform, Basketball Shoes', 5, 'Slam Dunkers'),
('Basketball', 5, 'Uniform, Basketball Shoes', 6, 'Dribble Dynamos'),
('Basketball', 5, 'Uniform, Basketball Shoes', 7, 'Basketball Beasts'),
('Basketball', 5, 'Uniform, Basketball Shoes', 8, 'Fast Breakers'),

-- Insert teams for Tennis
('Tennis', 5, 'Racket, Tennis Shoes', 1, 'Tennis Titans'),
('Tennis', 5, 'Racket, Tennis Shoes', 2, 'Serve Smashers'),
('Tennis', 5, 'Racket, Tennis Shoes', 3, 'Court Commanders'),
('Tennis', 5, 'Racket, Tennis Shoes', 4, 'Volley Vipers'),
('Tennis', 5, 'Racket, Tennis Shoes', 5, 'Net Navigators'),
('Tennis', 5, 'Racket, Tennis Shoes', 6, 'Backhand Bandits'),
('Tennis', 5, 'Racket, Tennis Shoes', 7, 'Ace Aces'),
('Tennis', 5, 'Racket, Tennis Shoes', 8, 'Baseline Battlers'),

-- Insert teams for Baseball
('Baseball', 9, 'Uniform, Glove', 1, 'Home Run Heroes'),
('Baseball', 9, 'Uniform, Glove', 2, 'Diamond Dominators'),
('Baseball', 9, 'Uniform, Glove', 3, 'Batting Beasts'),
('Baseball', 9, 'Uniform, Glove', 4, 'Pitching Pros'),
('Baseball', 9, 'Uniform, Glove', 5, 'Fielding Fighters'),
('Baseball', 9, 'Uniform, Glove', 6, 'Slugging Stars'),
('Baseball', 9, 'Uniform, Glove', 7, 'Catch Kings'),
('Baseball', 9, 'Uniform, Glove', 8, 'Base Busters'),

-- Insert teams for Hockey
('Hockey', 6, 'Uniform, Skates', 1, 'Ice Invaders'),
('Hockey', 6, 'Uniform, Skates', 2, 'Puck Protectors'),
('Hockey', 6, 'Uniform, Skates', 3, 'Goal Guardians'),
('Hockey', 6, 'Uniform, Skates', 4, 'Skating Stars'),
('Hockey', 6, 'Uniform, Skates', 5, 'Hockey Heroes'),
('Hockey', 6, 'Uniform, Skates', 6, 'Rink Rulers'),
('Hockey', 6, 'Uniform, Skates', 7, 'Net Navigators'),
('Hockey', 6, 'Uniform, Skates', 8, 'Ice Kings'),

-- Insert teams for Cricket
('Cricket', 11, 'Uniform, Bat', 1, 'Wicket Warriors'),
('Cricket', 11, 'Uniform, Bat', 2, 'Batting Brawlers'),
('Cricket', 11, 'Uniform, Bat', 3, 'Bowling Beasts'),
('Cricket', 11, 'Uniform, Bat', 4, 'Field Fighters'),
('Cricket', 11, 'Uniform, Bat', 5, 'Run Rulers'),
('Cricket', 11, 'Uniform, Bat', 6, 'Pitch Prodigies'),
('Cricket', 11, 'Uniform, Bat', 7, 'Catch Champions'),
('Cricket', 11, 'Uniform, Bat', 8, 'Boundary Breakers'),

-- Insert teams for Rugby
('Rugby', 15, 'Uniform, Cleats', 1, 'Rugby Runners'),
('Rugby', 15, 'Uniform, Cleats', 2, 'Tackle Titans'),
('Rugby', 15, 'Uniform, Cleats', 3, 'Scrum Stars'),
('Rugby', 15, 'Uniform, Cleats', 4, 'Try Tacklers'),
('Rugby', 15, 'Uniform, Cleats', 5, 'Field Fighters'),
('Rugby', 15, 'Uniform, Cleats', 6, 'Rugby Ragers'),
('Rugby', 15, 'Uniform, Cleats', 7, 'Lineout Legends'),
('Rugby', 15, 'Uniform, Cleats', 8, 'Maul Masters'),

-- Insert teams for Football
('Football', 11, 'Uniform, Cleats', 1, 'Gridiron Giants'),
('Football', 11, 'Uniform, Cleats', 2, 'Touchdown Titans'),
('Football', 11, 'Uniform, Cleats', 3, 'Pass Protectors'),
('Football', 11, 'Uniform, Cleats', 4, 'Field Fighters'),
('Football', 11, 'Uniform, Cleats', 5, 'End Zone Enforcers'),
('Football', 11, 'Uniform, Cleats', 6, 'Snap Savants'),
('Football', 11, 'Uniform, Cleats', 7, 'Blitz Brigadiers'),
('Football', 11, 'Uniform, Cleats', 8, 'Pigskin Prodigies'),

-- Insert teams for Swimming
('Swimming', 5, 'Swimsuit, Goggles', 1, 'Wave Warriors'),
('Swimming', 5, 'Swimsuit, Goggles', 2, 'Splash Sprinters'),
('Swimming', 5, 'Swimsuit, Goggles', 3, 'Freestyle Flyers'),
('Swimming', 5, 'Swimsuit, Goggles', 4, 'Backstroke Battlers'),
('Swimming', 5, 'Swimsuit, Goggles', 5, 'Butterfly Brawlers'),
('Swimming', 5, 'Swimsuit, Goggles', 6, 'Dolphin Dashers'),
('Swimming', 5, 'Swimsuit, Goggles', 7, 'Tidal Titans'),
('Swimming', 5, 'Swimsuit, Goggles', 8, 'Stroke Savants'),

-- Insert teams for Volleyball
('Volleyball', 6, 'Uniform, Knee Pads', 1, 'Spike Stars'),
('Volleyball', 6, 'Uniform, Knee Pads', 2, 'Block Brawlers'),
('Volleyball', 6, 'Uniform, Knee Pads', 3, 'Serve Smashers'),
('Volleyball', 6, 'Uniform, Knee Pads', 4, 'Set Savants'),
('Volleyball', 6, 'Uniform, Knee Pads', 5, 'Net Navigators'),
('Volleyball', 6, 'Uniform, Knee Pads', 6, 'Volley Vipers'),
('Volleyball', 6, 'Uniform, Knee Pads', 7, 'Dig Dynamos'),
('Volleyball', 6, 'Uniform, Knee Pads', 8, 'Hit Heroes'),

-- Insert teams for Golf
('Golf', 5, 'Golf Clubs, Golf Shoes', 1, 'Fairway Fighters'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 2, 'Putt Pros'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 3, 'Swing Savants'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 4, 'Drive Dynamos'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 5, 'Eagle Experts'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 6, 'Birdie Brawlers'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 7, 'Hole-in-One Heroes'),
('Golf', 5, 'Golf Clubs, Golf Shoes', 8, 'Par Perfectionists'),

-- Insert teams for Athletics
('Athletics', 5, 'Running Shoes, Shorts', 1, 'Sprint Stars'),
('Athletics', 5, 'Running Shoes, Shorts', 2, 'Track Titans'),
('Athletics', 5, 'Running Shoes, Shorts', 3, 'Hurdle Heroes'),
('Athletics', 5, 'Running Shoes, Shorts', 4, 'Relay Runners'),
('Athletics', 5, 'Running Shoes, Shorts', 5, 'Jump Jets'),
('Athletics', 5, 'Running Shoes, Shorts', 6, 'Throw Titans'),
('Athletics', 5, 'Running Shoes, Shorts', 7, 'Dash Dynamos'),
('Athletics', 5, 'Running Shoes, Shorts', 8, 'Marathon Masters'),

-- Insert teams for Cycling
('Cycling', 5, 'Bicycle, Helmet', 1, 'Pedal Pros'),
('Cycling', 5, 'Bicycle, Helmet', 2, 'Cycle Savants'),
('Cycling', 5, 'Bicycle, Helmet', 3, 'Bike Beasts'),
('Cycling', 5, 'Bicycle, Helmet', 4, 'Speed Spinners'),
('Cycling', 5, 'Bicycle, Helmet', 5, 'Tour Titans'),
('Cycling', 5, 'Bicycle, Helmet', 6, 'Gear Gurus'),
('Cycling', 5, 'Bicycle, Helmet', 7, 'Wheel Warriors'),
('Cycling', 5, 'Bicycle, Helmet', 8, 'Chain Champions'),

-- Insert teams for Boxing
('Boxing', 5, 'Gloves, Headgear', 1, 'Punch Pros'),
('Boxing', 5, 'Gloves, Headgear', 2, 'Knockout Kings'),
('Boxing', 5, 'Gloves, Headgear', 3, 'Ring Rulers'),
('Boxing', 5, 'Gloves, Headgear', 4, 'Jab Juggernauts'),
('Boxing', 5, 'Gloves, Headgear', 5, 'Uppercut Underdogs'),
('Boxing', 5, 'Gloves, Headgear', 6, 'Hook Heroes'),
('Boxing', 5, 'Gloves, Headgear', 7, 'Boxing Beasts'),
('Boxing', 5, 'Gloves, Headgear', 8, 'Fight Force'),

-- Insert teams for Wrestling
('Wrestling', 5, 'Wrestling Shoes, Singlet', 1, 'Grapple Gurus'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 2, 'Pin Pros'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 3, 'Takedown Titans'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 4, 'Mat Masters'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 5, 'Hold Heroes'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 6, 'Submission Savants'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 7, 'Reversal Rulers'),
('Wrestling', 5, 'Wrestling Shoes, Singlet', 8, 'Pinfall Prodigies'),

-- Insert teams for Table Tennis
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 1, 'Ping Pong Pros'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 2, 'Spin Savants'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 3, 'Serve Stars'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 4, 'Smash Masters'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 5, 'Volley Vipers'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 6, 'Net Navigators'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 7, 'Backhand Beasts'),
('Table Tennis', 5, 'Racket, Table Tennis Shoes', 8, 'Forehand Fighters'),

-- Insert teams for Badminton
('Badminton', 5, 'Racket, Shuttlecock', 1, 'Shuttle Smashers'),
('Badminton', 5, 'Racket, Shuttlecock', 2, 'Net Navigators'),
('Badminton', 5, 'Racket, Shuttlecock', 3, 'Drop Shot Dynamos'),
('Badminton', 5, 'Racket, Shuttlecock', 4, 'Backhand Battlers'),
('Badminton', 5, 'Racket, Shuttlecock', 5, 'Rally Rulers'),
('Badminton', 5, 'Racket, Shuttlecock', 6, 'Smash Savants'),
('Badminton', 5, 'Racket, Shuttlecock', 7, 'Serve Stars'),
('Badminton', 5, 'Racket, Shuttlecock', 8, 'Court Commanders'),

-- Insert teams for Squash
('Squash', 5, 'Racket, Squash Shoes', 1, 'Squash Stars'),
('Squash', 5, 'Racket, Squash Shoes', 2, 'Court Crusaders'),
('Squash', 5, 'Racket, Squash Shoes', 3, 'Drop Shot Dynamos'),
('Squash', 5, 'Racket, Squash Shoes', 4, 'Volley Vipers'),
('Squash', 5, 'Racket, Squash Shoes', 5, 'Backhand Beasts'),
('Squash', 5, 'Racket, Squash Shoes', 6, 'Serve Savants'),
('Squash', 5, 'Racket, Squash Shoes', 7, 'Rally Rulers'),
('Squash', 5, 'Racket, Squash Shoes', 8, 'Smash Masters'),

-- Insert teams for Martial Arts
('Martial Arts', 5, 'Uniform, Belt', 1, 'Karate Kickers'),
('Martial Arts', 5, 'Uniform, Belt', 2, 'Taekwondo Titans'),
('Martial Arts', 5, 'Uniform, Belt', 3, 'Judo Juggernauts'),
('Martial Arts', 5, 'Uniform, Belt', 4, 'Kung Fu Kings'),
('Martial Arts', 5, 'Uniform, Belt', 5, 'MMA Masters'),
('Martial Arts', 5, 'Uniform, Belt', 6, 'Dojo Dominators'),
('Martial Arts', 5, 'Uniform, Belt', 7, 'Black Belt Beasts'),
('Martial Arts', 5, 'Uniform, Belt', 8, 'Martial Art Mavericks'),

-- Insert teams for Skating
('Skating', 5, 'Skates, Helmet', 1, 'Ice Invaders'),
('Skating', 5, 'Skates, Helmet', 2, 'Rink Rulers'),
('Skating', 5, 'Skates, Helmet', 3, 'Skate Stars'),
('Skating', 5, 'Skates, Helmet', 4, 'Blade Battlers'),
('Skating', 5, 'Skates, Helmet', 5, 'Puck Protectors'),
('Skating', 5, 'Skates, Helmet', 6, 'Figure Flyers'),
('Skating', 5, 'Skates, Helmet', 7, 'Hockey Heroes'),
('Skating', 5, 'Skates, Helmet', 8, 'Skating Savants'),

-- Insert teams for Skiing
('Skiing', 5, 'Skis, Poles', 1, 'Slope Sliders'),
('Skiing', 5, 'Skis, Poles', 2, 'Snow Stars'),
('Skiing', 5, 'Skis, Poles', 3, 'Alpine Avengers'),
('Skiing', 5, 'Skis, Poles', 4, 'Ski Savants'),
('Skiing', 5, 'Skis, Poles', 5, 'Mountain Masters'),
('Skiing', 5, 'Skis, Poles', 6, 'Snowy Slayers'),
('Skiing', 5, 'Skis, Poles', 7, 'Trail Titans'),
('Skiing', 5, 'Skis, Poles', 8, 'Winter Warriors'),

-- Insert teams for Snowboarding
('Snowboarding', 5, 'Snowboard, Helmet', 1, 'Boarding Beasts'),
('Snowboarding', 5, 'Snowboard, Helmet', 2, 'Snowboard Savants'),
('Snowboarding', 5, 'Snowboard, Helmet', 3, 'Halfpipe Heroes'),
('Snowboarding', 5, 'Snowboard, Helmet', 4, 'Slope Stars'),
('Snowboarding', 5, 'Snowboard, Helmet', 5, 'Freestyle Flyers'),
('Snowboarding', 5, 'Snowboard, Helmet', 6, 'Big Air Bandits'),
('Snowboarding', 5, 'Snowboard, Helmet', 7, 'Snowboarders United'),
('Snowboarding', 5, 'Snowboard, Helmet', 8, 'Snow Stars'),

-- Insert teams for Surfing
('Surfing', 5, 'Surfboard, Wetsuit', 1, 'Wave Riders'),
('Surfing', 5, 'Surfboard, Wetsuit', 2, 'Surf Savants'),
('Surfing', 5, 'Surfboard, Wetsuit', 3, 'Wave Warriors'),
('Surfing', 5, 'Surfboard, Wetsuit', 4, 'Beach Brawlers'),
('Surfing', 5, 'Surfboard, Wetsuit', 5, 'Ocean Overlords'),
('Surfing', 5, 'Surfboard, Wetsuit', 6, 'Sea Savants'),
('Surfing', 5, 'Surfboard, Wetsuit', 7, 'Tidal Titans'),
('Surfing', 5, 'Surfboard, Wetsuit', 8, 'Riptide Riders'),

-- Insert teams for Kayaking
('Kayaking', 5, 'Kayak, Paddle', 1, 'River Runners'),
('Kayaking', 5, 'Kayak, Paddle', 2, 'Kayak Kings'),
('Kayaking', 5, 'Kayak, Paddle', 3, 'Paddle Pros'),
('Kayaking', 5, 'Kayak, Paddle', 4, 'Rapid Riders'),
('Kayaking', 5, 'Kayak, Paddle', 5, 'Stream Stars'),
('Kayaking', 5, 'Kayak, Paddle', 6, 'Canoe Commanders'),
('Kayaking', 5, 'Kayak, Paddle', 7, 'Water Warriors'),
('Kayaking', 5, 'Kayak, Paddle', 8, 'River Racers'),

-- Insert teams for Canoeing
('Canoeing', 5, 'Canoe, Paddle', 1, 'Canoe Crushers'),
('Canoeing', 5, 'Canoe, Paddle', 2, 'Paddle Pros'),
('Canoeing', 5, 'Canoe, Paddle', 3, 'Stream Stars'),
('Canoeing', 5, 'Canoe, Paddle', 4, 'Canoe Commanders'),
('Canoeing', 5, 'Canoe, Paddle', 5, 'Rapid Riders'),
('Canoeing', 5, 'Canoe, Paddle', 6, 'Water Warriors'),
('Canoeing', 5, 'Canoe, Paddle', 7, 'River Racers'),
('Canoeing', 5, 'Canoe, Paddle', 8, 'Paddle Pioneers'),

-- Insert teams for Rowing
('Rowing', 5, 'Rowboat, Oars', 1, 'Rowing Rangers'),
('Rowing', 5, 'Rowboat, Oars', 2, 'Oar Overlords'),
('Rowing', 5, 'Rowboat, Oars', 3, 'Stroke Savants'),
('Rowing', 5, 'Rowboat, Oars', 4, 'Crew Crusaders'),
('Rowing', 5, 'Rowboat, Oars', 5, 'Water Warriors'),
('Rowing', 5, 'Rowboat, Oars', 6, 'River Runners'),
('Rowing', 5, 'Rowboat, Oars', 7, 'Boat Beasts'),
('Rowing', 5, 'Rowboat, Oars', 8, 'Paddle Pros'),

-- Insert teams for Archery
('Archery', 5, 'Bow, Arrows', 1, 'Arrow Aces'),
('Archery', 5, 'Bow, Arrows', 2, 'Target Titans'),
('Archery', 5, 'Bow, Arrows', 3, 'Bullseye Beasts'),
('Archery', 5, 'Bow, Arrows', 4, 'Bow Masters'),
('Archery', 5, 'Bow, Arrows', 5, 'Quiver Kings'),
('Archery', 5, 'Bow, Arrows', 6, 'Archery Aces'),
('Archery', 5, 'Bow, Arrows', 7, 'Arrow Avengers'),
('Archery', 5, 'Bow, Arrows', 8, 'Target Tacticians'),

-- Insert teams for Fencing
('Fencing', 5, 'Foil, Mask', 1, 'Sword Savants'),
('Fencing', 5, 'Foil, Mask', 2, 'Blade Brawlers'),
('Fencing', 5, 'Foil, Mask', 3, 'Parry Pros'),
('Fencing', 5, 'Foil, Mask', 4, 'Riposte Rulers'),
('Fencing', 5, 'Foil, Mask', 5, 'Thrust Titans'),
('Fencing', 5, 'Foil, Mask', 6, 'Fencing Fighters'),
('Fencing', 5, 'Foil, Mask', 7, 'Lunge Legends'),
('Fencing', 5, 'Foil, Mask', 8, 'Duel Dynamos'),

-- Insert teams for Horse Riding
('Horse Riding', 5, 'Horse, Helmet', 1, 'Equestrian Experts'),
('Horse Riding', 5, 'Horse, Helmet', 2, 'Jumper Juggernauts'),
('Horse Riding', 5, 'Horse, Helmet', 3, 'Dressage Dynamos'),
('Horse Riding', 5, 'Horse, Helmet', 4, 'Polo Pros'),
('Horse Riding', 5, 'Horse, Helmet', 5, 'Gallop Gurus'),
('Horse Riding', 5, 'Horse, Helmet', 6, 'Riding Rangers'),
('Horse Riding', 5, 'Horse, Helmet', 7, 'Stable Stars'),
('Horse Riding', 5, 'Horse, Helmet', 8, 'Horseback Heroes'),

-- Insert teams for Gymnastics
('Gymnastics', 5, 'Leotard, Grips', 1, 'Flip Flyers'),
('Gymnastics', 5, 'Leotard, Grips', 2, 'Tumble Titans'),
('Gymnastics', 5, 'Leotard, Grips', 3, 'Balance Beasts'),
('Gymnastics', 5, 'Leotard, Grips', 4, 'Vault Victors'),
('Gymnastics', 5, 'Leotard, Grips', 5, 'Bar Brawlers'),
('Gymnastics', 5, 'Leotard, Grips', 6, 'Gym Gurus'),
('Gymnastics', 5, 'Leotard, Grips', 7, 'Routine Rulers'),
('Gymnastics', 5, 'Leotard, Grips', 8, 'Flex Force'),

-- Insert teams for Handball
('Handball', 5, 'Uniform, Handball Shoes', 1, 'Handball Heroes'),
('Handball', 5, 'Uniform, Handball Shoes', 2, 'Goal Getters'),
('Handball', 5, 'Uniform, Handball Shoes', 3, 'Pass Pros'),
('Handball', 5, 'Uniform, Handball Shoes', 4, 'Throw Titans'),
('Handball', 5, 'Uniform, Handball Shoes', 5, 'Defense Dynamos'),
('Handball', 5, 'Uniform, Handball Shoes', 6, 'Court Crusaders'),
('Handball', 5, 'Uniform, Handball Shoes', 7, 'Net Navigators'),
('Handball', 5, 'Uniform, Handball Shoes', 8, 'Handball Hustlers'),

-- Insert teams for Lacrosse
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 1, 'Lacrosse Legends'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 2, 'Net Navigators'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 3, 'Stick Stars'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 4, 'Goal Guardians'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 5, 'Field Fighters'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 6, 'Check Champions'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 7, 'Cradle Commanders'),
('Lacrosse', 5, 'Lacrosse Stick, Helmet', 8, 'Shooting Stars'),

-- Insert teams for Polo
('Polo', 5, 'Polo Stick, Helmet', 1, 'Polo Pros'),
('Polo', 5, 'Polo Stick, Helmet', 2, 'Chukka Champions'),
('Polo', 5, 'Polo Stick, Helmet', 3, 'Mallet Masters'),
('Polo', 5, 'Polo Stick, Helmet', 4, 'Field Fighters'),
('Polo', 5, 'Polo Stick, Helmet', 5, 'Goal Getters'),
('Polo', 5, 'Polo Stick, Helmet', 6, 'Polo Pioneers'),
('Polo', 5, 'Polo Stick, Helmet', 7, 'Equestrian Experts'),
('Polo', 5, 'Polo Stick, Helmet', 8, 'Riding Rangers'),

-- Insert teams for Softball
('Softball', 9, 'Uniform, Glove', 1, 'Softball Stars'),
('Softball', 9, 'Uniform, Glove', 2, 'Diamond Dynamos'),
('Softball', 9, 'Uniform, Glove', 3, 'Pitching Pros'),
('Softball', 9, 'Uniform, Glove', 4, 'Batting Beasts'),
('Softball', 9, 'Uniform, Glove', 5, 'Fielding Fighters'),
('Softball', 9, 'Uniform, Glove', 6, 'Catching Champions'),
('Softball', 9, 'Uniform, Glove', 7, 'Base Brawlers'),
('Softball', 9, 'Uniform, Glove', 8, 'Slugging Savants'),

-- Insert teams for Squash
('Squash', 5, 'Racket, Squash Shoes', 1, 'Squash Savants'),
('Squash', 5, 'Racket, Squash Shoes', 2, 'Court Crusaders'),
('Squash', 5, 'Racket, Squash Shoes', 3, 'Drop Shot Dynamos'),
('Squash', 5, 'Racket, Squash Shoes', 4, 'Volley Vipers'),
('Squash', 5, 'Racket, Squash Shoes', 5, 'Backhand Beasts'),
('Squash', 5, 'Racket, Squash Shoes', 6, 'Serve Stars'),
('Squash', 5, 'Racket, Squash Shoes', 7, 'Rally Rulers'),
('Squash', 5, 'Racket, Squash Shoes', 8, 'Smash Masters'),

-- Insert teams for Triathlon
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 1, 'Triathlon Titans'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 2, 'Endurance Experts'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 3, 'Swim Savants'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 4, 'Cycle Champs'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 5, 'Run Rulers'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 6, 'Tri Pros'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 7, 'Distance Dominators'),
('Triathlon', 5, 'Running Shoes, Bicycle, Swimsuit', 8, 'Race Masters'),

-- Insert teams for Water Polo
('Water Polo', 5, 'Swimsuit, Cap', 1, 'Aqua Aces'),
('Water Polo', 5, 'Swimsuit, Cap', 2, 'Water Warriors'),
('Water Polo', 5, 'Swimsuit, Cap', 3, 'Goal Guardians'),
('Water Polo', 5, 'Swimsuit, Cap', 4, 'Swim Savants'),
('Water Polo', 5, 'Swimsuit, Cap', 5, 'Net Navigators'),
('Water Polo', 5, 'Swimsuit, Cap', 6, 'Pool Pros'),
('Water Polo', 5, 'Swimsuit, Cap', 7, 'Splash Stars'),
('Water Polo', 5, 'Swimsuit, Cap', 8, 'Wave Warriors'),

-- Insert teams for Weightlifting
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 1, 'Lift Legends'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 2, 'Power Pros'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 3, 'Barbell Beasts'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 4, 'Strength Savants'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 5, 'Lift Lords'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 6, 'Muscle Masters'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 7, 'Iron Invaders'),
('Weightlifting', 5, 'Weightlifting Shoes, Belt', 8, 'Barbell Battlers'),

-- Insert teams for Judo
('Judo', 5, 'Judo Uniform, Belt', 1, 'Judo Juggernauts'),
('Judo', 5, 'Judo Uniform, Belt', 2, 'Throw Titans'),
('Judo', 5, 'Judo Uniform, Belt', 3, 'Grapple Gurus'),
('Judo', 5, 'Judo Uniform, Belt', 4, 'Mat Masters'),
('Judo', 5, 'Judo Uniform, Belt', 5, 'Hold Heroes'),
('Judo', 5, 'Judo Uniform, Belt', 6, 'Submission Savants'),
('Judo', 5, 'Judo Uniform, Belt', 7, 'Pin Pros'),
('Judo', 5, 'Judo Uniform, Belt', 8, 'Reversal Rulers'),

-- Insert teams for Karate
('Karate', 5, 'Karate Uniform, Belt', 1, 'Karate Kickers'),
('Karate', 5, 'Karate Uniform, Belt', 2, 'Strike Savants'),
('Karate', 5, 'Karate Uniform, Belt', 3, 'Punch Pros'),
('Karate', 5, 'Karate Uniform, Belt', 4, 'Block Brawlers'),
('Karate', 5, 'Karate Uniform, Belt', 5, 'Karate Kings'),
('Karate', 5, 'Karate Uniform, Belt', 6, 'Dojo Dominators'),
('Karate', 5, 'Karate Uniform, Belt', 7, 'Black Belt Beasts'),
('Karate', 5, 'Karate Uniform, Belt', 8, 'Martial Art Masters'),

-- Insert teams for Kickboxing
('Kickboxing', 5, 'Gloves, Mouthguard', 1, 'Kickboxing Kings'),
('Kickboxing', 5, 'Gloves, Mouthguard', 2, 'Strike Savants'),
('Kickboxing', 5, 'Gloves, Mouthguard', 3, 'Punch Pros'),
('Kickboxing', 5, 'Gloves, Mouthguard', 4, 'Kick Titans'),
('Kickboxing', 5, 'Gloves, Mouthguard', 5, 'Fight Force'),
('Kickboxing', 5, 'Gloves, Mouthguard', 6, 'Combat Champions'),
('Kickboxing', 5, 'Gloves, Mouthguard', 7, 'Ring Rulers'),
('Kickboxing', 5, 'Gloves, Mouthguard', 8, 'Knockout Knights'),

-- Insert teams for Taekwondo
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 1, 'Taekwondo Titans'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 2, 'Kick Kings'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 3, 'Strike Savants'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 4, 'Punch Pros'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 5, 'Block Brawlers'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 6, 'Martial Art Masters'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 7, 'Combat Champions'),
('Taekwondo', 5, 'Taekwondo Uniform, Belt', 8, 'Dojo Dominators'),

-- Insert teams for Skateboarding
('Skateboarding', 5, 'Skateboard, Helmet', 1, 'Skate Stars'),
('Skateboarding', 5, 'Skateboard, Helmet', 2, 'Trick Titans'),
('Skateboarding', 5, 'Skateboard, Helmet', 3, 'Ramp Rulers'),
('Skateboarding', 5, 'Skateboard, Helmet', 4, 'Halfpipe Heroes'),
('Skateboarding', 5, 'Skateboard, Helmet', 5, 'Board Beasts'),
('Skateboarding', 5, 'Skateboard, Helmet', 6, 'Street Skaters'),
('Skateboarding', 5, 'Skateboard, Helmet', 7, 'Park Pros'),
('Skateboarding', 5, 'Skateboard, Helmet', 8, 'Vert Victors'),

-- Insert teams for Mountain Biking
('Mountain Biking', 5, 'Bicycle, Helmet', 1, 'Trail Titans'),
('Mountain Biking', 5, 'Bicycle, Helmet', 2, 'Bike Beasts'),
('Mountain Biking', 5, 'Bicycle, Helmet', 3, 'Hill Heroes'),
('Mountain Biking', 5, 'Bicycle, Helmet', 4, 'Mountain Masters'),
('Mountain Biking', 5, 'Bicycle, Helmet', 5, 'Pedal Pros'),
('Mountain Biking', 5, 'Bicycle, Helmet', 6, 'Speed Spinners'),
('Mountain Biking', 5, 'Bicycle, Helmet', 7, 'Cycle Champs'),
('Mountain Biking', 5, 'Bicycle, Helmet', 8, 'Gear Gurus'),

-- Insert teams for Rock Climbing
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 1, 'Rock Rulers'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 2, 'Climb Champs'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 3, 'Peak Pros'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 4, 'Summit Savants'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 5, 'Grip Gurus'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 6, 'Wall Warriors'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 7, 'Boulder Beasts'),
('Rock Climbing', 5, 'Climbing Shoes, Chalk Bag', 8, 'Height Heroes'),

-- Insert teams for Bouldering
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 1, 'Boulder Beasts'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 2, 'Grip Gurus'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 3, 'Wall Warriors'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 4, 'Peak Pros'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 5, 'Summit Savants'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 6, 'Height Heroes'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 7, 'Rock Rulers'),
('Bouldering', 5, 'Climbing Shoes, Chalk Bag', 8, 'Climb Champs'),

-- Insert teams for Speed Climbing
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 1, 'Speed Savants'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 2, 'Grip Gurus'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 3, 'Wall Warriors'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 4, 'Peak Pros'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 5, 'Summit Savants'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 6, 'Height Heroes'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 7, 'Rock Rulers'),
('Speed Climbing', 5, 'Climbing Shoes, Chalk Bag', 8, 'Climb Champs'),

-- Insert teams for Figure Skating
('Figure Skating', 5, 'Skates, Costume', 1, 'Ice Stars'),
('Figure Skating', 5, 'Skates, Costume', 2, 'Skate Savants'),
('Figure Skating', 5, 'Skates, Costume', 3, 'Rink Rulers'),
('Figure Skating', 5, 'Skates, Costume', 4, 'Figure Flyers'),
('Figure Skating', 5, 'Skates, Costume', 5, 'Spin Stars'),
('Figure Skating', 5, 'Skates, Costume', 6, 'Blade Brawlers'),
('Figure Skating', 5, 'Skates, Costume', 7, 'Twirl Titans'),
('Figure Skating', 5, 'Skates, Costume', 8, 'Ice Invaders'),

-- Insert teams for Ice Hockey
('Ice Hockey', 6, 'Uniform, Skates', 1, 'Ice Invaders'),
('Ice Hockey', 6, 'Uniform, Skates', 2, 'Puck Protectors'),
('Ice Hockey', 6, 'Uniform, Skates', 3, 'Goal Guardians'),
('Ice Hockey', 6, 'Uniform, Skates', 4, 'Skating Stars'),
('Ice Hockey', 6, 'Uniform, Skates', 5, 'Hockey Heroes'),
('Ice Hockey', 6, 'Uniform, Skates', 6, 'Rink Rulers'),
('Ice Hockey', 6, 'Uniform, Skates', 7, 'Net Navigators'),
('Ice Hockey', 6, 'Uniform, Skates', 8, 'Ice Kings');



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

-- Users not part of a league
SELECT DISTINCT `UserId`
From `User`
Where `UserId` NOT IN (SELECT `UserId` in `UserTeam`)

-- Teams with ranking 1
SELECT *
FROM `Team`
WHERE `Ranking` = (SELECT MIN(`Ranking`) FROM `Team`);

-- Teams for racket sports
SELECT DISTINCT `TeamId`
FROM `Team`
WHERE `Requirements` LIKE '%Racket%';

-- Leagues where entry fee is more than $100
SELECT DISTINCT `LeagueId`
From `League`
WHERE SUBSTRING(EntryFee, 2) > 100;

-- Sports with more than 2 events
SELECT Sport, COUNT(*) AS EventCount
FROM SportEvent
GROUP BY Sport
HAVING EventCount > 2;

-- Teams with more than 5 members
SELECT Sports, MemberCount
FROM Team
GROUP BY Sports, MemberCount
HAVING SUM(MemberCount) > 5;

-- Sports with the average ranking less than 3
SELECT Sports, AVG(Ranking) AS AverageRanking
FROM Team
GROUP BY Sports
HAVING AverageRanking < 3;

SELECT * FROM sportsdb.userteam;


DROP ROLE IF EXISTS UserManagement;
CREATE ROLE UserManagement;
GRANT SELECT, DELETE, UPDATE, INSERT, REFERENCES, TRIGGER ON TABLE user TO UserManagement;


DROP ROLE IF EXISTS TeamIntern;
CREATE ROLE TeamIntern; 
GRANT SElECT, DELETE, UPDATE, INSERT ON TABLE team TO TeamIntern;
REVOKE DELETE on TABLE team FROM TeamIntern;



START Transaction;
DROP VIEW IF EXISTS sportsdb.UserTeams;
DROP VIEW IF EXISTS sportsdb.TeamLeagues;
CREATE VIEW UserTeams AS
SELECT 
	U.UserId,
    U.FirstName,
    U.LastName,
    T.TeamName,
    T.Sports,
    T.Ranking
FROM 
    User U
    JOIN UserTeam UT ON U.UserId = UT.UserId
    JOIN Team T ON UT.TeamId = T.TeamId;
    

    CREATE VIEW TeamLeagues AS
SELECT 
    T.TeamName,
    L.LeagueID,
    L.Sport,
    L.Date,
    L.Time,
    L.EntryFee,
    L.Prizes
FROM 
    Team T
    JOIN TeamLeague TL ON T.TeamId = TL.TeamId
    JOIN League L ON TL.LeagueId = L.LeagueID;

COMMIT;

Select * from UserTeams;
Select * from TeamLeagues;


SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

INSERT INTO User (PhoneNumber, Email, FirstName, LastName) VALUES ('1234567890', 'new.user@example.com', 'New', 'User');

COMMIT;


SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT * FROM Team WHERE Sports = 'Soccer';

CREATE TABLE IF NOT EXISTS UndoLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TransactionID INT NOT NULL,
    Operation VARCHAR(50) NOT NULL,
    TableName VARCHAR(50) NOT NULL,
    RowID INT NOT NULL,
    OldValues TEXT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

USE sportsdb;
CREATE TABLE IF NOT EXISTS RedoLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    TransactionID INT NOT NULL,
    Operation VARCHAR(50) NOT NULL,
    TableName VARCHAR(50) NOT NULL,
    RowID INT NOT NULL,
    NewValues TEXT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Checkpoints (
    CheckpointID INT PRIMARY KEY AUTO_INCREMENT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS UserLog (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    UserId INT,
    Operation VARCHAR(50),
    OperationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserId) REFERENCES User(UserId)
);

DELIMITER //

CREATE TRIGGER after_user_insert
AFTER INSERT ON User
FOR EACH ROW
BEGIN
    INSERT INTO UserLog (UserId, Operation) VALUES (NEW.UserId, 'INSERT');
END;
//

DELIMITER ;

START TRANSACTION;

INSERT INTO User (PhoneNumber, Email, FirstName, LastName)
VALUES ('1234567890', 'new.user@example.com', 'New', 'User');

SET @NewUserId = LAST_INSERT_ID();

INSERT INTO UndoLog (Operation, TableName, RowID, OldValues)
VALUES ('INSERT', 'User', @NewUserId, NULL);

INSERT INTO RedoLog (Operation, TableName, RowID, NewValues)
VALUES ('INSERT', 'User', @NewUserId, '{"PhoneNumber": "1234567890", "Email": "new.user@example.com", "FirstName": "New", "LastName": "User"}');

COMMIT;
ALTER TABLE User
ADD CONSTRAINT unique_email UNIQUE (Email);


COMMIT;

