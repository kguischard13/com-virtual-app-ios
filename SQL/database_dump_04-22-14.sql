-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 17, 2014 at 05:06 PM
-- Server version: 5.5.34
-- PHP Version: 5.5.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `appdoodah`
--

-- --------------------------------------------------------

--
-- Table structure for table `Activity`
--

CREATE TABLE `Activity` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Cost` varchar(45) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Zip` varchar(45) NOT NULL,
  `LocationType` varchar(45) NOT NULL,
  `PopularityIndex` varchar(45) DEFAULT NULL,
  `Description` varchar(45) NOT NULL,
  `ActivityDate` datetime NOT NULL,
  `VenueName` varchar(45) DEFAULT NULL,
  `ImagePath` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Activity`
--

INSERT INTO `Activity` (`Id`, `Name`, `Cost`, `City`, `State`, `Zip`, `LocationType`, `PopularityIndex`, `Description`, `ActivityDate`, `VenueName`, `ImagePath`) VALUES
(1, 'Grab a Drink', 'Medium', 'New Rochelle', 'NY', '10801', 'Public', '10', 'Usually achieved at a local bar or in the com', '0000-00-00 00:00:00', 'Bar, Home', './img/sample-images/360px-Belgian_beer_glass.jpg'),
(2, 'Go to the Movies', 'Medium', 'White Plains', 'NY', '10604', 'Public', '9', 'Watch a movie at the theater', '0000-00-00 00:00:00', 'Movie Theater', './img/sample-images/640px-Regal_Cinemas_Imax_Theatre.jpg'),
(3, 'Walk in the park', 'Free', 'New York', 'NY', '10019', 'Public ', '10', 'Huge park in the middle of NYC!', '2014-05-01 00:00:00', 'Park', './img/sample-images/640px-Central_Park_NYC_1.jpg'),
(4, 'Bike on a trail', 'Free', 'New Rochelle', 'NY', '10801', 'Public', '7', 'Nature Study backwoods trail, travel through ', '2014-05-01 00:00:00', 'Nature Study Woods', './img/sample-images/BikeTrail.JPG'),
(5, 'Go to the MOMA', 'Free*', 'New York', 'NY', '10087', 'Public', '10', 'The Metropolitan Museum of Art, need we say m', '0000-00-00 00:00:00', 'Museum', './img/sample-images/576px-MoMa_NY_USA_1.jpg'),
(6, 'Play Basketball', 'Free', 'New York', 'NY', '10013', 'Public', '10', 'Outdoor streetball, most popular in the sprin', '0000-00-00 00:00:00', 'Basketball', './img/sample-images/512px-Barack_Obama_plays_basketball_with_Arne_Dunc'),
(7, 'Go for a Hike', 'Free', 'Saratoga', 'NY', '34567', 'Public', '6', 'Hike in the beautiful hills of Saratoga', '0000-00-00 00:00:00', 'Mountains', './img/sample-images/640x480_Hike.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Activity_has_Mood`
--

CREATE TABLE `Activity_has_Mood` (
  `Activity_Id` int(11) NOT NULL,
  `Mood_Id` int(11) NOT NULL,
  PRIMARY KEY (`Activity_Id`,`Mood_Id`),
  KEY `fk_Activity_has_Mood_Mood1_idx` (`Mood_Id`),
  KEY `fk_Activity_has_Mood_Activity1_idx` (`Activity_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Activity_has_Mood`
--

INSERT INTO `Activity_has_Mood` (`Activity_Id`, `Mood_Id`) VALUES
(3, 2),
(3, 3),
(1, 4),
(4, 4),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(1, 7),
(2, 7),
(3, 7),
(1, 8),
(1, 9),
(3, 9);

-- --------------------------------------------------------

--
-- Table structure for table `Favorite`
--

CREATE TABLE `Favorite` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IsFavorite` tinyint(1) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Activity_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`User_Id`,`Activity_Id`),
  KEY `fk_Favorite_User1_idx` (`User_Id`),
  KEY `fk_Favorite_Activity1_idx` (`Activity_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Mood`
--

CREATE TABLE `Mood` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `Mood`
--

INSERT INTO `Mood` (`Id`, `Name`, `Category`) VALUES
(1, 'Afraid', NULL),
(2, 'Angry', NULL),
(3, 'Anxious', NULL),
(4, 'Confident', NULL),
(5, 'Dread', NULL),
(6, 'Happy', NULL),
(7, 'Lonely', NULL),
(8, 'Regret', NULL),
(9, 'Sad', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Rating`
--

CREATE TABLE `Rating` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Value` varchar(45) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Comment` varchar(45) DEFAULT NULL,
  `Activity_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`Activity_Id`,`User_Id`),
  KEY `fk_Rating_Activity1_idx` (`Activity_Id`),
  KEY `fk_Rating_User1_idx` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `UserName` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`Id`, `FirstName`, `LastName`, `Email`, `UserName`, `Password`, `DateAdded`) VALUES
(1, 'chris', 'forehand', 'cforehand@iona.edu', 'cforehand', 'test', NULL),
(2, 'john', 'doe', 'jdoe@gaels.iona.edu', 'jdoe', 'test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserPreferences`
--

CREATE TABLE `UserPreferences` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `UserPreferences`
--

INSERT INTO `UserPreferences` (`Id`, `Name`) VALUES
(1, 'Shopping'),
(2, 'Movies'),
(3, 'Restaurants'),
(4, 'Reading'),
(5, 'Concerts'),
(6, 'Gaming'),
(7, 'Drink'),
(8, 'Outdoors'),
(9, 'Baseball'),
(10, 'Football'),
(11, 'Basketball'),
(12, 'Hockey'),
(13, 'Golf'),
(14, 'Bowling'),
(15, 'Tennis'),
(16, 'Max spending');

-- --------------------------------------------------------

--
-- Table structure for table `User_has_Activity`
--

CREATE TABLE `User_has_Activity` (
  `User_Id` int(11) NOT NULL,
  `Activity_Id` int(11) NOT NULL,
  `IsCompleted` varchar(10) DEFAULT NULL,
  `DateCompleted` datetime NOT NULL,
  PRIMARY KEY (`DateCompleted`,`User_Id`,`Activity_Id`),
  KEY `Id_idx` (`Activity_Id`),
  KEY `User_Id` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User_has_Activity`
--

INSERT INTO `User_has_Activity` (`User_Id`, `Activity_Id`, `IsCompleted`, `DateCompleted`) VALUES
(1, 2, 'True', '2014-04-03 00:00:00'),
(1, 4, 'True', '2014-04-09 00:00:00'),
(1, 1, 'True', '2014-04-10 00:00:00'),
(1, 3, 'True', '2014-04-16 00:00:00'),
(2, 3, 'True', '2014-04-16 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `User_has_Mood`
--

CREATE TABLE `User_has_Mood` (
  `User_Id` int(11) NOT NULL,	
  `Mood_Id` int(11) NOT NULL,
  `MoodDate` datetime NOT NULL,
  PRIMARY KEY (`User_Id`,`Mood_Id`,`MoodDate`),
  KEY `fk_User_has_Mood_Mood1_idx` (`Mood_Id`),
  KEY `fk_User_has_Mood_User1_idx` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User_has_Mood`
--

INSERT INTO `User_has_Mood` (`User_Id`, `Mood_Id`, `MoodDate`) VALUES
(1, 1, '2013-12-31 12:30:56'),
(1, 3, '2014-01-25 06:45:12'),
(2, 5, '2013-11-02 07:32:51');

-- --------------------------------------------------------

--
-- Table structure for table `User_has_UserPreferences`
--

CREATE TABLE `User_has_UserPreferences` (
  `User_Id` int(11) NOT NULL,
  `UserPreferences_Id` int(11) NOT NULL,
  `Value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`User_Id`,`UserPreferences_Id`),
  KEY `fk_User_has_UserPreferences_UserPreferences1_idx` (`UserPreferences_Id`),
  KEY `fk_User_has_UserPreferences_User1_idx` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `User_has_UserPreferences`
--

INSERT INTO `User_has_UserPreferences` (`User_Id`, `UserPreferences_Id`, `Value`) VALUES
(1, 4, 'Yes'), /* note change in user pref ids, this used to be baseball but is now reading */
(1, 9, 'No'),  /* note change in user pref ids, this used to be outdoors but is now baseball */
(2, 1, 'Yes'),
(2, 2, 'Yes'),
(2, 3, 'Yes'),
(2, 4, 'Yes'),
(2, 5, 'Yes'),
(2, 6, 'Yes'),
(2, 7, 'Yes'),
(2, 8, 'Yes'),
(2, 9, NULL),
(2, 10, NULL),
(2, 11, NULL),
(2, 12, NULL),
(2, 13, NULL),
(2, 14, NULL),
(2, 15, NULL),
(2, 16, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Activity_has_Mood`
--
ALTER TABLE `Activity_has_Mood`
  ADD CONSTRAINT `fk_Activity_has_Mood_Activity1` FOREIGN KEY (`Activity_Id`) REFERENCES `Activity` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Activity_has_Mood_Mood1` FOREIGN KEY (`Mood_Id`) REFERENCES `Mood` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Favorite`
--
ALTER TABLE `Favorite`
  ADD CONSTRAINT `fk_Favorite_Activity1` FOREIGN KEY (`Activity_Id`) REFERENCES `Activity` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Favorite_User1` FOREIGN KEY (`User_Id`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Rating`
--
ALTER TABLE `Rating`
  ADD CONSTRAINT `fk_Rating_Activity1` FOREIGN KEY (`Activity_Id`) REFERENCES `Activity` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Rating_User1` FOREIGN KEY (`User_Id`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `User_has_Activity`
--
ALTER TABLE `User_has_Activity`
  ADD CONSTRAINT `User_Id` FOREIGN KEY (`User_Id`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Activity_Id` FOREIGN KEY (`Activity_Id`) REFERENCES `Activity` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `User_has_Mood`
--
ALTER TABLE `User_has_Mood`
  ADD CONSTRAINT `fk_User_has_Mood_Mood1` FOREIGN KEY (`Mood_Id`) REFERENCES `Mood` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_has_Mood_User1` FOREIGN KEY (`User_Id`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `User_has_UserPreferences`
--
ALTER TABLE `User_has_UserPreferences`
  ADD CONSTRAINT `fk_User_has_UserPreferences_User1` FOREIGN KEY (`User_Id`) REFERENCES `User` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_User_has_UserPreferences_UserPreferences1` FOREIGN KEY (`UserPreferences_Id`) REFERENCES `UserPreferences` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
