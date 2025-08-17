-- Katherine Alderete

-- =========================
-- 1) PACIENTE
-- =========================
CREATE TABLE paciente (
  codigo_paciente   INT          NOT NULL,
  nombres           VARCHAR(60)  NOT NULL,
  apellidos         VARCHAR(60)  NOT NULL,
  direccion         VARCHAR(120) NOT NULL,
  poblacion         VARCHAR(60)  NOT NULL,
  provincia         VARCHAR(60)  NOT NULL,
  codigo_postal     VARCHAR(10)  NOT NULL,
  telefono          VARCHAR(20)  NOT NULL,
  fecha_nacimiento  DATE         NOT NULL,
  CONSTRAINT PK_paciente PRIMARY KEY (codigo_paciente)
) ENGINE=InnoDB;

-- =========================
-- 2) MEDICO
-- =========================
CREATE TABLE medico (
  codigo_medico  INT          NOT NULL,
  nombres        VARCHAR(60)  NOT NULL,
  apellidos      VARCHAR(60)  NOT NULL,
  telefono       VARCHAR(20)  NOT NULL,
  especialidad   VARCHAR(60)  NOT NULL,
  CONSTRAINT PK_medico PRIMARY KEY (codigo_medico)
) ENGINE=InnoDB;

-- =========================
-- 3) INGRESO
-- =========================
CREATE TABLE ingreso (
  id_ingreso        INT          NOT NULL AUTO_INCREMENT,
  numero_habitacion SMALLINT     NOT NULL,
  numero_cama       TINYINT      NOT NULL,
  fecha_ingreso     DATETIME     NOT NULL,
  codigo_paciente   INT          NOT NULL,
  codigo_medico     INT          NOT NULL,
  CONSTRAINT PK_ingreso PRIMARY KEY (id_ingreso),
  CONSTRAINT FK_ingreso_paciente FOREIGN KEY (codigo_paciente)
    REFERENCES paciente (codigo_paciente)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,
  CONSTRAINT FK_ingreso_medico FOREIGN KEY (codigo_medico)
    REFERENCES medico (codigo_medico)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- =========================
-- 4) VERIFICAR
-- =========================
SHOW TABLES;
SHOW CREATE TABLE paciente;
SHOW CREATE TABLE medico;
SHOW CREATE TABLE ingreso;
