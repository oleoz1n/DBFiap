set serveroutput on

create or replace package teste1
as 
disciplina varchar2(20) := 'DB Application';
unidade varchar2(30) := 'Fiap - Paulista - Manhã';
end teste1;

declare
concatena varchar2(100);
begin
concatena := teste1.disciplina || ', on FIAP';
dbms_output.put_line(concatena);
end;

 drop table emp cascade constraints;
 
 create table emp (empno number(3),
                    sal number(8,2));
                    
insert into emp values (1,1000);

select * from emp;

create or replace package rh
as 
    function descobrir_salario (p_id IN emp.empno%TYPE)
        return NUMBER;
    procedure reajuste (v_codigo_emp IN emp.empno%TYPE, v_porcentagem IN number DEFAULT 25);
end rh;


create or replace package body rh
as
    function descobrir_salario ( p_id in emp.empno%type)
    return number
    is
        v_salario emp.sal%TYPE := 0;
    begin
        select sal into v_salario from emp where empno = p_id;
        return v_salario;
    end descobrir_salario;
    
    procedure reajuste (v_codigo_emp IN emp.empno%TYPE, v_porcentagem IN number DEFAULT 25)
    is
    begin
        update emp set sal = sal + (sal*(v_porcentagem/100))
        where empno = v_codigo_emp;
    commit;
    end reajuste;
end rh;

declare
    v_sal number(8,2);
begin
    v_sal := rh.descobrir_salario(1);
    dbms_output.put_line(v_sal);
END;

select rh.descobrir_salario(1) from dual;

declare
    v_sal number(8,2);
BEGIN
    --Chamada de função
    v_sal := rh.descobrir_salario(1);
    dbms_output.put_line('Salário atual - ' || v_sal);
    --Chamada de procedimento
    rh.reajuste(1);
    v_sal := rh.descobrir_salario(1);
    dbms_output.put_line('Salário atualizado - ' || v_sal);
end;

create or replace package matematica
as
    function media (val_1 IN number, val_2 IN number, val_3 IN number)
    return number;
end matematica;


create or replace package body matematica
as
function media (val_1 IN number, val_2 IN number, val_3 IN number)
    return number is
    begin
    return (val_1+val_2+val_3)/3;
    end media;
end matematica;

select matematica.media(1,2,3) from dual;
