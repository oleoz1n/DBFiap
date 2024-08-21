drop table produto cascade constraints;
create table PRODUTO (
    codigo number(4),
    valor number(7,2));
    
insert into produto values(1001, 2.55);
insert into produto values(1002, 3.25);
insert into produto values(1003, 2.85);

drop table valor_produto cascade constraints;
create table valor_produto (
    codigo number(4),
    valor_anterior number(7,2),
    valor_novo number (7,2));
    
create or replace trigger verifica_valor
before update
of valor
on produto
for each row
begin
insert into valor_produto
values
(:old.codigo, :old.valor, :new.valor);
end;

select * from produto;
select * from valor_produto;

update produto set valor = 1.45 where codigo = 1003;

drop table funcFiap cascade constraints;
create table funcFiap (mat_fun number(3) primary key,
                            nm_fun varchar(30) not null,
                            salario number(10,2));
                            
create or replace trigger validar_salario
before insert on funcFiap
for each row
begin
    if :new.salario < 0 then
        raise_application_error(-20001, 'O salário não pode ser um valor negativo');
    end if;
end;


insert into funcFiap values(123, 'Leonardo', -1);
insert into funcFiap values(321, 'Leonardo', 10000);

alter table funcFiap add senha varchar(20);

select * from funcFiap;


drop table auditoria_senha ;
create table auditoria_senha (
                        senha_antiga varchar2(20),
                        senha_atual varchar2(20),
                        dt_alterada date
                        );

create or replace trigger valida_senha
after update
of senha
on funcFiap
for each row
begin
    if :new.senha != :old.senha then
        insert into auditoria_senha values (:old.senha, :new.senha, sysdate);
    end if;
end;

insert into funcFiap values (311, 'Leonardo', 20000, 'SalveLeo');

update funcFiap set senha = 'SalveLeo' where mat_fun = 321;

select * from funcFiap;
select * from auditoria_senha;