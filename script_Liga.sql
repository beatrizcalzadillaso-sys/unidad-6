use liga_db;

create table equipos
	(id_equipo int unsigned auto_increment primary key,
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
    id_equipo int not null,
    constraint fk_equipos_jugadores foreign key (id_equipo) references equipos(id_equipo));

create table partidos
	(id_equipo_casa int unsigned,
    id_equipo_fuera int unsigned,
    fecha date,
    goles_casa int not null default -1,
    goles_fuera int not null default -1,
    observaciones varchar(500),
    constraint pk_id_casa_id_fuera primary key (id_equipo_casa, id_equipo_fuera),
    constraint fk_id_casa foreign key (id_equipo_casa) references equipos(id_equipo),
    constraint fk_id_fuera foreign key (id_equipo_fuera) references equipos(id_equipo));
    
create table goles
	(id_equipo_casa int unsigned,
    id_equipo_fuera int unsigned,
    minuto int,
    descripcion varchar(500) not null,
    id_jugador int unsigned,
	constraint ck_minuto check(minuto between 0 and 130),
    constraint fk_id_jugador foreign key (id_jugador) references jugadores(id_jugador),
    constraint fk_id_equipo foreign key (id_equipo_casa, id_equipo_fuera) references partidos(id_equipo_casa, id_equipo_fuera));
