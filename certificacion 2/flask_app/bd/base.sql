-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema certificacion2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema certificacion2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `certificacion2` DEFAULT CHARACTER SET utf8 ;
USE `certificacion2` ;

-- -----------------------------------------------------
-- Table `certificacion2`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacion2`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `certificacion2`.`viajes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacion2`.`viajes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `destino` VARCHAR(255) NULL DEFAULT NULL,
  `fecha_inicio` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_fin` VARCHAR(45) NULL DEFAULT NULL,
  `Itinerario` TEXT NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT NULL,
  `updated_At` DATETIME NULL DEFAULT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_viajes_usuarios1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_viajes_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `certificacion2`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `certificacion2`.`viaje_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacion2`.`viaje_usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `viajes_id` INT NOT NULL,
  PRIMARY KEY (`id`, `usuarios_id`, `viajes_id`),
  INDEX `fk_viaje_usuarios_usuarios_idx` (`usuarios_id` ASC) VISIBLE,
  INDEX `fk_viaje_usuarios_viajes1_idx` (`viajes_id` ASC) VISIBLE,
  CONSTRAINT `fk_viaje_usuarios_usuarios`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `certificacion2`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_viaje_usuarios_viajes1`
    FOREIGN KEY (`viajes_id`)
    REFERENCES `certificacion2`.`viajes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
