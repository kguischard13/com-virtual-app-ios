SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `app-doo-dah` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `app-doo-dah` ;

-- -----------------------------------------------------
-- Table `app-doo-dah`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`User` (
  `Id` INT NOT NULL COMMENT '	',
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `UserName` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  `DateAdded` DATETIME NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`Activity` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Zip` VARCHAR(45) NOT NULL,
  `LocationType` VARCHAR(45) NOT NULL,
  `PopularityIndex` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NOT NULL,
  `ActivityDate` DATETIME NOT NULL,
  `VenueName` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`Mood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`Mood` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`Rating`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`Rating` (
  `Id` INT NOT NULL,
  `Value` VARCHAR(45) NULL,
  `DateCreated` DATETIME NULL,
  `Comment` VARCHAR(45) NULL,
  `Activity_Id` INT NOT NULL,
  `User_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `Activity_Id`, `User_Id`),
  INDEX `fk_Rating_Activity1_idx` (`Activity_Id` ASC),
  INDEX `fk_Rating_User1_idx` (`User_Id` ASC),
  CONSTRAINT `fk_Rating_Activity1`
    FOREIGN KEY (`Activity_Id`)
    REFERENCES `app-doo-dah`.`Activity` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rating_User1`
    FOREIGN KEY (`User_Id`)
    REFERENCES `app-doo-dah`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`Favorite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`Favorite` (
  `Id` INT NOT NULL,
  `IsFavorite` TINYINT(1) NOT NULL,
  `User_Id` INT NOT NULL,
  `Activity_Id` INT NOT NULL,
  PRIMARY KEY (`Id`, `User_Id`, `Activity_Id`),
  INDEX `fk_Favorite_User1_idx` (`User_Id` ASC),
  INDEX `fk_Favorite_Activity1_idx` (`Activity_Id` ASC),
  CONSTRAINT `fk_Favorite_User1`
    FOREIGN KEY (`User_Id`)
    REFERENCES `app-doo-dah`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favorite_Activity1`
    FOREIGN KEY (`Activity_Id`)
    REFERENCES `app-doo-dah`.`Activity` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`User_has_Activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`User_has_Activity` (
  `User_Id` INT NOT NULL,
  `Activity_Id` INT NOT NULL,
  `IsCompleted` TINYINT(1) NOT NULL,
  `DateCompleted` VARCHAR(45) NULL,
  PRIMARY KEY (`User_Id`, `Activity_Id`),
  INDEX `fk_User_has_Activity_Activity1_idx` (`Activity_Id` ASC),
  INDEX `fk_User_has_Activity_User_idx` (`User_Id` ASC),
  CONSTRAINT `fk_User_has_Activity_User`
    FOREIGN KEY (`User_Id`)
    REFERENCES `app-doo-dah`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Activity_Activity1`
    FOREIGN KEY (`Activity_Id`)
    REFERENCES `app-doo-dah`.`Activity` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`User_has_Mood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`User_has_Mood` (
  `User_Id` INT NOT NULL,
  `Mood_Id` INT NOT NULL,
  `MoodDate` DATETIME NULL,
  PRIMARY KEY (`User_Id`, `Mood_Id`),
  INDEX `fk_User_has_Mood_Mood1_idx` (`Mood_Id` ASC),
  INDEX `fk_User_has_Mood_User1_idx` (`User_Id` ASC),
  CONSTRAINT `fk_User_has_Mood_User1`
    FOREIGN KEY (`User_Id`)
    REFERENCES `app-doo-dah`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Mood_Mood1`
    FOREIGN KEY (`Mood_Id`)
    REFERENCES `app-doo-dah`.`Mood` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`Activity_has_Mood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`Activity_has_Mood` (
  `Activity_Id` INT NOT NULL,
  `Mood_Id` INT NOT NULL,
  PRIMARY KEY (`Activity_Id`, `Mood_Id`),
  INDEX `fk_Activity_has_Mood_Mood1_idx` (`Mood_Id` ASC),
  INDEX `fk_Activity_has_Mood_Activity1_idx` (`Activity_Id` ASC),
  CONSTRAINT `fk_Activity_has_Mood_Activity1`
    FOREIGN KEY (`Activity_Id`)
    REFERENCES `app-doo-dah`.`Activity` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Activity_has_Mood_Mood1`
    FOREIGN KEY (`Mood_Id`)
    REFERENCES `app-doo-dah`.`Mood` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`UserPreferences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`UserPreferences` (
  `Id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `app-doo-dah`.`User_has_UserPreferences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `app-doo-dah`.`User_has_UserPreferences` (
  `User_Id` INT NOT NULL,
  `UserPreferences_Id` INT NOT NULL,
  `Value` VARCHAR(45) NULL,
  PRIMARY KEY (`User_Id`, `UserPreferences_Id`),
  INDEX `fk_User_has_UserPreferences_UserPreferences1_idx` (`UserPreferences_Id` ASC),
  INDEX `fk_User_has_UserPreferences_User1_idx` (`User_Id` ASC),
  CONSTRAINT `fk_User_has_UserPreferences_User1`
    FOREIGN KEY (`User_Id`)
    REFERENCES `app-doo-dah`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_UserPreferences_UserPreferences1`
    FOREIGN KEY (`UserPreferences_Id`)
    REFERENCES `app-doo-dah`.`UserPreferences` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
