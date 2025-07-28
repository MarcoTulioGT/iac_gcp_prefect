CREATE USER test_user WITH PASSWORD 'testuser25';
CREATE DATABASE test_db OWNER test_user;
GRANT ALL PRIVILEGES ON DATABASE test_db TO test_user;


CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);
insert into empleados(nombre, salario, fecha_contratacion) values ('Marco',24000,'2015-06-15');
GRANT ALL PRIVILEGES ON TABLE empleados TO test_user;