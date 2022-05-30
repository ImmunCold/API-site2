create database immuncold;
use immuncold;

create table empresa (
id_empresa int not null primary key auto_increment,
nome varchar(255) not null,
representante varchar(255) not null,
cnpj varchar(25) not null unique,
cep varchar(50),
endereco varchar(150),
telefone varchar(14) not null unique,
email varchar(100) not null unique,
senha varchar(25)not null) auto_increment = 1000;

create table usuario (
id_usuario int not null primary key auto_increment,
nome_usuario varchar (255) not null,
telefone_usuario int,
email_usuario varchar (255) unique not null,
senha_usuario varchar (25),
fk_empresa int,
foreign key (fk_empresa) references empresa (id_empresa)
);

create table localidade (
id_localidade int not null primary key auto_increment,
tipo varchar(13) not null,
check (tipo = 'Transporte' or tipo = 'Armazenamento'),
endereco_localidade varchar(150) not null,
identificador varchar(25) not null);

create table sensor (
id_sensor int not null primary key auto_increment,
fk_empresa int not null,
foreign key (fk_empresa)
references empresa(id_empresa),
fk_localidade int not null,
foreign key (fk_localidade)
references localidade(id_localidade));

create table parametro (
id_parametro int not null primary key auto_increment,
nome_vacina varchar(50) not null,
temp_max int not null,
temp_min int not null);

create table registro (
id_registro int not null primary key auto_increment,
registro decimal not null,
data_horario datetime default current_timestamp not null,
fk_sensor int not null,
foreign key (fk_sensor)
references sensor(id_sensor),
fk_empresa int not null,
foreign key (fk_empresa)
references empresa(id_empresa),
fk_localidade int not null,
foreign key (fk_localidade)
references localidade(id_localidade),
fk_parametro int not null,
foreign key (fk_parametro)
references parametro(id_parametro));
