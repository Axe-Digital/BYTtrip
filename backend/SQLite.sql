-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema travel booking chatbot
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema travel booking chatbot
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `travel booking chatbot` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `travel booking chatbot` ;

-- -----------------------------------------------------
-- Table `travel booking chatbot`.`hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel booking chatbot`.`hotel` (
  `hotel_id` INT NOT NULL AUTO_INCREMENT,
  `created` VARCHAR(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `nom_hotel` VARCHAR(45) NOT NULL,
  `ville_hotel` VARCHAR(45) NOT NULL,
  `lieu_hotel` VARCHAR(45) NOT NULL,
  `num_service_hotel` INT NULL,
  PRIMARY KEY (`hotel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel booking chatbot`.`agence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel booking chatbot`.`agence` (
  `agence_id` INT NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nom_agence` VARCHAR(45) NOT NULL,
  `ville_agence` VARCHAR(45) NOT NULL,
  `num_service_agence` INT NOT NULL,
  `moyen_transport` ENUM("Bus", "Train", "Bus et Train") NOT NULL DEFAULT 'BUS',
  PRIMARY KEY (`agence_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel booking chatbot`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel booking chatbot`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel booking chatbot`.`response`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel booking chatbot`.`response` (
  `response_id` INT NOT NULL AUTO_INCREMENT,
  `created` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `type_voyage` ENUM("Voyage Affaire", "Voyage Sejour") NOT NULL DEFAULT 'Voyage Sejour',
  `moyen_transport` ENUM("Bus", "Train") NOT NULL DEFAULT 'Bus',
  `agence_depart` ENUM("Douala", "Yaounde", "Edea", "Bafoussam") NULL,
  `agence_d'arrivee` ENUM("Douala", "Yaounde", "Edea", "Bafoussam") NULL,
  `reservation` ENUM("OUI", "NON") NULL,
  `hotel_id` INT NOT NULL,
  `agence_id` INT NOT NULL,
  PRIMARY KEY (`response_id`, `agence_id`, `hotel_id`),
  INDEX `fk_voyage_hotel_idx` (`hotel_id` ASC) VISIBLE,
  INDEX `fk_voyage_agence1_idx` (`agence_id` ASC) VISIBLE,
  CONSTRAINT `fk_voyage_hotel`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `travel booking chatbot`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voyage_agence1`
    FOREIGN KEY (`agence_id`)
    REFERENCES `travel booking chatbot`.`agence` (`agence_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel booking chatbot`.`RESERVATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel booking chatbot`.`RESERVATION` (
  `reservation_id` INT NULL,
  `content` VARCHAR(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  `created` TIMESTAMP NOT NULL,
  PRIMARY KEY (`reservation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `travel booking chatbot`.`user_1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `travel booking chatbot`.`user_1` (
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP);

USE `new_schema` ;

-- -----------------------------------------------------
-- Table `new_schema`.`ville`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema`.`ville` (
  `ville_id` INT NOT NULL AUTO_INCREMENT,
  `created` TIMESTAMP NOT NULL,
  `nom_ville` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ville_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema`.`synthese`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema`.`synthese` (
  `synthese_id` INT NOT NULL,
  `response_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`synthese_id`, `response_id`, `user_id`),
  INDEX `fk_synthese_response1_idx` (`response_id` ASC) VISIBLE,
  INDEX `fk_synthese_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_synthese_response1`
    FOREIGN KEY (`response_id`)
    REFERENCES `travel booking chatbot`.`response` (`response_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_synthese_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `travel booking chatbot`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema`.`questions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_schema`.`questions` (
  `questions_id` INT NOT NULL,
  `created` TIMESTAMP NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`questions_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
