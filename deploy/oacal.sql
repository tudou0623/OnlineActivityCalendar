SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `oacal` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `oacal` ;

-- -----------------------------------------------------
-- Table `oacal`.`oacal_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_user` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_user` (
  `userID` INT NOT NULL AUTO_INCREMENT ,
  `loginID` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(80) NULL ,
  `userName` VARCHAR(45) NULL ,
  `gender` VARCHAR(1) NULL ,
  `birthTime` DATETIME NULL ,
  `registerTime` DATETIME NULL ,
  `phoneNumber` VARCHAR(45) NULL ,
  `fetion` VARCHAR(45) NULL ,
  `signature` VARCHAR(140) NULL ,
  `isAccountActivated` TINYINT(1) NOT NULL DEFAULT false ,
  `isOrganization` TINYINT(1) NOT NULL DEFAULT false ,
  `isCertifiedOrg` TINYINT(1) NOT NULL DEFAULT false ,
  PRIMARY KEY (`userID`) ,
  UNIQUE INDEX `loginID_UNIQUE` (`loginID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_location` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_location` (
  `locationID` INT NOT NULL AUTO_INCREMENT ,
  `locationName` VARCHAR(140) NOT NULL ,
  `latitude` DOUBLE NULL ,
  `longitude` DOUBLE NULL ,
  PRIMARY KEY (`locationID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_activities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_activities` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_activities` (
  `activityID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `activityLocationID` INT NULL ,
  `title` VARCHAR(140) NULL ,
  `atag` VARCHAR(45) NULL ,
  `capacity` INT NULL ,
  `publishTime` DATETIME NULL ,
  `startTime` DATETIME NULL ,
  `endTime` DATETIME NULL ,
  `privacyType` INT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
  `description` VARCHAR(10000) NULL ,
  `privacyTypeAttend` INT NULL ,
  `grantedLoginIDListAttend` VARCHAR(45) NULL ,
  PRIMARY KEY (`activityID`) ,
  INDEX `activity_user_idx` (`userID` ASC) ,
  INDEX `fk_oacal_activities_oacal_location1_idx` (`activityLocationID` ASC) ,
  CONSTRAINT `activity_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_activities_oacal_location1`
    FOREIGN KEY (`activityLocationID` )
    REFERENCES `oacal`.`oacal_location` (`locationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_activity_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_activity_image` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_activity_image` (
  `imgID` INT NOT NULL AUTO_INCREMENT ,
  `activityID` INT NOT NULL ,
  `imgName` VARCHAR(45) NULL ,
  `img` BLOB NULL ,
  `uploadTime` DATETIME NULL ,
  `description` VARCHAR(200) NULL ,
  `privacyType` INT NOT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
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
  `attendID` INT NOT NULL AUTO_INCREMENT ,
  `activityID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `registerTime` DATETIME NULL ,
  `privacyType` INT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
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
  `inviteID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `invitedUserID` INT NOT NULL ,
  `activityID` INT NOT NULL ,
  `inviteStatus` VARCHAR(5) NULL ,
  `dateTime` DATETIME NULL ,
  PRIMARY KEY (`inviteID`) ,
  INDEX `invite_activity_idx` (`activityID` ASC) ,
  INDEX `invite_user_idx` (`userID` ASC) ,
  INDEX `invite_user2_idx` (`invitedUserID` ASC) ,
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
    FOREIGN KEY (`invitedUserID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_mood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_mood` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_mood` (
  `moodID` INT NOT NULL AUTO_INCREMENT ,
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
  `commentID` INT NOT NULL AUTO_INCREMENT ,
  `moodID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `replyCommentID` INT NOT NULL ,
  `comment` VARCHAR(500) NULL ,
  `dateTime` DATETIME NULL ,
  PRIMARY KEY (`commentID`) ,
  INDEX `comment_mood_idx` (`moodID` ASC) ,
  INDEX `comment_user_idx` (`userID` ASC) ,
  INDEX `fk_oacal_mood_comment_oacal_mood_comment1_idx` (`replyCommentID` ASC) ,
  CONSTRAINT `comment_mood`
    FOREIGN KEY (`moodID` )
    REFERENCES `oacal`.`oacal_mood` (`moodID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `comment_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_mood_comment_oacal_mood_comment1`
    FOREIGN KEY (`replyCommentID` )
    REFERENCES `oacal`.`oacal_mood_comment` (`commentID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_friendship`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_friendship` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_friendship` (
  `relationID` INT NOT NULL AUTO_INCREMENT ,
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
-- Table `oacal`.`oacal_friend_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_friend_group` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_friend_group` (
  `groupID` INT NOT NULL AUTO_INCREMENT ,
  `creatorID` INT NOT NULL ,
  `groupName` VARCHAR(45) NOT NULL ,
  `createdTime` DATETIME NULL ,
  PRIMARY KEY (`groupID`) ,
  INDEX `fk_oacal_friendgroup_oacal_user1_idx` (`creatorID` ASC) ,
  CONSTRAINT `fk_oacal_friendgroup_oacal_user1`
    FOREIGN KEY (`creatorID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_care`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_care` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_care` (
  `careID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `caredID` INT NOT NULL ,
  `dateTime` DATETIME NULL ,
  `friendGroupID` INT NULL ,
  `remarkName` VARCHAR(45) NULL ,
  `doDisplay` TINYINT(1) NOT NULL DEFAULT false ,
  PRIMARY KEY (`careID`) ,
  INDEX `care_user_idx` (`userID` ASC) ,
  INDEX `care_user2_idx` (`caredID` ASC) ,
  INDEX `fk_oacal_care_oacal_friendgroup1_idx` (`friendGroupID` ASC) ,
  CONSTRAINT `care_user`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `care_user2`
    FOREIGN KEY (`caredID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `care_friendgroup`
    FOREIGN KEY (`friendGroupID` )
    REFERENCES `oacal`.`oacal_friend_group` (`groupID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_university`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_university` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_university` (
  `universityID` INT NOT NULL AUTO_INCREMENT ,
  `universityLocationID` INT NULL ,
  `universityName` VARCHAR(45) NOT NULL ,
  `description` VARCHAR(140) NULL ,
  PRIMARY KEY (`universityID`) ,
  INDEX `fk_oacal_university_oacal_location1_idx` (`universityLocationID` ASC) ,
  CONSTRAINT `fk_oacal_university_oacal_location1`
    FOREIGN KEY (`universityLocationID` )
    REFERENCES `oacal`.`oacal_location` (`locationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_school` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_school` (
  `schoolID` INT NOT NULL AUTO_INCREMENT ,
  `schoolLocationID` INT NULL ,
  `schoolName` VARCHAR(45) NOT NULL ,
  `universityID` INT NOT NULL ,
  `description` VARCHAR(140) NULL ,
  PRIMARY KEY (`schoolID`) ,
  INDEX `school_university_idx` (`universityID` ASC) ,
  INDEX `fk_oacal_school_oacal_location1_idx` (`schoolLocationID` ASC) ,
  CONSTRAINT `school_university`
    FOREIGN KEY (`universityID` )
    REFERENCES `oacal`.`oacal_university` (`universityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_school_oacal_location1`
    FOREIGN KEY (`schoolLocationID` )
    REFERENCES `oacal`.`oacal_location` (`locationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_user_edu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_user_edu` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_user_edu` (
  `eduID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `universityID` INT NOT NULL ,
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
  `infoID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `grade` INT NULL ,
  `score` INT NULL ,
  `money` INT NULL ,
  `daySeries` INT NULL ,
  `lastLoginTime` DATETIME NULL ,
  `lastLoginIP` VARCHAR(15) NULL ,
  `loginCount` INT NULL ,
  `status` VARCHAR(5) NULL ,
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
  `visitID` INT NOT NULL AUTO_INCREMENT ,
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
-- Table `oacal`.`oacal_attend_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_attend_image` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_attend_image` (
  `imgID` INT NOT NULL AUTO_INCREMENT ,
  `attendID` INT NOT NULL ,
  `imgName` VARCHAR(45) NULL ,
  `description` VARCHAR(200) NULL ,
  `img` BLOB NULL ,
  `uploadTime` DATETIME NULL ,
  `pricacyType` INT NOT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
  PRIMARY KEY (`imgID`) ,
  INDEX `fk_oacal_attend_image_oacal_attend1_idx` (`attendID` ASC) ,
  CONSTRAINT `attendimage_attend`
    FOREIGN KEY (`attendID` )
    REFERENCES `oacal`.`oacal_attend` (`attendID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_headportrait`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_headportrait` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_headportrait` (
  `imgID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `imgName` VARCHAR(45) NULL ,
  `description` VARCHAR(200) NULL ,
  `img` BLOB NULL ,
  `uploadTime` DATETIME NULL ,
  `isCurrent` TINYINT(1) NOT NULL ,
  PRIMARY KEY (`imgID`) ,
  INDEX `fk_oacal_headportrait_oacal_user1_idx` (`userID` ASC) ,
  CONSTRAINT `fk_oacal_headportrait_oacal_user1`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_image_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_image_comment` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_image_comment` (
  `commentID` INT NOT NULL AUTO_INCREMENT ,
  `imgID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `replyCommentID` INT NOT NULL ,
  `comment` VARCHAR(500) NULL ,
  `dateTime` DATETIME NULL ,
  PRIMARY KEY (`commentID`) ,
  INDEX `fk_oacal_image_comment_oacal_attend_image1_idx` (`imgID` ASC) ,
  INDEX `fk_oacal_image_comment_oacal_user1_idx` (`userID` ASC) ,
  INDEX `fk_oacal_image_comment_oacal_image_comment1_idx` (`replyCommentID` ASC) ,
  CONSTRAINT `fk_oacal_image_comment_oacal_attend_image1`
    FOREIGN KEY (`imgID` )
    REFERENCES `oacal`.`oacal_attend_image` (`imgID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_image_comment_oacal_user1`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_image_comment_oacal_image_comment1`
    FOREIGN KEY (`replyCommentID` )
    REFERENCES `oacal`.`oacal_image_comment` (`commentID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_activity_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_activity_comment` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_activity_comment` (
  `commentID` INT NOT NULL AUTO_INCREMENT ,
  `activityID` INT NOT NULL ,
  `userID` INT NOT NULL ,
  `replyCommentID` INT NOT NULL ,
  `comment` VARCHAR(500) NULL ,
  `dateTime` DATETIME NULL ,
  PRIMARY KEY (`commentID`) ,
  INDEX `fk_oacal_activity_comment_oacal_user1_idx` (`userID` ASC) ,
  INDEX `fk_oacal_activity_comment_oacal_activities1_idx` (`activityID` ASC) ,
  INDEX `fk_oacal_activity_comment_oacal_activity_comment1_idx` (`replyCommentID` ASC) ,
  CONSTRAINT `fk_oacal_activity_comment_oacal_user1`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_activity_comment_oacal_activities1`
    FOREIGN KEY (`activityID` )
    REFERENCES `oacal`.`oacal_activities` (`activityID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_oacal_activity_comment_oacal_activity_comment1`
    FOREIGN KEY (`replyCommentID` )
    REFERENCES `oacal`.`oacal_activity_comment` (`commentID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_message` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_message` (
  `messageID` INT NOT NULL AUTO_INCREMENT ,
  `receiverID` INT NOT NULL ,
  `type` VARCHAR(45) NOT NULL ,
  `foreignID` INT NOT NULL ,
  `isDealed` TINYINT(1) NOT NULL DEFAULT false ,
  `createdTime` DATETIME NULL ,
  `dealedTime` DATETIME NULL ,
  `msgDescription` VARCHAR(80) NULL ,
  PRIMARY KEY (`messageID`) ,
  INDEX `fk_oacal_message_oacal_user1_idx` (`receiverID` ASC) ,
  CONSTRAINT `fk_oacal_message_oacal_user1`
    FOREIGN KEY (`receiverID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_personalInfo_privacy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_personalInfo_privacy` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_personalInfo_privacy` (
  `privacyID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `privacyType` INT NOT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
  PRIMARY KEY (`privacyID`) ,
  INDEX `fk_oacal_personalInfo_privacy_oacal_user1_idx` (`userID` ASC) ,
  CONSTRAINT `fk_oacal_personalInfo_privacy_oacal_user1`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_friendList_privacy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_friendList_privacy` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_friendList_privacy` (
  `privacyID` INT NOT NULL AUTO_INCREMENT ,
  `userID` INT NOT NULL ,
  `privacyType` INT NOT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
  PRIMARY KEY (`privacyID`) ,
  INDEX `fk_oacal_friendList_privacy_oacal_user1_idx` (`userID` ASC) ,
  CONSTRAINT `fk_oacal_friendList_privacy_oacal_user1`
    FOREIGN KEY (`userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oacal`.`oacal_calendar_privacy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oacal`.`oacal_calendar_privacy` ;

CREATE  TABLE IF NOT EXISTS `oacal`.`oacal_calendar_privacy` (
  `privacyID` INT NOT NULL AUTO_INCREMENT ,
  `privacyType` INT NOT NULL ,
  `grantedLoginIDList` VARCHAR(1000) NULL ,
  `oacal_user_userID` INT NOT NULL ,
  PRIMARY KEY (`privacyID`) ,
  INDEX `fk_oacal_calendar_privacy_oacal_user1_idx` (`oacal_user_userID` ASC) ,
  CONSTRAINT `fk_oacal_calendar_privacy_oacal_user1`
    FOREIGN KEY (`oacal_user_userID` )
    REFERENCES `oacal`.`oacal_user` (`userID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `oacal` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
