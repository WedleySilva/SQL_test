-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
create database 2info3_22_mod2;
use 2info3_22_mod2;


CREATE TABLE tipo_usuario (
cod_tipousuario int auto_increment PRIMARY KEY,
descricao_tipo varchar(80) not null
);

CREATE TABLE leciona (
cod_materia int not null,
cod_usuario int not null,
cod_curso int not null,
cod_turma int not null,
dt_inicio date,
dt_fim date,
cod_leciona int auto_increment PRIMARY KEY
);

CREATE TABLE matricula (
cod_turma int not null,
cod_usuario int not null,
dt_inicio date,
dt_fim date
);

CREATE TABLE registro_aula (
cod_leciona int not null,
cod_turma int not null,
dt_aula date not null,
descricao_aula varchar(500),
cod_registro int auto_increment PRIMARY KEY,
FOREIGN KEY(cod_leciona) REFERENCES leciona (cod_leciona)
);

CREATE TABLE curso (
cod_curso int auto_increment PRIMARY KEY,
nome_curso varchar(120) not null,
ch_curso int not null
);

CREATE TABLE turma (
cod_turma int auto_increment PRIMARY KEY,
descricao_turma varchar(120),
dt_inicio date,
dt_termino date,
cod_curso int not null,
FOREIGN KEY(cod_curso) REFERENCES curso (cod_curso)
);

CREATE TABLE materia (
descricao_materia varchar(250),
ch_materia int,
cod_materia int auto_increment PRIMARY KEY
);

CREATE TABLE usuario (
cod_usuario int auto_increment PRIMARY KEY,
senha_usuario varchar(25) not null,
nome_usuario varchar(200) not null,
cpf int not null,
login_usuario varchar(120) not null,
cod_tipousuario int not null,
FOREIGN KEY(cod_tipousuario) REFERENCES tipo_usuario (cod_tipousuario)
);

ALTER TABLE leciona ADD FOREIGN KEY(cod_materia) REFERENCES materia (cod_materia);
ALTER TABLE leciona ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE leciona ADD FOREIGN KEY(cod_curso) REFERENCES curso (cod_curso);
ALTER TABLE leciona ADD FOREIGN KEY(cod_turma) REFERENCES turma (cod_turma);
ALTER TABLE matricula ADD FOREIGN KEY(cod_turma) REFERENCES turma (cod_turma);
ALTER TABLE matricula ADD FOREIGN KEY(cod_usuario) REFERENCES usuario (cod_usuario);
ALTER TABLE registro_aula ADD FOREIGN KEY(cod_turma) REFERENCES turma (cod_turma);
