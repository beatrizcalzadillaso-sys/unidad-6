use empresa_dam;

/*a) Muestra para todos los empleados que cobran comisión, su nombre y la suma del salario más
la comisión (alias Sueldo).*/
select nomemp, (salario+comision) 'sueldo'
from empleado
where comision>0;

/*b) Muestra el número, nombre y salario de todos los empleados del departamento no 3 cuyo
salario esté entre 1500 y 2000 €.*/
select numemp, nomemp, salario
from departamento natural join empleado
where numdep=3 and salario<=2000 and salario>=1500;

/*c) Muestra todos los datos de los departamentos ubicados en localidades cuyo nombre acabe por
la letra ‘a’.*/
select *
from departamento
where localidad like '%a';

/*d) Muestra el nombre, puesto y salario de los empleados que hayan ingresado en la empresa en
el año 2018. Puedes hacer uso de la función year, que dada una fecha nos devuelve su año.
Los datos deben aparecer ordenados por salario de mayor a menor.*/
select nomemp, puesto, salario
from empleado
where year(fecingreso)=2018
order by salario desc;

/*e) Muestra el nombre, salario y comisión de todos los empleados cuya comisión suponga más
del 20% de su salario.*/
select nomemp, salario, comision
from empleado
where comision > 0.2*salario;

/*f) Muestra el número, nombre y salario de los empleados que trabajen en el departamento no 1 o
en el 2. Ordena el resultado por nombre en orden alfabético.*/
select numemp, nomemp, salario
from empleado natural join departamento
where numdep in (1,2);

/*g) Muestra para el o los empleados que no tenga/n jefe o director, su número, nombre, puesto y
salario.*/
select numemp, nomemp, puesto, salario
from empleado
where NumEmpJefe is null;

/*h) Muestra para todos los empleados que cobran comisión, su nombre, salario, comisión y el
porcentaje que supone la comisión en relación con el salario (alias Porcentaje comisión).
Ordena el resultado por este último dato, que debe estar redondeado a dos decimales.*/
select nomemp, salario, comision, round(comision/salario, 2) 'Porcentaje comision'
from empleado
where comision>0;

/*i) Muestra para todos los empleados que no sean ni vendedores ni directores, su nombre, puesto
y salario.*/ 
select nomemp, puesto, salario
from empleado
where puesto not in ('vendedor','director');

