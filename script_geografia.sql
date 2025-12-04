use geografia_db;

	create table localidades
		(id_localidad int unsigned primary key constraint ck_localidades check(id_localidad between 1 and 9000),
        nombre varchar(30) not null,
        poblacion int unsigned not null constraint ck_poblacion check (poblacion between 1 and 10000000),
        n_provincia int unsigned not null constraint ck_n_provincia check ());
        
	create table comunidades
		()
    
    
    create table provincias