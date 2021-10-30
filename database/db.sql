-- creating the database
CREATE DATABASE menajerie;

-- using the database
use crudnodejsmysql;

-- creating a table
/////////////////////
CREATE TABLE soporte_flash(
id_soporte_flash INT NOT NULL,
PRIMARY KEY(id_soporte_flash),
descripcion_soporte_flash VARCHAR(100) NOT NULL
);
/////////////////////
CREATE TABLE referencia(
id_referencia INT NOT NULL,
PRIMARY KEY(id_referencia),
descripcion_referencia VARCHAR(100) NOT NULL
);
/////////////////////
CREATE TABLE formato(
id_formato INT NOT NULL,
PRIMARY KEY(id_formato),
descripcion_formato VARCHAR(100) NOT NULL
);
/////////////////////
CREATE TABLE sensibiidad_iso(
id_sensibiidad_iso INT NOT NULL,
PRIMARY KEY(id_sensibiidad_iso),
descripcion_sensibiidad_iso VARCHAR(100) NOT NULL
);
/////////////////////
CREATE TABLE marca(
id_marca INT NOT NULL,
PRIMARY KEY(id_marca),
direccion_servicio_reparacion VARCHAR(100) NOT NULL
);
/////////////////////
CREATE TABLE modelo(
id_modelo INT NOT NULL,
id_referencia INT NOT NULL,
PRIMARY KEY(id_modelo),
descripcion_modelo VARCHAR(100) NOT NULL,
INDEX (id_referencia),
FOREIGN KEY (id_referencia) REFERENCES referencia(id_referencia)
);
/////////////////////
CREATE TABLE camara(
id_camara INT NOT NULL,
id_marca INT NOT NULL,
id_modelo INT NOT NULL,
id_soporte_flash INT NOT NULL,
PRIMARY KEY(id_camara),
INDEX (id_marca),
FOREIGN KEY (id_marca) REFERENCES marca(id_marca),
INDEX (id_modelo),
FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo),
INDEX (id_soporte_flash),
FOREIGN KEY (id_soporte_flash) REFERENCES soporte_flash(id_soporte_flash)
);
/////////////////////
CREATE TABLE alquiler(
id_alquiler INT NOT NULL,
id_cliente INT NOT NULL,
id_camara INT NOT NULL,
fecha_alquiler DATE NOT NULL,
PRIMARY KEY(id_alquiler),
INDEX (id_cliente),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
INDEX (id_camara),
FOREIGN KEY (id_camara) REFERENCES camara(id_camara)
);
/////////////////////
CREATE TABLE marca_pelicula(
id_marca_pelicula INT NOT NULL,
descripcion_marca_pelicula VARCHAR(100) NOT NULL,
PRIMARY KEY(id_marca_pelicula)
);
/////////////////////
CREATE TABLE tipo_pelicula(
id_tipo_pelicula INT NOT NULL,
descripcion_tipo_pelicula VARCHAR(100) NOT NULL,
PRIMARY KEY(id_tipo_pelicula)
);
/////////////////////
CREATE TABLE camara_tipo_pelicula(
id_camara_tipo_pelicula INT NOT NULL,
id_camara INT NOT NULL,
id_tipo_pelicula INT NOT NULL,
PRIMARY KEY(id_camara_tipo_pelicula),
INDEX (id_camara),
FOREIGN KEY (id_camara) REFERENCES camara(id_camara),
INDEX (id_tipo_pelicula),
FOREIGN KEY (id_tipo_pelicula) REFERENCES tipo_pelicula(id_tipo_pelicula)
);
/////////////////////
CREATE TABLE pelicula(
id_pelicula INT NOT NULL,
nombre_marca VARCHAR(100) NOT NULL,
id_marca_pelicula INT NOT NULL,
id_sensibiidad_iso INT NOT NULL,
id_formato INT NOT NULL,
PRIMARY KEY(id_pelicula),
INDEX (id_marca_pelicula),
FOREIGN KEY (id_marca_pelicula) REFERENCES marca_pelicula(id_marca_pelicula),
INDEX (id_sensibiidad_iso),
FOREIGN KEY (id_sensibiidad_iso) REFERENCES sensibiidad_iso(id_sensibiidad_iso),
INDEX (id_formato),
FOREIGN KEY (id_formato) REFERENCES formato(id_formato)
);


-- to show all tables
SHOW TABLES;

-- to describe the table
describe customer;
