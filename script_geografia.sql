use geografia_db;

	create table localidades
		(id_localidad int unsigned primary key,
        nombre varchar(40) not null,
        poblacion int unsigned not null,
        n_provincia int unsigned not null,
        constraint ck_localidades check(id_localidad between 1 and 9000),
        constraint ck_poblacion check (poblacion between 1 and 10000000),
        constraint uq_localidades unique (nombre, n_provincia));
        
	create table comunidades
		(id_comunidad int unsigned primary key,
        nombre varchar(30) not null unique,
        id_capital int unsigned not null unique,        
		constraint ck_id_comunidad check(id_comunidad between 1 and 19),
        constraint fk_localidades_comunidades foreign key (id_capital) references localidades(id_localidad) on update cascade);
    
    
    create table provincias
		(n_provincia int unsigned primary key ,
		nombre varchar(30) not null unique,
		superficie int unsigned not null,
		id_capital int unsigned not null unique,
		id_comunidad int unsigned,
		constraint ck_n_provincia check (n_provincia between 1 and 52),
		constraint ck_superficie check (superficie between 1 and 150000),
		constraint fk_capital_provincia foreign key (id_capital) references localidades(id_localidad) on update cascade,
		constraint fk_comunidad_provincia foreign key (id_comunidad) references comunidades(id_comunidad)on update cascade);
    
    alter table localidades
    add constraint fk_provincia_localidad foreign key (n_provincia) references provincias(n_provincia) on update cascade;
    
    
    