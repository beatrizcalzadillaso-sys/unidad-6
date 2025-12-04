use padronmunicipal_db;
	create table municipio
    (nombre varchar(30) ,
    provincia varchar(30) ,
    numhabitantes int unsigned constraint ck_numhabitantes check (numhabitantes between 5 and 10000000),
    constraint pk_municipio primary key (nombre, provincia));
    create table vivienda 
		(codigo int unsigned auto_increment primary key,
         direccion varchar(40) not null,
         nommun varchar(30), 
         nomprov varchar(30),
		 constraint UQ_vivienda unique (direccion, nommun, nomprov),
         constraint FK_municipio_vivienda foreign key (nommun, nomProv) references municipio(nombre, provincia) on update cascade); /*faltaria actualizar el constraint*/
         
	create table persona
    (nif char(9) primary key,
	nombre varchar(40) not null,
    fecnac date not null,
    codvivienda int unsigned not null,
    nifcabeza char(9) not null,
    constraint fk_vivienda_persona foreign key (codvivienda)
    references vivienda(codigo) on update cascade,
	constraint nif_cabezafamilia foreign key (nifcabeza) references persona(nif) on update cascade);
    
    create table posee
    (nif char(9),
    codvivienda int unsigned,
    constraint pk_posee primary key (nif, codvivienda),
    constraint fk_persona_posee foreign key(nif) references persona(nif) on update cascade,
    constraint fk_vivienda_posee foreign key(codvivienda) references vivienda(codigo) on update cascade);