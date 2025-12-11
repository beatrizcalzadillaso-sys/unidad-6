use empresa_dam;

/*a) Muestra todos los datos de los empleados del departamento no 1 ordenados por nombre de la
A a la Z.*/
select *
from empleado
where numdep = 1
order by nomemp desc;

/*b)Muestra el nombre, fecha de ingreso y salario de los empleados del departamento no 3 cuyo
puesto sea vendedor.*/
select nomemp, fecingreso, salario
from empleado
where numdep =3 and puesto like 'vendedor';

/*c) Muestra el número y nombre de todos los departamentos.*/
select numdep, nomdep
from departamento;

/*d) Muestra el número, nombre y puesto de todos los empleados cuyo nombre comience por la
letra A.*/
select numemp, nomemp, puesto
from empleado
where nomemp like 'A%';

/*e) Muestra todos los datos de los empleados que tengan como primero o segundo apellido Ruiz.*/
select *
from empleado
where nomemp like '%Ruiz%'; /*RUIZ PUEDE ESTAR EN CUALQUIER PARTE DE LA CADENA DE CARACTERES*/

/*f) Muestra los nombres y puestos de los empleados cuyo puesto sea gerente, director o empleado,
ordenando el resultado por puesto y por nombre.*/
select nomemp, puesto
from empleado
where puesto in ('gerente','director','empleado')
order by puesto, nomemp;

/*g) Muestra el nombre, salario y comisión de todos los empleados que cobran más de 2000 € de
salario o más de 300 € de comisión.*/
select nomemp, salario, comision
from empleado
where salario >= 2000 or comision >=300;


/*h) Visualiza todos los datos de los empleados que cobran más de 2000 € de salario y más de 300
€ de comisión.*/
select *
from empleado
where salario >= 2000 and comision >=300;

/*i) Muestra para todos los empleados que cobren más de 2000 €, su nombre, salario, puesto y
comisión, así como el nombre y la localidad del departamento en el que trabaja.*/
select nomemp, salario, puesto, comision, nomdep, localidad
from empleado natural join departamento
where salario >= 2000;


/*j) Indica para todos los empleados que cobran comisión, su nombre, el nombre del departamento
en el que trabajan, la comisión que cobran, su salario y el porcentaje que supone la comisión
con respecto al salario (alias Porcentaje comisión). Redondea este último dato a 2 decimales,
para lo que puedes hacer uso de la función round, que recibe como primer parámetro el número
que se desea redondear y como segundo el número de decimales que se desean en el resultado.*/
select nomemp, nomdep, comision, salario, round(comision/salario, 2) 'Porcentaje comision'
from empleado natural join departamento
where comision>0;

select nomemp, nomdep, comision, salario, round(comision/salario, 2) 'Porcentaje comision'
from empleado e inner join departamento d on e.numdep = d.numdep
where comision>0;

select nomemp, nomdep, comision, salario, round(comision/salario, 2) 'Porcentaje comision'
from empleado e, departamento d 
where comision>0 and e.numdep = d.numdep;

select nomemp, nomdep, comision, salario, round(comision/salario, 2) 'Porcentaje comision'
from empleado join departamento using(numdep) 
where comision>0;



/*k) Indica para el empleado que no tiene jefe o director su nombre, puesto, nombre del
departamento y la localidad donde trabaja.*/
select nomemp, puesto, nomdep, localidad
from empleado natural join departamento
where numempjefe is null;


/*l) Muestra a continuación para los departamentos con número superior o igual a 3, su nombre y
localidad y, en caso de que trabaje en él algún empleado, su nombre, salario y comisión.
Aunque no trabaja ningún empleado en dicho departamento, se deben mostrar sus datos.*/
insert into Departamento VALUES (4, 'Calidad', 'Santander');
select nomdep, salario, comision
from departamento d left outer join empleado e on d.numdep=e.numdep; /*LEFT de empleado*/

select nomdep, salario,comision
from empleado e right outer join departamento d on e.numdep=d.numdep; /*RIGHT*/







