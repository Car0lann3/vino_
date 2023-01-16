-- MySQL Script generated by MySQL Workbench
-- Mon Jan 16 13:47:24 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema 
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role` (
  `rol_id` INT NOT NULL AUTO_INCREMENT,
  `rol_nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rol_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `uti_id` INT NOT NULL AUTO_INCREMENT,
  `uti_courriel` VARCHAR(100) NOT NULL,
  `uti_mdp` VARCHAR(255) NOT NULL,
  `uti_nom` VARCHAR(100) NOT NULL,
  `uti_prenom` VARCHAR(100) NOT NULL,
  `uti_dcc` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uti_rol_id` INT NOT NULL,
  PRIMARY KEY (`uti_id`),
  CONSTRAINT `fk_utilisateur_role`
    FOREIGN KEY (`uti_rol_id`)
    REFERENCES `role` (`rol_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `type` (
  `typ_id` INT NOT NULL AUTO_INCREMENT,
  `typ_nom` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`typ_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bouteille_SAQ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bouteille_SAQ` (
  `bout_id` INT NOT NULL AUTO_INCREMENT,
  `bout_nom` VARCHAR(200) NOT NULL,
  `bout_image` VARCHAR(200) NOT NULL,
  `bout_code_saq` VARCHAR(50) NOT NULL,
  `bout_pays` VARCHAR(50) NOT NULL,
  `bout_description` VARCHAR(200) NOT NULL,
  `bout_prix_saq` FLOAT NULL,
  `bout_url_saq` VARCHAR(200) NOT NULL,
  `bout_url_img` VARCHAR(200) NOT NULL,
  `bout_format` VARCHAR(20) NOT NULL,
  `bout_type_id` INT NOT NULL,
  PRIMARY KEY (`bout_id`),
  CONSTRAINT `fk_bouteille_type`
    FOREIGN KEY (`bout_type_id`)
    REFERENCES `type` (`typ_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `cellier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cellier` (
  `cel_id` INT NOT NULL AUTO_INCREMENT,
  `cel_nom` VARCHAR(200) NOT NULL,
  `cel_uti_id` INT NOT NULL,
  PRIMARY KEY (`cel_id`),
  CONSTRAINT `fk_cellier_utilisateur1`
    FOREIGN KEY (`cel_uti_id`)
    REFERENCES `utilisateur` (`uti_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `bouteille_du_cellier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bouteille_du_cellier` (
  `bdc_id` INT NOT NULL AUTO_INCREMENT,
  `bdc_cel_id` INT NOT NULL,
  `bdc_bout_id` INT NOT NULL,
  `bdc_quantite` INT NOT NULL,
  `bdc_notes` VARCHAR(200) NOT NULL,
  `bdc_date_achat` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bdc_millesime` INT NOT NULL,
  `bdc_garde_jusqua` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`bdc_id`, `bdc_cel_id`, `bdc_bout_id`),
  CONSTRAINT `fk_cellier_has_bouteille_cellier1`
    FOREIGN KEY (`bdc_cel_id`)
    REFERENCES `cellier` (`cel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cellier_has_bouteille_bouteille1`
    FOREIGN KEY (`bdc_bout_id`)
    REFERENCES `bouteille_SAQ` (`bout_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
