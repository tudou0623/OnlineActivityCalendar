SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `oacal` ;
CREATE SCHEMA IF NOT EXISTS `oacal` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `oacal` ;

-- -----------------------------------------------------
-- Table `oacal`.`oacal_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_location` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_location` (
  `locationID` INT NOT NULL AUTO_INCREMENT,
  `locationName` VARCHAR(45) NULL ,
  `latitude` DOUBLE NULL ,
  `longitude` DOUBLE NULL ,
  PRIMARY KEY (`locationID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_university`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_university` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_university` (
  `universityID` INT NOT NULL AUTO_INCREMENT,
  `locationID` INT NULL ,
  `universityName` VARCHAR(45) NULL ,
  PRIMARY KEY (`universityID`) ,
  CONSTRAINT `university_location`
    FOREIGN KEY (`locationID` )
    REFERENCES `oacal`.`oacal_location` (`locationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_school` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_school` (
  `schoolID` INT NOT NULL AUTO_INCREMENT,
  `universityID` INT NULL ,
  `locationID` INT NULL ,
  `schoolName` VARCHAR(45) NULL ,
  PRIMARY KEY (`schoolID`) ,
  INDEX `school_university_idx` (`universityID` ASC) ,
  CONSTRAINT `school_university`
    FOREIGN KEY (`universityID` )
    REFERENCES `oacal`.`oacal_university` (`universityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `school_location`
    FOREIGN KEY (`locationID` )
    REFERENCES `oacal`.`oacal_location` (`locationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `oacal`.`oacal_organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_organization` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_organization` (
  `orgID` INT NOT NULL AUTO_INCREMENT,
  `loginID` VARCHAR(45) NULL ,
  `password` VARCHAR(45) NULL ,
  `orgName` VARCHAR(45) NULL ,
  `briefIntro` VARCHAR(140) NULL ,
  `registerTime` DATETIME NULL ,
  `lastLoginTime` DATETIME NULL ,
  `loginCount` INT NULL ,
  `orgRank` INT NULL ,
  `orgImg` BLOB NULL ,
  `description` BLOB NULL ,
  PRIMARY KEY (`orgID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table oacal_user`oacal`.`oacal_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_user` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `loginID` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NULL ,
  `userName` VARCHAR(45) NULL ,
  `signature` VARCHAR(45) NULL ,
  `gender` CHAR(1) NULL ,
  `birthTime` DATETIME NULL ,
  `registerTime` DATETIME NULL ,
  `lastLoginTime` DATETIME NULL ,
  `loginCount` INT NULL ,
  `userRank` INT NULL ,
  `userImg` BLOB NULL ,
  `description` BLOB NULL ,
  PRIMARY KEY (`userID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_activities` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_activities` (
  `activityID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NULL ,
  `orgID` INT NULL ,
  `locationID` INT NULL ,
  `capacity` INT NULL ,
  `publishTime` DATETIME NULL ,
  `startTime` DATETIME NULL ,
  `endTime` DATETIME NULL ,
  `privacy` INT NULL ,
  `posterImg` BLOB NULL ,
  `description` BLOB NULL ,
  PRIMARY KEY (`activityID`) ,
  INDEX `activity_org_idx` (`orgID` ASC) ,
  INDEX `activity_user_idx` (`userID` ASC) ,
  CONSTRAINT `activity_org`
    FOREIGN KEY (`orgID` )
    REFERENCES `oacal`.`oacal_organization` (`orgID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `activity_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION ,
  CONSTRAINT `activity_location`
    FOREIGN KEY (`locationID` )
    REFERENCES `oacal`.`oacal_location` (`locationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_activity_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_activity_image` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_activity_image` (
  `imgID` INT NOT NULL AUTO_INCREMENT,
  `activityID` INT NOT NULL ,
  `imgName` VARCHAR(45) NULL ,
  `img` BLOB NULL ,
  PRIMARY KEY (`imgID`) ,
  INDEX `img_activity_idx` (`activityID` ASC) ,
  CONSTRAINT `img_activity`
    FOREIGN KEY (`activityID` )
    REFERENCES `oacal`.`oacal_activities` (`activityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_attend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_attend` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_attend` (
  `attendID` INT NOT NULL AUTO_INCREMENT,
  `activityID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `signUpTime` DATETIME NULL ,
  PRIMARY KEY (`attendID`) ,
  INDEX `attend_activity_idx` (`activityID` ASC) ,
  INDEX `attend_user_idx` (`userID` ASC) ,
  CONSTRAINT `attend_activity`
    FOREIGN KEY (`activityID` )
    REFERENCES `oacal`.`oacal_activities` (`activityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `attend_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_invite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_invite` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_invite` (
  `inviteID` INT NOT NULL AUTO_INCREMENT,
  `activityID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `orgID` INT NULL ,
  `invitedUserID` INT NULL ,
  `inviteState` CHAR(4) NULL ,
  `raiseTime` DATETIME NULL ,
  PRIMARY KEY (`inviteID`) ,
  INDEX `invite_activity_idx` (`activityID` ASC) ,
  INDEX `invite_user_idx` (`userID` ASC) ,
  INDEX `invite_user2_idx` (`inviteduserID` ASC) ,
  INDEX `invite_org_idx` (`orgID` ASC) ,
  CONSTRAINT `invite_activity`
    FOREIGN KEY (`activityID` )
    REFERENCES `oacal`.`oacal_activities` (`activityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invite_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invite_user2`
    FOREIGN KEY (`inviteduserID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invite_org`
    FOREIGN KEY (`orgID` )
    REFERENCES `oacal`.`oacal_organization` (`orgID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_mood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_mood` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_mood` (
  `moodID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `moodContent` VARCHAR(200) NULL ,
  `publishTime` DATETIME NULL ,
  PRIMARY KEY (`moodID`) ,
  INDEX `mood_user_idx` (`userID` ASC) ,
  CONSTRAINT `mood_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_mood_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_mood_comment` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_mood_comment` (
  `commentID` INT NOT NULL AUTO_INCREMENT,
  `moodID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `comment` VARCHAR(200) NULL ,
  `commentTime` DATETIME NULL ,
  PRIMARY KEY (`commentID`) ,
  INDEX `comment_mood_idx` (`moodID` ASC) ,
  INDEX `comment_user_idx` (`userID` ASC) ,
  CONSTRAINT `comment_mood`
    FOREIGN KEY (`moodID` )
    REFERENCES `oacal`.`oacal_mood` (`moodID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_friendship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_friendship` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_friendship` (
  `relationID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `friendID` INT NOT NULL ,
  `sinceTime` DATETIME NULL ,
  PRIMARY KEY (`relationID`) ,
  INDEX `friendship_user_idx` (`userID` ASC) ,
  INDEX `friendship_user2_idx` (`friendID` ASC) ,
  CONSTRAINT `friendship_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `friendship_user2`
    FOREIGN KEY (`friendID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_care`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_care` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_care` (
  `careID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `caredID` INT NOT NULL ,
  `sinceTime` DATETIME NULL ,
  PRIMARY KEY (`careID`) ,
  INDEX `care_user_idx` (`userID` ASC) ,
  INDEX `care_user2_idx` (`caredID` ASC) ,
  CONSTRAINT `care_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `care_user2`
    FOREIGN KEY (`caredID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_user_edu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_user_edu` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_user_edu` (
  `eduID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `universityID` INT NULL ,
  `schoolID` INT NULL ,
  `enterDate` DATETIME NULL ,
  PRIMARY KEY (`eduID`) ,
  INDEX `edu_user_idx` (`userID` ASC) ,
  INDEX `edu_school_idx` (`schoolID` ASC) ,
  INDEX `edu_university_idx` (`universityID` ASC) ,
  CONSTRAINT `edu_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `edu_school`
    FOREIGN KEY (`schoolID` )
    REFERENCES `oacal`.`oacal_school` (`schoolID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `edu_university`
    FOREIGN KEY (`universityID` )
    REFERENCES `oacal`.`oacal_university` (`universityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_user_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_user_info` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_user_info` (
  `infoID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `visitedCount` INT NULL ,
  `score` INT NULL ,
  `money` INT NULL ,
  `daySeries` INT NULL ,
  `privacy` CHAR(5) NULL ,
  PRIMARY KEY (`infoID`) ,
  INDEX `fk_oacal_user_info_oacal_user1_idx` (`userID` ASC) ,
  CONSTRAINT `info_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_visit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_visit` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_visit` (
  `visitID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `visitedID` INT NOT NULL ,
  `visitTime` DATETIME NULL ,
  PRIMARY KEY (`visitID`) ,
  INDEX `visit_user_idx` (`userID` ASC) ,
  INDEX `visit_user2_idx` (`visitedID` ASC) ,
  CONSTRAINT `visit_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `visit_user2`
    FOREIGN KEY (`visitedID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `oacal`.`oacal_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_group` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_group` (
  `groupID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NOT NULL ,
  `friendID` INT NOT NULL ,
  `groupName` VARCHAR(20) NOT NULL ,
  `addTime` DATETIME NULL ,
  PRIMARY KEY (`groupID`) ,
  INDEX `group_user_idx` (`userID` ASC) ,
  INDEX `group_friend_idx` (`friendID` ASC) ,
  CONSTRAINT `group_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `group_friend`
    FOREIGN KEY (`friendID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `oacal` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
