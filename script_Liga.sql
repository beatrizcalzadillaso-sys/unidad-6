use liga_db;

create table equipos
	(id_equipos int unsigned auto_increment primary key,
	nombre varchar(30) not null unique,
    estadio varchar(30) not null,
    aforo int default 2000 ,
    año_fundacion int unsigned,
    ciudad varchar(30) not null,
    constraint ck_año_fundacion check (año_fundacion between 1850 and 2025));
    
create table jugadores
	(id_jugador int unsigned auto_increment primary key,
    nombre varchar(30) not null unique,
    fecha_nac date not null,
    id_equipo int not null);

create table partidos
	(id_equipo_casa int unsigned,
    id_equipo_fuera int unsigned,
    fecha date,
    goles_casa int not null default -1,
    goles_fuera int not null default -1,
    observaciones varchar(500),
    );
    
create table goles
	();
