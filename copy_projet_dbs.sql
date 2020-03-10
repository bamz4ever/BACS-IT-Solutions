-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema aplplication_dbs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aplplication_dbs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aplplication_dbs` DEFAULT CHARACTER SET utf8mb4 ;
USE `aplplication_dbs` ;

-- -----------------------------------------------------
-- Table `aplplication_dbs`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`users` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`users` (
  `users_id` INT NOT NULL AUTO_INCREMENT,
  `users_name` VARCHAR(45) NOT NULL,
  `users_pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`users_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`field`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`field` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`field` (
  `field_id` INT NOT NULL AUTO_INCREMENT,
  `field_name` VARCHAR(45) NULL,
  PRIMARY KEY (`field_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`program` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`program` (
  `program_id` INT NOT NULL AUTO_INCREMENT,
  `program_enrolled` VARCHAR(45) NULL,
  PRIMARY KEY (`program_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`status` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`status` (
  `status_id` INT NOT NULL AUTO_INCREMENT,
  `student_status` VARCHAR(45) NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`school` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`school` (
  `school_id` INT NOT NULL AUTO_INCREMENT,
  `school_name` VARCHAR(45) NULL,
  PRIMARY KEY (`school_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`student` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_fname` VARCHAR(45) NULL,
  `student_introduction` LONGTEXT NULL,
  `users_id` INT NOT NULL,
  `field_id` INT NOT NULL,
  `program_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `school_id` INT NOT NULL,
  `student_email` VARCHAR(45) NULL,
  PRIMARY KEY (`student_id`),
  INDEX `fk_student_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_student_field1_idx` (`field_id` ASC) VISIBLE,
  INDEX `fk_student_program1_idx` (`program_id` ASC) VISIBLE,
  INDEX `fk_student_status1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_student_school1_idx` (`school_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `aplplication_dbs`.`users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_field1`
    FOREIGN KEY (`field_id`)
    REFERENCES `aplplication_dbs`.`field` (`field_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_program1`
    FOREIGN KEY (`program_id`)
    REFERENCES `aplplication_dbs`.`program` (`program_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `aplplication_dbs`.`status` (`status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_school1`
    FOREIGN KEY (`school_id`)
    REFERENCES `aplplication_dbs`.`school` (`school_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`location` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(45) NULL,
  PRIMARY KEY (`location_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`company` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`company` (
  `company_id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NULL,
  `company_description` LONGTEXT NULL,
  `location_id` INT NOT NULL,
  `field_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`company_id`),
  INDEX `fk_company_location_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_company_field1_idx` (`field_id` ASC) VISIBLE,
  INDEX `fk_company_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_company_location`
    FOREIGN KEY (`location_id`)
    REFERENCES `aplplication_dbs`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_field1`
    FOREIGN KEY (`field_id`)
    REFERENCES `aplplication_dbs`.`field` (`field_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_company_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `aplplication_dbs`.`users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`job_cat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`job_cat` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`job_cat` (
  `job_cat_id` INT NOT NULL AUTO_INCREMENT,
  `job_cat_name` VARCHAR(45) NULL,
  PRIMARY KEY (`job_cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`post_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`post_status` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`post_status` (
  `post_status_id` INT NOT NULL AUTO_INCREMENT,
  `post_status_name` VARCHAR(45) NULL,
  PRIMARY KEY (`post_status_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`post` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`post` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `job_title` VARCHAR(45) NULL,
  `job_description` LONGTEXT NULL,
  `post_date` DATE NULL,
  `post_end_date` DATE NULL,
  `job_cat_id` INT NOT NULL,
  `field_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `post_status_id` INT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_post_job_cat1_idx` (`job_cat_id` ASC) VISIBLE,
  INDEX `fk_post_field1_idx` (`field_id` ASC) VISIBLE,
  INDEX `fk_post_location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_post_company1_idx` (`company_id` ASC) VISIBLE,
  INDEX `fk_post_post_status1_idx` (`post_status_id` ASC) VISIBLE,
  CONSTRAINT `fk_post_job_cat1`
    FOREIGN KEY (`job_cat_id`)
    REFERENCES `aplplication_dbs`.`job_cat` (`job_cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_field1`
    FOREIGN KEY (`field_id`)
    REFERENCES `aplplication_dbs`.`field` (`field_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `aplplication_dbs`.`location` (`location_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `aplplication_dbs`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_post_post_status1`
    FOREIGN KEY (`post_status_id`)
    REFERENCES `aplplication_dbs`.`post_status` (`post_status_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`application` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`application` (
  `application_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`application_id`),
  INDEX `fk_application_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_application_post1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_application_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `aplplication_dbs`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `aplplication_dbs`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`payment_cat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`payment_cat` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`payment_cat` (
  `payment_cat_id` INT NOT NULL AUTO_INCREMENT,
  `payment_cat_name` VARCHAR(45) NULL,
  PRIMARY KEY (`payment_cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`payment` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`payment` (
  `payment_id` INT NOT NULL AUTO_INCREMENT,
  `payment_start_date` DATE NULL,
  `payment_end_date` DATE NULL,
  `payment_cat_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  PRIMARY KEY (`payment_id`),
  INDEX `fk_payment_payment_cat1_idx` (`payment_cat_id` ASC) VISIBLE,
  INDEX `fk_payment_company1_idx` (`company_id` ASC) VISIBLE,
  INDEX `fk_payment_post1_idx` (`post_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_payment_cat1`
    FOREIGN KEY (`payment_cat_id`)
    REFERENCES `aplplication_dbs`.`payment_cat` (`payment_cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `aplplication_dbs`.`company` (`company_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_post1`
    FOREIGN KEY (`post_id`)
    REFERENCES `aplplication_dbs`.`post` (`post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`log` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`log` (
  `log_id` INT NOT NULL AUTO_INCREMENT,
  `log_event_time` DATE NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`log_id`),
  INDEX `fk_log_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_log_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `aplplication_dbs`.`users` (`users_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`document` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`document` (
  `document_id` INT NOT NULL AUTO_INCREMENT,
  `document_name` VARCHAR(100) NULL,
  `document` BINARY(254) NULL,
  `document_url` VARCHAR(200) NULL,
  PRIMARY KEY (`document_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `aplplication_dbs`.`application_document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `aplplication_dbs`.`application_document` ;

CREATE TABLE IF NOT EXISTS `aplplication_dbs`.`application_document` (
  `application_document_id` INT NOT NULL AUTO_INCREMENT,
  `document_document_id` INT NOT NULL,
  `application_application_id` INT NOT NULL,
  PRIMARY KEY (`application_document_id`),
  INDEX `fk_application_document_document1_idx` (`document_document_id` ASC) VISIBLE,
  INDEX `fk_application_document_application1_idx` (`application_application_id` ASC) VISIBLE,
  CONSTRAINT `fk_application_document_document1`
    FOREIGN KEY (`document_document_id`)
    REFERENCES `aplplication_dbs`.`document` (`document_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_document_application1`
    FOREIGN KEY (`application_application_id`)
    REFERENCES `aplplication_dbs`.`application` (`application_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
