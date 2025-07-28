CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);
insert into empleados(nombre, salario, fecha_contratacion) values ('Marco',24000,'2015-06-15');
GRANT ALL PRIVILEGES ON TABLE empleados TO test_user;