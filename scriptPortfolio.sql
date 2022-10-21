-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbPortfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbPortfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbPortfolio` DEFAULT CHARACTER SET utf8mb4 ;
USE `dbPortfolio` ;

-- -----------------------------------------------------
-- Table `dbPortfolio`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`domicilio` (
  `id` INT(11) NOT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `dbPortfolio`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`usuario` (
  `id` INT(11) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `dbPortfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`persona` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `apellido` VARCHAR(45) NULL DEFAULT NULL,
  `puesto_actual` VARCHAR(45) NULL DEFAULT NULL COMMENT '123456789101112131415161718192021222324252627282930313233343536373839404142434445',
  `descripcion_acerca_de` VARCHAR(300) NULL DEFAULT NULL,
  `url_imagen_perfil` VARCHAR(100) NULL DEFAULT NULL,
  `nro_celular` VARCHAR(11) NULL DEFAULT NULL,
  `usuario_id` INT(11) NOT NULL,
  `domicilio_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `usuario_id`, `domicilio_id`),
  INDEX `fk_persona_usuario1` (`usuario_id` ASC) VISIBLE,
  INDEX `fk_persona_domicilio1` (`domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_persona_domicilio1`
    FOREIGN KEY (`domicilio_id`)
    REFERENCES `dbPortfolio`.`domicilio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_usuario1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `dbPortfolio`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `dbPortfolio`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`educacion` (
  `id` INT(11) NOT NULL,
  `institucion` VARCHAR(100) NULL DEFAULT NULL,
  `carrera` VARCHAR(100) NULL DEFAULT NULL,
  `fecha_inicio` DATETIME NULL DEFAULT NULL,
  `fecha_fin` DATETIME NULL DEFAULT NULL,
  `url_imagen_logo` VARCHAR(100) NULL DEFAULT NULL,
  `persona_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_educacion_persona` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `dbPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `dbPortfolio`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`experiencia_laboral` (
  `id` INT(11) NOT NULL,
  `puesto` VARCHAR(100) NULL DEFAULT NULL,
  `empresa` VARCHAR(100) NULL DEFAULT NULL,
  `tipo_jornada` VARCHAR(45) NULL DEFAULT NULL,
  `fecha_inicio` DATETIME NULL DEFAULT NULL,
  `fecha_fin` DATETIME NULL DEFAULT NULL,
  `periodo_tiempo` VARCHAR(45) NULL DEFAULT NULL,
  `lugar_de_trabajo` VARCHAR(45) NULL DEFAULT NULL,
  `url_imagen_experiencia` VARCHAR(45) NULL DEFAULT NULL,
  `persona_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_experiencia_laboral_persona1` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `dbPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `dbPortfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`proyectos` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `persona_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_proyectos_persona1` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `dbPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `dbPortfolio`.`tecnologias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbPortfolio`.`tecnologias` (
  `id` INT(11) NOT NULL,
  `habilidad` VARCHAR(45) NULL DEFAULT NULL,
  `porcentaje` INT(11) NULL DEFAULT NULL,
  `persona_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_tecnologias_persona1` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_tecnologias_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `dbPortfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
