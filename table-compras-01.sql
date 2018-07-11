create table compras(
    id number primary key,
    valor number,
    data date,
    observacoes varchar2(30),
    recebido char check (recebido in(0,1))
);

create sequence id_seq;

insert into compras (id, valor, data, observacoes, recebido)
values (id_seq.nextval, 100, '12-05-2007', 'Compras de maio', '1');

insert into compras (id, valor, data, observacoes, recebido)
values (id_seq.nextval, 150, '12-06-2007', 'Compras de Junho', '0');

select * from compras;

select data, valor from compras;

select valor * 3, data from compras;

select valor * 3 as triplo, data from compras;

select valor, data from compras where valor > 100;

select valor, data from compras where valor >= 100;

select * from compras where valor < 120 and recebido = '1';

select * from compras where valor < 120 or recebido = '1';

select * from compras where observacoes like 'Compras%';

select * from compras where observacoes like '%de%';