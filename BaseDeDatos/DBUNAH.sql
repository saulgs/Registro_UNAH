-- MySQL Script generated by MySQL Workbench
-- Fri Apr 13 21:42:27 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema DBUNAH
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBUNAH
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBUNAH` DEFAULT CHARACTER SET utf8 ;
USE `DBUNAH` ;

-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_CAMPUS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_CAMPUS` (
  `CODIGO_CAMPUS` INT NOT NULL,
  `NOMBRE_CAMPUS` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CODIGO_CAMPUS`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_ESTADOS_CIVILES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_ESTADOS_CIVILES` (
  `CODIGO_ESTADO_CIVIL` INT NOT NULL,
  `NOMBRE_ESTADO_CIVIL` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CODIGO_ESTADO_CIVIL`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_GENEROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_GENEROS` (
  `CODIGO_GENERO` INT NOT NULL COMMENT 'IDENTIFICADOR UNICO PARA EL CAMPO GENERO',
  `NOMBRE_GENERO` VARCHAR(60) NOT NULL,
  `ABREVIATURA` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_GENERO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPO_LUGARES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPO_LUGARES` (
  `CODIGO_TIPO_LUGAR` INT NOT NULL,
  `NOMBRE_TIPO_LUGAR` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_LUGAR`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_LUGARES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_LUGARES` (
  `CODIGO_LUGAR` INT NOT NULL,
  `NOMBRE_LUGAR` VARCHAR(200) NOT NULL,
  `LONGITUD` DOUBLE NULL DEFAULT NULL,
  `LATITUD` DOUBLE NULL DEFAULT NULL,
  `CODIGO_TIPO_LUGAR` INT NOT NULL,
  `CODIGO_LUGAR_PADRE` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_LUGAR`),
  INDEX `TBL_LUGARES_TBL_LUGARES_FK` (`CODIGO_LUGAR_PADRE` ASC),
  INDEX `TBL_LUGARES_TBL_TIPO_LUGARES_FK` (`CODIGO_TIPO_LUGAR` ASC),
  CONSTRAINT `TBL_LUGARES_TBL_LUGARES_FK`
    FOREIGN KEY (`CODIGO_LUGAR_PADRE`)
    REFERENCES `DBUNAH`.`TBL_LUGARES` (`CODIGO_LUGAR`),
  CONSTRAINT `TBL_LUGARES_TBL_TIPO_LUGARES_FK`
    FOREIGN KEY (`CODIGO_TIPO_LUGAR`)
    REFERENCES `DBUNAH`.`TBL_TIPO_LUGARES` (`CODIGO_TIPO_LUGAR`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPO_IDENTIFICACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPO_IDENTIFICACION` (
  `CODIGO_TIPO_IDENTIFICACION` INT NOT NULL,
  `TIPO_IDENTIFICACION` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CODIGO_TIPO_IDENTIFICACION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_PERSONAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_PERSONAS` (
  `CODIGO_PERSONA` INT NOT NULL,
  `CODIGO_GENERO` INT NOT NULL,
  `CODIGO_LUGAR_NACIMIENTO` INT NOT NULL,
  `CODIGO_LUGAR_RESIDENCIA` INT NOT NULL,
  `CODIGO_MUNICIPIO_NACIMIENTO` INT NOT NULL,
  `CODIGO_MUNICIPIO_RESIDENCIA` INT NOT NULL,
  `CODIGO_CAMPUS` INT NOT NULL,
  `CODIGO_TIPO_IDENTIFICACION` INT NOT NULL,
  `CODIGO_ESTADO_CIVIL` INT NOT NULL,
  `NOMBRE` VARCHAR(200) NOT NULL,
  `APELLIDO` VARCHAR(200) NOT NULL,
  `FECHA_NACIMIENTO` DATETIME NOT NULL,
  `IDENTIDAD` VARCHAR(13) NOT NULL,
  `DIRECCION` VARCHAR(800) NOT NULL,
  `TELEFONO` VARCHAR(30) NOT NULL,
  `CORREO_ELECTRONICO` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`CODIGO_PERSONA`),
  INDEX `TBL_ALUMNOS_TBL_CAMPUS_FK` (`CODIGO_CAMPUS` ASC),
  INDEX `TBL_ALUMNOS_TBL_ESTADOS_CIVILES_FK` (`CODIGO_ESTADO_CIVIL` ASC),
  INDEX `TBL_ALUMNOS_TBL_GENEROS_FK` (`CODIGO_GENERO` ASC),
  INDEX `TBL_ALUMNOS_TBL_LUGARES_FK` (`CODIGO_LUGAR_NACIMIENTO` ASC),
  INDEX `TBL_ALUMNOS_TBL_LUGARES_FKv1` (`CODIGO_LUGAR_RESIDENCIA` ASC),
  INDEX `TBL_ALUMNOS_TBL_TIPO_IDENTIFICACION_FK` (`CODIGO_TIPO_IDENTIFICACION` ASC),
  CONSTRAINT `TBL_ALUMNOS_TBL_CAMPUS_FK`
    FOREIGN KEY (`CODIGO_CAMPUS`)
    REFERENCES `DBUNAH`.`TBL_CAMPUS` (`CODIGO_CAMPUS`),
  CONSTRAINT `TBL_ALUMNOS_TBL_ESTADOS_CIVILES_FK`
    FOREIGN KEY (`CODIGO_ESTADO_CIVIL`)
    REFERENCES `DBUNAH`.`TBL_ESTADOS_CIVILES` (`CODIGO_ESTADO_CIVIL`),
  CONSTRAINT `TBL_ALUMNOS_TBL_GENEROS_FK`
    FOREIGN KEY (`CODIGO_GENERO`)
    REFERENCES `DBUNAH`.`TBL_GENEROS` (`CODIGO_GENERO`),
  CONSTRAINT `TBL_ALUMNOS_TBL_LUGARES_FK`
    FOREIGN KEY (`CODIGO_LUGAR_NACIMIENTO`)
    REFERENCES `DBUNAH`.`TBL_LUGARES` (`CODIGO_LUGAR`),
  CONSTRAINT `TBL_ALUMNOS_TBL_LUGARES_FKv1`
    FOREIGN KEY (`CODIGO_LUGAR_RESIDENCIA`)
    REFERENCES `DBUNAH`.`TBL_LUGARES` (`CODIGO_LUGAR`),
  CONSTRAINT `TBL_ALUMNOS_TBL_TIPO_IDENTIFICACION_FK`
    FOREIGN KEY (`CODIGO_TIPO_IDENTIFICACION`)
    REFERENCES `DBUNAH`.`TBL_TIPO_IDENTIFICACION` (`CODIGO_TIPO_IDENTIFICACION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_ALUMNOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_ALUMNOS` (
  `CODIGO_ALUMNO` INT NOT NULL,
  `NUMERO_CUENTA` VARCHAR(11) NOT NULL,
  `PROMEDIO` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ALUMNO`),
  CONSTRAINT `TBL_ALUMNOS_TBL_PERSONAS_FK`
    FOREIGN KEY (`CODIGO_ALUMNO`)
    REFERENCES `DBUNAH`.`TBL_PERSONAS` (`CODIGO_PERSONA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_AREA_ESPECIALIZACIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_AREA_ESPECIALIZACIONES` (
  `CODIGO_ESPECIALIZACION` INT NOT NULL,
  `DESCRIPCION` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CODIGO_ESPECIALIZACION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_FACULTADES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_FACULTADES` (
  `CODIGO_FACULTAD` INT NOT NULL,
  `NOMBRE_FACULTAD` VARCHAR(200) NULL DEFAULT NULL,
  `DESCRIPCION` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_FACULTAD`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_GRADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_GRADOS` (
  `CODIGO_GRADO` INT NOT NULL,
  `NOMBRE_GRADO` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CODIGO_GRADO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_CARRERAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_CARRERAS` (
  `CODIGO_CARRERA` INT NOT NULL,
  `CODIGO_AUXILIAR` VARCHAR(20) NOT NULL,
  `CODIGO_FACULTAD` INT NOT NULL,
  `NOMBRE_CARRERA` VARCHAR(200) NULL DEFAULT NULL,
  `CANTIDAD_ASIGNATURAS` INT NOT NULL,
  `CANTIDAD_UNIDADES_VALORATIVAS` INT NULL DEFAULT NULL,
  `CODIGO_GRADO` INT NOT NULL,
  PRIMARY KEY (`CODIGO_CARRERA`),
  INDEX `TBL_CARRERAS_TBL_FACULTADES_FK` (`CODIGO_FACULTAD` ASC),
  INDEX `TBL_CARRERAS_TBL_GRADOS_FK` (`CODIGO_GRADO` ASC),
  CONSTRAINT `TBL_CARRERAS_TBL_FACULTADES_FK`
    FOREIGN KEY (`CODIGO_FACULTAD`)
    REFERENCES `DBUNAH`.`TBL_FACULTADES` (`CODIGO_FACULTAD`),
  CONSTRAINT `TBL_CARRERAS_TBL_GRADOS_FK`
    FOREIGN KEY (`CODIGO_GRADO`)
    REFERENCES `DBUNAH`.`TBL_GRADOS` (`CODIGO_GRADO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPO_ASIGNATURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPO_ASIGNATURA` (
  `CODIGO_TIPO_ASIGNATURA` INT NOT NULL,
  `TIPO_ASIGNATURA` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_ASIGNATURA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_ASIGNATURAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_ASIGNATURAS` (
  `CODIGO_ASIGNATURA` INT NOT NULL,
  `CODIGO_ALTERNO` VARCHAR(200) NULL DEFAULT NULL,
  `NOMBRE_ASIGNATURA` VARCHAR(4000) NULL DEFAULT NULL,
  `CANTIDAD_UNIDADES_VALORATIVAS` INT NULL DEFAULT NULL,
  `DIAS` VARCHAR(200) NULL DEFAULT NULL,
  `CODIGO_CARRERA` INT NOT NULL,
  `CODIGO_TIPO_ASIGNATURA` INT NOT NULL,
  PRIMARY KEY (`CODIGO_ASIGNATURA`),
  INDEX `TBL_ASIGNATURAS_TBL_CARRERAS_FK` (`CODIGO_CARRERA` ASC),
  INDEX `TBL_ASIGNATURAS_TBL_TIPO_ASIGNATURA_FK` (`CODIGO_TIPO_ASIGNATURA` ASC),
  CONSTRAINT `TBL_ASIGNATURAS_TBL_CARRERAS_FK`
    FOREIGN KEY (`CODIGO_CARRERA`)
    REFERENCES `DBUNAH`.`TBL_CARRERAS` (`CODIGO_CARRERA`),
  CONSTRAINT `TBL_ASIGNATURAS_TBL_TIPO_ASIGNATURA_FK`
    FOREIGN KEY (`CODIGO_TIPO_ASIGNATURA`)
    REFERENCES `DBUNAH`.`TBL_TIPO_ASIGNATURA` (`CODIGO_TIPO_ASIGNATURA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_EDIFICIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_EDIFICIOS` (
  `CODIGO_EDIFICIO` INT NOT NULL,
  `NOMBRE_EDIFICIO` VARCHAR(200) NULL DEFAULT NULL,
  `ALIAS_EDIFICIO` VARCHAR(200) NULL DEFAULT NULL,
  `CODIGO_CAMPUS` INT NOT NULL,
  PRIMARY KEY (`CODIGO_EDIFICIO`),
  INDEX `TBL_EDIFICIOS_TBL_CAMPUS_FK` (`CODIGO_CAMPUS` ASC),
  CONSTRAINT `TBL_EDIFICIOS_TBL_CAMPUS_FK`
    FOREIGN KEY (`CODIGO_CAMPUS`)
    REFERENCES `DBUNAH`.`TBL_CAMPUS` (`CODIGO_CAMPUS`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPOS_AULAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPOS_AULAS` (
  `CODIGO_TIPO_AULA` INT NOT NULL,
  `TIPO_AULA` VARCHAR(200) NOT NULL,
  `DESCRIPCION` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_AULA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_AULAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_AULAS` (
  `CODIGO_AULA` INT NOT NULL,
  `NUMERO_AULA` VARCHAR(100) NOT NULL,
  `CODIGO_TIPO_AULA` INT NOT NULL,
  `CODIGO_EDIFICIO` INT NOT NULL,
  PRIMARY KEY (`CODIGO_AULA`),
  INDEX `TBL_AULAS_TBL_EDIFICIOS_FK` (`CODIGO_EDIFICIO` ASC),
  INDEX `TBL_AULAS_TBL_TIPOS_AULAS_FK` (`CODIGO_TIPO_AULA` ASC),
  CONSTRAINT `TBL_AULAS_TBL_EDIFICIOS_FK`
    FOREIGN KEY (`CODIGO_EDIFICIO`)
    REFERENCES `DBUNAH`.`TBL_EDIFICIOS` (`CODIGO_EDIFICIO`),
  CONSTRAINT `TBL_AULAS_TBL_TIPOS_AULAS_FK`
    FOREIGN KEY (`CODIGO_TIPO_AULA`)
    REFERENCES `DBUNAH`.`TBL_TIPOS_AULAS` (`CODIGO_TIPO_AULA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_CARGOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_CARGOS` (
  `CODIGO_CARGO` INT NOT NULL,
  `CODIGO_CARGO_SUPERIOR` INT NULL DEFAULT NULL,
  `NOMBRE_CARGO` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CARGO`),
  INDEX `TBL_CARGOS_TBL_CARGOS_FK` (`CODIGO_CARGO_SUPERIOR` ASC),
  CONSTRAINT `TBL_CARGOS_TBL_CARGOS_FK`
    FOREIGN KEY (`CODIGO_CARGO_SUPERIOR`)
    REFERENCES `DBUNAH`.`TBL_CARGOS` (`CODIGO_CARGO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_CARRERAS_X_ALUMNOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_CARRERAS_X_ALUMNOS` (
  `CODIGO_CARRERA` INT NOT NULL,
  `CODIGO_ALUMNO` INT NOT NULL,
  `FECHA_REGISTRO_CARRERA` DATETIME NOT NULL,
  `PROMEDIO_CARRERA` DOUBLE NULL DEFAULT NULL,
  `CANTIDAD_CLASES_APROBADAS` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_CARRERA`, `CODIGO_ALUMNO`),
  INDEX `TBL_CARRERAS_X_ALUMNOS_TBL_ALUMNOS_FK` (`CODIGO_ALUMNO` ASC),
  CONSTRAINT `TBL_CARRERAS_X_ALUMNOS_TBL_ALUMNOS_FK`
    FOREIGN KEY (`CODIGO_ALUMNO`)
    REFERENCES `DBUNAH`.`TBL_PERSONAS` (`CODIGO_PERSONA`),
  CONSTRAINT `TBL_CARRERAS_X_ALUMNOS_TBL_CARRERAS_FK`
    FOREIGN KEY (`CODIGO_CARRERA`)
    REFERENCES `DBUNAH`.`TBL_CARRERAS` (`CODIGO_CARRERA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPOS_PERIODOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPOS_PERIODOS` (
  `CODIGO_TIPO_PERIODO` INT NOT NULL COMMENT 'Campo que identifica de forma unica un tipo de periodo',
  `TIPO_PERIODO` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_PERIODO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_PERIODOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_PERIODOS` (
  `CODIGO_PERIODO` INT NOT NULL,
  `NOMBRE_PERIODO` VARCHAR(200) NULL DEFAULT NULL,
  `FECHA_INICIO` DATETIME NULL DEFAULT NULL,
  `FECHA_FIN` DATETIME NULL DEFAULT NULL,
  `CODIGO_TIPO_PERIODO` INT NOT NULL,
  PRIMARY KEY (`CODIGO_PERIODO`),
  INDEX `TBL_PERIODOS_TBL_TIPOS_PERIODOS_FK` (`CODIGO_TIPO_PERIODO` ASC),
  CONSTRAINT `TBL_PERIODOS_TBL_TIPOS_PERIODOS_FK`
    FOREIGN KEY (`CODIGO_TIPO_PERIODO`)
    REFERENCES `DBUNAH`.`TBL_TIPOS_PERIODOS` (`CODIGO_TIPO_PERIODO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPO_EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPO_EMPLEADO` (
  `CODIGO_TIPO_EMPLEADO` INT NOT NULL,
  `NOMBRE_TIPO_EMPLEADO` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_EMPLEADO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_EMPLEADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_EMPLEADOS` (
  `CODIGO_EMPLEADO` INT NOT NULL,
  `NUMERO_EMPLEADO` INT NOT NULL,
  `SUELDO_BASE` DOUBLE NOT NULL,
  `CODIGO_TIPO_EMPLEADO` INT NOT NULL,
  `CODIGO_CARGO` INT NOT NULL,
  PRIMARY KEY (`CODIGO_EMPLEADO`),
  INDEX `TBL_EMPLEADOS_TBL_CARGOS_FK` (`CODIGO_CARGO` ASC),
  INDEX `TBL_EMPLEADOS_TBL_TIPO_EMPLEADO_FK` (`CODIGO_TIPO_EMPLEADO` ASC),
  CONSTRAINT `TBL_EMPLEADOS_TBL_CARGOS_FK`
    FOREIGN KEY (`CODIGO_CARGO`)
    REFERENCES `DBUNAH`.`TBL_CARGOS` (`CODIGO_CARGO`),
  CONSTRAINT `TBL_EMPLEADOS_TBL_PERSONAS_FK`
    FOREIGN KEY (`CODIGO_EMPLEADO`)
    REFERENCES `DBUNAH`.`TBL_PERSONAS` (`CODIGO_PERSONA`),
  CONSTRAINT `TBL_EMPLEADOS_TBL_TIPO_EMPLEADO_FK`
    FOREIGN KEY (`CODIGO_TIPO_EMPLEADO`)
    REFERENCES `DBUNAH`.`TBL_TIPO_EMPLEADO` (`CODIGO_TIPO_EMPLEADO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TITULARIDAD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TITULARIDAD` (
  `CODIGO_TITULARIDAD` INT NOT NULL,
  `NOMBRE_TITULARIDAD` VARCHAR(200) NULL DEFAULT NULL,
  `SALARIO_MINIMO` DOUBLE NULL DEFAULT NULL,
  `SALARIO_MAXIMO` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TITULARIDAD`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_MAESTROS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_MAESTROS` (
  `CODIGO_MAESTRO` INT NOT NULL,
  `CODIGO_ESPECIALIZACION` INT NOT NULL,
  `CODIGO_TITULARIDAD` INT NOT NULL,
  PRIMARY KEY (`CODIGO_MAESTRO`),
  INDEX `TBL_MAESTROS_TBL_AREA_ESPECIALIZACIONES_FK` (`CODIGO_ESPECIALIZACION` ASC),
  INDEX `TBL_MAESTROS_TBL_TITULARIDAD_FK` (`CODIGO_TITULARIDAD` ASC),
  CONSTRAINT `TBL_MAESTROS_TBL_AREA_ESPECIALIZACIONES_FK`
    FOREIGN KEY (`CODIGO_ESPECIALIZACION`)
    REFERENCES `DBUNAH`.`TBL_AREA_ESPECIALIZACIONES` (`CODIGO_ESPECIALIZACION`),
  CONSTRAINT `TBL_MAESTROS_TBL_EMPLEADOS_FK`
    FOREIGN KEY (`CODIGO_MAESTRO`)
    REFERENCES `DBUNAH`.`TBL_EMPLEADOS` (`CODIGO_EMPLEADO`),
  CONSTRAINT `TBL_MAESTROS_TBL_TITULARIDAD_FK`
    FOREIGN KEY (`CODIGO_TITULARIDAD`)
    REFERENCES `DBUNAH`.`TBL_TITULARIDAD` (`CODIGO_TITULARIDAD`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_SECCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_SECCION` (
  `CODIGO_SECCION` INT NOT NULL,
  `CODIGO_ALTERNO` VARCHAR(200) NOT NULL,
  `HORA_INICIO` DATETIME NULL DEFAULT NULL,
  `HORA_FIN` DATETIME NULL DEFAULT NULL,
  `DIAS` VARCHAR(200) NULL DEFAULT NULL,
  `CODIGO_AULA` INT NOT NULL,
  `CODIGO_ASIGNATURA` INT NOT NULL,
  `CODIGO_MAESTRO` INT NOT NULL,
  `CODIGO_PERIODO` INT NOT NULL,
  `CANTIDAD_CUPOS` INT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_SECCION`),
  INDEX `TBL_SECCION_TBL_ASIGNATURAS_FK` (`CODIGO_ASIGNATURA` ASC),
  INDEX `TBL_SECCION_TBL_AULAS_FK` (`CODIGO_AULA` ASC),
  INDEX `TBL_SECCION_TBL_MAESTROS_FK` (`CODIGO_MAESTRO` ASC),
  INDEX `TBL_SECCION_TBL_PERIODOS_FK` (`CODIGO_PERIODO` ASC),
  CONSTRAINT `TBL_SECCION_TBL_ASIGNATURAS_FK`
    FOREIGN KEY (`CODIGO_ASIGNATURA`)
    REFERENCES `DBUNAH`.`TBL_ASIGNATURAS` (`CODIGO_ASIGNATURA`),
  CONSTRAINT `TBL_SECCION_TBL_AULAS_FK`
    FOREIGN KEY (`CODIGO_AULA`)
    REFERENCES `DBUNAH`.`TBL_AULAS` (`CODIGO_AULA`),
  CONSTRAINT `TBL_SECCION_TBL_MAESTROS_FK`
    FOREIGN KEY (`CODIGO_MAESTRO`)
    REFERENCES `DBUNAH`.`TBL_MAESTROS` (`CODIGO_MAESTRO`),
  CONSTRAINT `TBL_SECCION_TBL_PERIODOS_FK`
    FOREIGN KEY (`CODIGO_PERIODO`)
    REFERENCES `DBUNAH`.`TBL_PERIODOS` (`CODIGO_PERIODO`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_HISTORIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_HISTORIAL` (
  `CODIGO_HISTORIAL` INT NOT NULL,
  `CODIGO_ALUMNO` INT NOT NULL,
  `CODIGO_SECCION` INT NOT NULL,
  `CODIGO_PERIODO` INT NOT NULL,
  `PROMEDIO` DOUBLE NOT NULL,
  PRIMARY KEY (`CODIGO_HISTORIAL`),
  INDEX `TBL_HISTORIAL_TBL_ALUMNOS_FK` (`CODIGO_ALUMNO` ASC),
  INDEX `TBL_HISTORIAL_TBL_PERIODOS_FK` (`CODIGO_PERIODO` ASC),
  INDEX `TBL_HISTORIAL_TBL_SECCION_FK` (`CODIGO_SECCION` ASC),
  CONSTRAINT `TBL_HISTORIAL_TBL_ALUMNOS_FK`
    FOREIGN KEY (`CODIGO_ALUMNO`)
    REFERENCES `DBUNAH`.`TBL_ALUMNOS` (`CODIGO_ALUMNO`),
  CONSTRAINT `TBL_HISTORIAL_TBL_PERIODOS_FK`
    FOREIGN KEY (`CODIGO_PERIODO`)
    REFERENCES `DBUNAH`.`TBL_PERIODOS` (`CODIGO_PERIODO`),
  CONSTRAINT `TBL_HISTORIAL_TBL_SECCION_FK`
    FOREIGN KEY (`CODIGO_SECCION`)
    REFERENCES `DBUNAH`.`TBL_SECCION` (`CODIGO_SECCION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TIPOS_EVALUACIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TIPOS_EVALUACIONES` (
  `CODIGO_TIPO_EVALUACION` INT NOT NULL,
  `NOMBRE_TIPO_EVALUACION` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TIPO_EVALUACION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_DETALLE_EVALUACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_DETALLE_EVALUACION` (
  `CODIGO_HISTORIAL` INT NOT NULL,
  `CODIGO_TIPO_EVALUACION` INT NOT NULL,
  `VALOR_NOTA` DOUBLE NOT NULL,
  INDEX `TBL_DETALLE_EVALUACION_TBL_HISTORIAL_FK` (`CODIGO_HISTORIAL` ASC),
  INDEX `TBL_DETALLE_EVALUACION_TBL_TIPOS_EVALUACIONES_FK` (`CODIGO_TIPO_EVALUACION` ASC),
  CONSTRAINT `TBL_DETALLE_EVALUACION_TBL_HISTORIAL_FK`
    FOREIGN KEY (`CODIGO_HISTORIAL`)
    REFERENCES `DBUNAH`.`TBL_HISTORIAL` (`CODIGO_HISTORIAL`),
  CONSTRAINT `TBL_DETALLE_EVALUACION_TBL_TIPOS_EVALUACIONES_FK`
    FOREIGN KEY (`CODIGO_TIPO_EVALUACION`)
    REFERENCES `DBUNAH`.`TBL_TIPOS_EVALUACIONES` (`CODIGO_TIPO_EVALUACION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_ESTADOS_MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_ESTADOS_MATRICULA` (
  `CODIGO_ESTADO_MATRICULA` INT NOT NULL,
  `NOMBRE_ESTADO` VARCHAR(200) NULL DEFAULT NULL,
  `DESCRIPCION` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_ESTADO_MATRICULA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_MATRICULA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_MATRICULA` (
  `FECHA_MATRICULA` DATETIME NULL DEFAULT NULL,
  `CODIGO_SECCION` INT NOT NULL,
  `CODIGO_ALUMNO` INT NOT NULL,
  `CODIGO_ESTADO_MATRICULA` INT NOT NULL,
  INDEX `TBL_MATRICULA_TBL_ALUMNOS_FK` (`CODIGO_ALUMNO` ASC),
  INDEX `TBL_MATRICULA_TBL_ESTADOS_MATRICULA_FK` (`CODIGO_ESTADO_MATRICULA` ASC),
  INDEX `TBL_MATRICULA_TBL_SECCION_FK` (`CODIGO_SECCION` ASC),
  CONSTRAINT `TBL_MATRICULA_TBL_ALUMNOS_FK`
    FOREIGN KEY (`CODIGO_ALUMNO`)
    REFERENCES `DBUNAH`.`TBL_ALUMNOS` (`CODIGO_ALUMNO`),
  CONSTRAINT `TBL_MATRICULA_TBL_ESTADOS_MATRICULA_FK`
    FOREIGN KEY (`CODIGO_ESTADO_MATRICULA`)
    REFERENCES `DBUNAH`.`TBL_ESTADOS_MATRICULA` (`CODIGO_ESTADO_MATRICULA`),
  CONSTRAINT `TBL_MATRICULA_TBL_SECCION_FK`
    FOREIGN KEY (`CODIGO_SECCION`)
    REFERENCES `DBUNAH`.`TBL_SECCION` (`CODIGO_SECCION`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_REQUISITOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_REQUISITOS` (
  `CODIGO_ASIGNATURA` INT NOT NULL,
  `CODIGO_ASIGNATURA_REQUISITO` INT NULL DEFAULT NULL,
  `CODIGO_CARRERA` INT NOT NULL,
  INDEX `TBL_REQUISITOS__IDX` (`CODIGO_ASIGNATURA` ASC,  ASC),
  INDEX `TBL_REQUISITOS_TBL_ASIGNATURAS_FKv1` (`CODIGO_ASIGNATURA_REQUISITO` ASC),
  INDEX `TBL_REQUISITOS_TBL_CARRERAS_FK` (`CODIGO_CARRERA` ASC),
  CONSTRAINT `TBL_REQUISITOS_TBL_ASIGNATURAS_FK`
    FOREIGN KEY (`CODIGO_ASIGNATURA`)
    REFERENCES `DBUNAH`.`TBL_ASIGNATURAS` (`CODIGO_ASIGNATURA`),
  CONSTRAINT `TBL_REQUISITOS_TBL_ASIGNATURAS_FKv1`
    FOREIGN KEY (`CODIGO_ASIGNATURA_REQUISITO`)
    REFERENCES `DBUNAH`.`TBL_ASIGNATURAS` (`CODIGO_ASIGNATURA`),
  CONSTRAINT `TBL_REQUISITOS_TBL_CARRERAS_FK`
    FOREIGN KEY (`CODIGO_CARRERA`)
    REFERENCES `DBUNAH`.`TBL_CARRERAS` (`CODIGO_CARRERA`));


-- -----------------------------------------------------
-- Table `DBUNAH`.`TBL_TITULOS_X_EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBUNAH`.`TBL_TITULOS_X_EMPLEADO` (
  `CODIGO_TITULO` INT NOT NULL,
  `CODIGO_EMPLEADO` INT NOT NULL,
  `CODIGO_UNIVERSIDAD` INT NOT NULL,
  `FECHA` DATETIME NULL DEFAULT NULL,
  `NUMERO_REGISTRO` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO_TITULO`, `CODIGO_EMPLEADO`),
  INDEX `TBL_TITULOS_X_EMPLEADO_TBL_EMPLEADOS_FK` (`CODIGO_EMPLEADO` ASC),
  INDEX `TBL_TITULOS_X_EMPLEADO_TBL_UNIVERSIDADES_FK` (`CODIGO_UNIVERSIDAD` ASC),
  CONSTRAINT `TBL_TITULOS_X_EMPLEADO_TBL_EMPLEADOS_FK`
    FOREIGN KEY (`CODIGO_EMPLEADO`)
    REFERENCES `DBUNAH`.`TBL_EMPLEADOS` (`CODIGO_EMPLEADO`),
  CONSTRAINT `TBL_TITULOS_X_EMPLEADO_TBL_TITULOS_FK`
    FOREIGN KEY (`CODIGO_TITULO`)
    REFERENCES `DBUNAH`.`TBL_TITULOS` (`CODIGO_TITULO`),
  CONSTRAINT `TBL_TITULOS_X_EMPLEADO_TBL_UNIVERSIDADES_FK`
    FOREIGN KEY (`CODIGO_UNIVERSIDAD`)
    REFERENCES `DBUNAH`.`TBL_UNIVERSIDADES` (`CODIGO_UNIVERSIDAD`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;