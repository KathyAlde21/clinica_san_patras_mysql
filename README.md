**_<h1 align="center">:vulcan_salute: Titulo proyecto :computer:</h1>_**

**<h3>:blue_book: Contexto:</h3>**

<p>La clínica “SAN PATRÁS” necesita llevar un control informatizado de su gestión de pacientes y médicos. De cada paciente se desea guardar el código único, nombre, apellidos, dirección, población, provincia, código postal, teléfono y fecha de nacimiento. De cada médico se desea guardar el código, nombre, apellidos, teléfono y especialidad.</p>
<p>Se desea llevar el control de cada uno de los ingresos que el paciente hace en el hospital. Cada ingreso que realiza el paciente queda registrado en la base de datos. De cada ingreso se guarda el código de ingreso (que se incrementará automáticamente cada vez que el paciente realice un ingreso), el número de habitación y cama en la que el paciente realiza el ingreso y la fecha de ingreso.</p>
<p>Un médico puede atender varios ingresos, pero el ingreso de un paciente solo puede ser atendido por un único médico. Un paciente puede realizar varios ingresos en el hospital.</p>

**<h3>:orange_book: Requerimientos:</h3>**

<p>Con la información anterior debe crear un modelo entidad relación, estableciendo claramente:</p>
<ul>
  <li>Entidades (considerar los diversos tipos de entidades).</li>
  <li>Relaciones.</li>
  <li>Atributos (destaque atributos primarios, e indique la forma correcta según el tipo de atributo).</li>
</ul>

**<h3>:green_book: Construcción de la Base de Datos:</h3>**

```SQL
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

```

**<h3>📁 Estructura del Proyecto:</h3>**

```
📁 m4_abp_ae5_clinica_san_patras
├── 📘 README.md
├─── 📁 img
│   └── 🖼️ eer_diagram.jpg
└──  📁 mysql
    └── 🟩 eer_diagram.mwb
    └── 🟩 creando_tablas_M4_ABP_AE5.sql

```

**<h3>:book: Ejemplo de Salida:</h3>**

<img src="./proyecto/src/img/imagen.jpg" alt="" style="width: 80%;">
