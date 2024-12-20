create database db_faculdade;

use db_faculdade;

create table tbl_alunos (
	id int not null primary key auto_increment,
    ra int not null,
    nome varchar(300) not null,
    rg varchar(45) not null,
    cpf varchar(45) not null,
    data_nasc date not null,
    notas float not null,
    faltas int not null,
    matricula varchar(300) not null,
    
    unique index(id)
);

create table tbl_professores (
	id int primary key not null auto_increment,
    nome varchar(300) not null,
    rg varchar(45) not null,
    cargo varchar(300) not null,
    data_admissao date not null,
    cpf varchar(45) not null,
    salario float not null,
    
    unique index(id)
);

create table tbl_materias (
	id int not null auto_increment primary key,
    carga_horaria varchar(45) not null,
    nome varchar(100) not null,
    descricao text,
    
    unique index(id)
);

create table tbl_cursos (
	id int not null primary key auto_increment,
    nome varchar(150) not null,
    valor float not null,
    descricao text not null,
    
    unique index(id)
);

create table tbl_email (
	id int primary key not null auto_increment,
    email varchar(300) not null,
    id_alunos int not null,
    id_professores int not null,
    
		constraint fk_alunos_email
        foreign key (id_alunos)
        references tbl_alunos (id),
        
        constraint fk_professores_email
        foreign key (id_professores)
        references tbl_professores (id),
    
    unique index(id)
);

create table tbl_telefone (
	id int not null primary key auto_increment,
    numero_telefone varchar(45) not null,
    id_alunos int not null,
    id_professores int not null,
    
		constraint fk_alunos_telefone
        foreign key (id_alunos)
        references tbl_alunos (id),
        
        constraint fk_professores_telefone
        foreign key (id_professores)
        references tbl_professores (id),
    
    unique index(id)
);

create table tbl_prof_materias (
	id int not null primary key auto_increment,
    nome_prof varchar(300) not null,
    substituto boolean not null,
    id_professores int not null,
    id_materias int not null,
    
    constraint fk_professores_prof_materias
    foreign key (id_professores)
    references tbl_professores (id),
    
    constraint fk_materias_prof_materias
    foreign key (id_materias)
    references tbl_materias (id),
    
    unique index(id)
);

create table tbl_endereco (
	id int not null primary key auto_increment,
    logradouro varchar(45) not null,
    cep varchar(45) not null,
    bairro varchar(45) not null,
    cidade varchar(45) not null,
    estado varchar(45) not null,
    pais varchar(45) not null,
    id_alunos int not null,
    id_professores int not null,
    
		constraint fk_alunos_endereco
        foreign key (id_alunos)
        references tbl_alunos (id),
        
        constraint fk_professores_endereco
        foreign key (id_professores)
        references tbl_professores (id),
    
    unique index(id)
);

create table tbl_alunos_cursos (
	id int not null primary key auto_increment,
    id_alunos int not null,
    id_cursos int not null,
    
		constraint fk_alunos_alunos_cursos
        foreign key (id_alunos)
        references tbl_alunos (id),
        
        constraint fk_cursos_alunos_cursos
        foreign key (id_cursos)
        references tbl_cursos (id),
    
    unique index(id)
);

create table tbl_mate_cursos (
	id int not null primary key auto_increment,
    grade_curricular text,
    id_cursos int not null,
    id_materias int not null,
    
		constraint fk_cursos_mate_cursos
        foreign key (id_cursos)
        references tbl_cursos (id),
        
        constraint fk_materias_mate_cursos
        foreign key (id_materias)
        references tbl_materias (id),
    
    unique index(id)
);


show tables;




















