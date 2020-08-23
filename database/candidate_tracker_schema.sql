-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema candidate_tracker
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema candidate_tracker
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `candidate_tracker` DEFAULT CHARACTER SET utf8 ;
USE `candidate_tracker` ;

-- -----------------------------------------------------
-- Table `candidate_tracker`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`roles` (
  `role` VARCHAR(20) NOT NULL,
  `role_string` VARCHAR(30) NOT NULL,
  `h_level` FLOAT NOT NULL,
  PRIMARY KEY (`role`),
  UNIQUE INDEX `role_UNIQUE` (`role` ASC) VISIBLE,
  UNIQUE INDEX `role_string_UNIQUE` (`role_string` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `r_id` VARCHAR(20) NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `contact` VARCHAR(10) NULL DEFAULT NULL,
  `is_active` TINYINT NULL DEFAULT '1',
  `manager_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_role_idx` (`r_id` ASC) VISIBLE,
  CONSTRAINT `fk_role`
    FOREIGN KEY (`r_id`)
    REFERENCES `candidate_tracker`.`roles` (`role`),
    CONSTRAINT `fk_manager_id`
    FOREIGN KEY (`manager_id`)
    REFERENCES `candidate_tracker`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`candidate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`candidate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `recruiter_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `contact` VARCHAR(10) NULL DEFAULT NULL,
  `address` TEXT NULL DEFAULT NULL,
  `preferred_loc` VARCHAR(45) NULL DEFAULT NULL,
  `ectc` INT NULL DEFAULT NULL,
  `ctct` INT NULL DEFAULT NULL,
  `source` VARCHAR(45) NULL DEFAULT NULL,
  `cv` MEDIUMBLOB NULL DEFAULT NULL,
  `current_round` INT NULL DEFAULT 0,
  `status` ENUM('ready', 'hold', 'hired', 'rejected') NULL DEFAULT 'ready',
  `last_updated` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_recruiter_id_idx` (`recruiter_id` ASC) VISIBLE,
  CONSTRAINT `fk_recruiter_id`
    FOREIGN KEY (`recruiter_id`)
    REFERENCES `candidate_tracker`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`skills` (
  `skill_id` INT NOT NULL AUTO_INCREMENT,
  `skill_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`skill_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`candidate_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`candidate_skills` (
  `candidate_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  PRIMARY KEY (`candidate_id`, `skill_id`),
  INDEX `fk_skill_id_idx` (`skill_id` ASC) VISIBLE,
  CONSTRAINT `fk_candidate_id`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `candidate_tracker`.`candidate` (`id`),
  CONSTRAINT `fk_skill_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `candidate_tracker`.`skills` (`skill_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`interview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`interview` (
  `interview_id` INT NOT NULL AUTO_INCREMENT,
  `candidate_id` INT NOT NULL,
  `interviewer_id` INT NOT NULL,
  `start_time` DATETIME NULL DEFAULT NULL,
  `end_time` DATETIME NULL DEFAULT NULL,
  `feedback` TEXT NULL DEFAULT NULL,
  `updated_by` INT NULL DEFAULT NULL,
  `round_no` INT NULL DEFAULT NULL,
  `approval_status` ENUM('recruiter_approved', 'interviewer_approved', 'both_approved') NULL DEFAULT 'recruiter_approved',
  `is_complete` TINYINT NULL DEFAULT '0',
  PRIMARY KEY (`interview_id`),
  INDEX `fk_interviewer_id_idx` (`interviewer_id` ASC) VISIBLE,
  INDEX `fk_candidate_id_idx` (`candidate_id` ASC) VISIBLE,
  INDEX `fk_updated_by_idx` (`updated_by` ASC) VISIBLE,
  CONSTRAINT `fk_interview_candidate_id`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `candidate_tracker`.`candidate` (`id`),
  CONSTRAINT `fk_interview_interviewer_id`
    FOREIGN KEY (`interviewer_id`)
    REFERENCES `candidate_tracker`.`user` (`id`),
  CONSTRAINT `fk_updated_by`
    FOREIGN KEY (`updated_by`)
    REFERENCES `candidate_tracker`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`interviewer_skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`interviewer_skills` (
  `interviewer_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  PRIMARY KEY (`interviewer_id`, `skill_id`),
  INDEX `fk_skill_id_idx` (`skill_id` ASC) VISIBLE,
  CONSTRAINT `fk_interviewer_id`
    FOREIGN KEY (`interviewer_id`)
    REFERENCES `candidate_tracker`.`user` (`id`),
  CONSTRAINT `fk_skill_interviewer_id`
    FOREIGN KEY (`skill_id`)
    REFERENCES `candidate_tracker`.`skills` (`skill_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `candidate_tracker`.`user_closure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `candidate_tracker`.`user_closure` (
  `mapping_id` INT NOT NULL AUTO_INCREMENT,
  `parent_id` INT NULL DEFAULT NULL,
  `child_id` INT NULL DEFAULT NULL,
  `depth` INT NULL DEFAULT NULL,
  PRIMARY KEY (`mapping_id`),
  CONSTRAINT `fk_parent_id`
    FOREIGN KEY (`parent_id`)
    REFERENCES `candidate_tracker`.`user` (`id`),
  CONSTRAINT `fk_child_id`
    FOREIGN KEY (`child_id`)
    REFERENCES `candidate_tracker`.`user` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `candidate_tracker`;

DELIMITER $$
USE `candidate_tracker`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `candidate_tracker`.`user_AFTER_INSERT`
AFTER INSERT ON `candidate_tracker`.`user`
FOR EACH ROW
BEGIN

insert into user_closure(parent_id,child_id,depth) values (new.id, new.id, 0);

INSERT INTO user_closure(parent_id, child_id, depth)
SELECT p.parent_id, c.child_id, p.depth+c.depth+1
FROM user_closure p, user_closure c
WHERE p.child_id = new.manager_id AND c.parent_id = new.id;

END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
