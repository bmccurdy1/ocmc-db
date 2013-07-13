SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `ocmc` ;
CREATE SCHEMA IF NOT EXISTS `ocmc` DEFAULT CHARACTER SET utf8 ;
USE `ocmc` ;

-- -----------------------------------------------------
-- Table `ocmc`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocmc`.`employee` ;

CREATE  TABLE IF NOT EXISTS `ocmc`.`employee` (
  `empID` INT(11) NOT NULL ,
  `empFName` VARCHAR(15) NOT NULL ,
  `empLName` VARCHAR(15) NOT NULL ,
  `empMName` VARCHAR(15) NULL DEFAULT NULL ,
  `empEmail` VARCHAR(45) NULL DEFAULT NULL ,
  `empPhone` VARCHAR(15) NULL DEFAULT NULL ,
  `empTitle` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`empID`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `employeeID_UNIQUE` ON `ocmc`.`employee` (`empID` ASC) ;


-- -----------------------------------------------------
-- Table `ocmc`.`change_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocmc`.`change_request` ;

CREATE  TABLE IF NOT EXISTS `ocmc`.`change_request` (
  `chgID` INT(11) NOT NULL ,
  `requestorID` INT(11) NOT NULL ,
  `risk` VARCHAR(12) NOT NULL ,
  `chgType` VARCHAR(15) NOT NULL ,
  `system` VARCHAR(20) NULL DEFAULT NULL ,
  `server` VARCHAR(45) NULL DEFAULT NULL ,
  `testerID` INT(11) NULL DEFAULT NULL ,
  `implementerID` INT(11) NULL DEFAULT NULL ,
  `chgDeveloperID` INT(11) NULL DEFAULT NULL ,
  `implPlans` VARCHAR(255) NULL DEFAULT NULL ,
  `backoutPlans` VARCHAR(255) NULL DEFAULT NULL ,
  `chgBenefits` VARCHAR(255) NULL DEFAULT NULL ,
  `chgDesc` VARCHAR(255) NULL DEFAULT NULL ,
  `riskAssessment` VARCHAR(255) NULL DEFAULT NULL ,
  `outageReq` CHAR(1) NULL DEFAULT NULL ,
  `priority` VARCHAR(45) NULL DEFAULT NULL ,
  `beginDateTime` TIMESTAMP NULL DEFAULT NULL ,
  `endDateTime` TIMESTAMP NULL DEFAULT NULL ,
  `testCase` VARCHAR(255) NULL DEFAULT NULL ,
  `testResults` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`chgID`) ,
  CONSTRAINT `empID`
    FOREIGN KEY (`implementerID` )
    REFERENCES `ocmc`.`employee` (`empID` )
    ON DELETE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `changeID_UNIQUE` ON `ocmc`.`change_request` (`chgID` ASC) ;

CREATE INDEX `empID_idx` ON `ocmc`.`change_request` (`requestorID` ASC) ;

CREATE INDEX `empID_idx1` ON `ocmc`.`change_request` (`testerID` ASC) ;

CREATE INDEX `empID_idx2` ON `ocmc`.`change_request` (`implementerID` ASC) ;

CREATE INDEX `empID_idx3` ON `ocmc`.`change_request` (`chgDeveloperID` ASC) ;

CREATE INDEX `priority_idx` ON `ocmc`.`change_request` (`priority` ASC) ;


-- -----------------------------------------------------
-- Table `ocmc`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocmc`.`company` ;

CREATE  TABLE IF NOT EXISTS `ocmc`.`company` (
  `companyID` INT(11) NOT NULL AUTO_INCREMENT ,
  `companyName` VARCHAR(45) NOT NULL ,
  `companyDesc` VARCHAR(45) NULL DEFAULT NULL ,
  `companyPhone` VARCHAR(15) NULL DEFAULT NULL ,
  `companyAddress1` VARCHAR(45) NULL DEFAULT NULL ,
  `companyAddress2` VARCHAR(45) NULL DEFAULT NULL ,
  `companyCity` VARCHAR(45) NULL DEFAULT NULL ,
  `companyState` VARCHAR(45) NULL DEFAULT NULL ,
  `companyPostalCode` VARCHAR(45) NULL DEFAULT NULL ,
  `companyCountry` VARCHAR(45) NULL DEFAULT NULL )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `companyID_UNIQUE` ON `ocmc`.`company` (`companyID` ASC) ;


-- -----------------------------------------------------
-- Table `ocmc`.`priority`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocmc`.`priority` ;

CREATE  TABLE IF NOT EXISTS `ocmc`.`priority` (
  `priorityID` INT(11) NOT NULL AUTO_INCREMENT ,
  `priorityName` VARCHAR(45) NOT NULL ,
  `priorityDesc` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`priorityID`) )
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `priorityID_UNIQUE` ON `ocmc`.`priority` (`priorityID` ASC) ;

USE `ocmc` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
