-- app-doo-dah
-- populate all tables

-- User table
-- just one user shall exist until multi-user support is integrated 
INSERT INTO User (Id, Username) VALUES (0, 'admin');
INSERT INTO User VALUES (1, 'John', 'Doe', 'jdoe1@iona.edu', 'JDoe', 'password',                         '01-01-12 14:32:32');

-- UserPreferences table
INSERT INTO UserPreferences VALUES (001, 'Shopping'); 
INSERT INTO UserPreferences VALUES (002, 'Football'); 
INSERT INTO UserPreferences VALUES (003, 'Basketball'); 
INSERT INTO UserPreferences VALUES (004, 'Baseball'); 
INSERT INTO UserPreferences VALUES (005, 'Golf');
INSERT INTO UserPreferences VALUES (006, 'Tennis'); 
INSERT INTO UserPreferences VALUES (007, 'Golf'); 
INSERT INTO UserPreferences VALUES (008, 'Bowling'); 
INSERT INTO UserPreferences VALUES (009, 'Drink'); 
INSERT INTO UserPreferences VALUES (010, 'Outdoors'); 
INSERT INTO UserPreferences VALUES (011, 'Movies'); 
INSERT INTO UserPreferences VALUES (012, 'Video games'); 
INSERT INTO UserPreferences VALUES (013, 'Music events');
INSERT INTO UserPreferences VALUES (014, 'Eating out'); 
INSERT INTO UserPreferences VALUES (015, 'Leisure reading'); 

-- User_has_UserPreferences table
INSERT INTO User_has_UserPreferences VALUES (1, 009, "No");
INSERT INTO User_has_UserPreferences VALUES (1, 004, "Yes");


-- Mood table
INSERT INTO Mood VALUES (0, "Afraid", NULL);
INSERT INTO Mood VALUES (1, "Angry", NULL);
INSERT INTO Mood VALUES (2, "Anxious", NULL);
INSERT INTO Mood VALUES (3, "Confident", NULL);
INSERT INTO Mood VALUES (4, "Dread", NULL);
INSERT INTO Mood VALUES (5, "Happy", NULL);
INSERT INTO Mood VALUES (6, "Lonely", NULL);
INSERT INTO Mood VALUES (7, "Regret", NULL);
INSERT INTO Mood VALUES (8, "Sad", NULL);

-- User_has_mood table
INSERT INTO User_has_mood VALUES (1, 1, '2013-12-31 12:30:56');
INSERT INTO User_has_mood VALUES (1, 3, '2014-1-25 06:45:12');
INSERT INTO User_has_mood VALUES (1, 5, '2013-11-02 07:32:51');
