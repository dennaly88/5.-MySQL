/*<!---------------------------------------------------------------------------------------------------------|
|------------------------------------------------------------------------------------------------------------|
| NOMBRE    :  DANNY JOSE JIMENEZ GUTIERREZ                                                                  |
| CEDULA    :  16.029.567                                                                                    |
| TELEFONO  :  0424-281-44-55                                                                                |
| CORREO    :  DENNALY88@GMAIL.COM                                                                           |
|------------------------------------------------------------------------------------------------------------|
|  CURSO    : MYSQL                                                                                          |
|  DESARROLLADOR WEB                                                                                         |
|  MIRANDA , CUA  2024                                                                                       |
-------------------------------------------------------------------------------------------------------------|
----------------------------------------------------------------------------------------------------------->*/
/----------------------------------------------------------/
   PARA ENTRAR POR TERMINAR A LA BASE DE DATOS 
/---------------------------------------------------------/

mysql -u root -p

mysql -u root -p -h 127.0.0.1 -P 3306

mysql -u danny -p -h 127.0.0.1 -P 3306


/----------------------------------------------------------/
          MOSTRAR BASES DE DATOS
/---------------------------------------------------------/

show databases;

/------------------------------------------------------/
           CREAR BASE DE DATOS 
/-----------------------------------------------------/

CREATE DATABASE prueba;

/--------------------------------------------------------/
             BORRAR BASE DE DATOS
/-------------------------------------------------------/


DROP DATABASE prueba;

/---------------------------------------------------------/
        CREAR TABLA EN LA BASE DE DATOS
/---------------------------------------------------------/


USE prueba;
SHOW TABLES;
CREATE TABLE Libros (id_libro int unsigned not null auto_increment comment 'Llave primaria', Nombre varchar (50) not null, Autor varchar (50) not null, Editorial varchar (50) not null, primary key (id_libro));
SHOW TABLES;


/----------------------------------------------------------/
        MOSTRAR INFORMACION DE UNA TABLA 
/----------------------------------------------------------/


USE prueba;
SHOW TABLES;
EXPLAIN Libros;

/-------------------------------------------------------------/
    DESCRIBE LA INFORMACION DE LA TABLA 
/------------------------------------------------------------/


DESCRIBE producto;


/--------------------------------------------------------------/
       AGREGAR UNA NUEVA COLUNMA
/--------------------------------------------------------------/


USE prueba;
ALTER TABLE Libros ADD ISBN varchar(13);
EXPLAIN Libros;

 
/------------------------------------------------------------------/
    REALIZAR UN RESPALDO DE TU BASE DE DATOS
/------------------------------------------------------------------/

mysqldump -u danny -p --databases salvadora > /home/danny/Escritorio/respaldo_salvadora_bk.sql

 
/--------------------------------------------------------------------/
    REALIZAR UN IMPORT DE TU BASE DE DATOS
/--------------------------------------------------------------------/

CREAS LA BASE DE DATOS 

create database prueba_8;

LUEGO SELECCIONAS LA BASE DE DATOS 

USE prueba_8;

COLOCAS LA LINEA DE COMANDO LA DIRRECION DONDE ESTA EL RESPALDO 

source /home/danny/Escritorio/respaldo_salvadora_bk.sql

Y LISTO CON ESTO YA TENEMOS LA BASE DE DATOS 


/-------------------------------------------------------------------------/
    CONSULTAS EN LAS BASE DE DATOS
/------------------------------------------------------------------------/

use salvadora;

SELECT * FROM producto;

select * from salvadora.cliente;

select * from cliente where apellido='FLORES';

select * from producto where marca = 'continental' and precio > 1000;

select nombre,apellido from cliente where nombre like "s%"; 

select nombre,apellido from cliente where apellido like "%s"; 

select * from proveedor where id_proveedor like '%0%';

select * from salvadora.cliente where ci like "18%";

select * from salvadora.cliente where ci not like "18%";

select * from salvadora.producto where cod_producto like "10_";

SELECT NOMBRE,MARCA,COLOR,PRECIO from producto where precio between 1500 and 3000;  

SELECT NOMBRE,MARCA,COLOR,PRECIO from producto where precio NOT between 1500 and 3000; 

select * from producto where precio in (1800,2300,3000);

select * from producto where color in ('negro','rojo');


/----------------------------------------------------------------------/
    FUNCIONES AGREGADAS SUM,MIN,COUNT,MAX EN LAS BASE DE DATOS
/---------------------------------------------------------------------/


select sum(PRECIO) from producto;

select count(ID_PROVEEDOR) from proveedor;

select min(precio) from producto;

select max(precio) from producto;

/----------------------------------------------------------------------/
    GROUP BY EN LAS BASE DE DATOS
/---------------------------------------------------------------------/

SELECT marca,sum(precio) FROM producto group by marca;


select marca,count(*) from producto group by marca ; 


select marca,count(*) from producto where color ='negro' group by marca;

select color,min(precio) from salvadora.producto group by color;

select color,max(precio) from salvadora.producto group by color;


/----------------------------------------------------------------------/
    HAVING EN LAS BASE DE DATOS
/---------------------------------------------------------------------/

select marca,sum(stock) from producto group by marca having sum(stock) > 30 ;

select color,count(*) from producto group by color having count(*)<4;

select color, min(precio) from salvadora.producto group by color having min(precio)< 2000;


/----------------------------------------------------------------------/
    ORDEN BY EN LAS BASE DE DATOS
/---------------------------------------------------------------------/

select *from producto where marca = "continental" order by cod_producto asc;

select *from producto where marca = "continental" order by cod_producto desc; 

select *from producto where marca = "continental" order by cod_producto desc; 
     
/----------------------------------------------------------------------/
    ELIMINAR BASE DE DATOS
/---------------------------------------------------------------------/

drop database prueba_2;



/----------------------------------------------------------------------/
    EJERCICIOS 
/---------------------------------------------------------------------/

SELECT nombre FROM salvadora.cliente;
SELECT nombre,marca,precio from salvadora.producto;
SELECT * from producto where precio between 2000 and 3000;
SELECT count(*) from producto where precio = 1250;
SELECT nombre,marca,precio FROM producto WHERE precio = (select min(precio) from producto);
SELECT nombre from cliente where telefono='NULL';










 






