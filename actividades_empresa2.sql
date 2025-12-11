use empresa2_dam;

create table habilidad
(CodHab int primary key,
DesHab varchar(50));

create table centro 
(CodCen char(4) primary key,
CodEmpDir int unique,
NomCen varchar(30),
DirCen varchar(40),
PobCen varchar(10));

create table departamento
(CodDep char(5) primary key,
CodEmpDir int,
CodDEpDep char(5), 
CodCen char(4),
NomDep varchar(30),
PreAnu float,
TiDir char(1));

create table empleado 
(CodEmp int primary key,
CodDep char(5),
ExtTelEmp int,
FecInEmp date,
FecNaEmp date,
NIFEmp varchar (10),
NomEmp varchar (30),
NumHi int,
SalEmp float, 
constraint fk_);

alter table 





