CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2),
    correo_electronico VARCHAR(100),
    dpi VARCHAR(20),
    fecha_contratacion DATE
);
insert into empleados(nombre, salario, correo_electronico, dpi, fecha_contratacion) values ('Marco',3500,'Marco@gmail.com','3454655667877','2011-04-11');
insert into empleados(nombre, salario, correo_electronico, dpi, fecha_contratacion) values ('Juan',4000,'Juan@gmail.com','8767546345679','2019-02-11');
insert into empleados(nombre, salario, correo_electronico, dpi, fecha_contratacion) values ('Manuel',2000,'Manuel@gmail.com','5434234345654','2009-02-16');
insert into empleados(nombre, salario, correo_electronico, dpi, fecha_contratacion) values ('Pedro',1500,'Pedro@gmail.com','0987677846576','2005-02-14');
insert into empleados(nombre, salario, correo_electronico, dpi, fecha_contratacion) values ('Carlos',5000,'Carlos@gmail.com','3654376546876','2024-02-19');
GRANT ALL PRIVILEGES ON TABLE empleados TO test_user;
