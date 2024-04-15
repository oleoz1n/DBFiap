set SERVEROUTPUT on;

-- Criando procedure
create or replace procedure calculadora (
    num1 in number,
    num2 in number,
    operacao in varchar2,
    resultado out number
)
    AS BEGIN
        case operacao
            when '+' then
                resultado := num1 + num2;
            when '-' then
                resultado := num1 - num2;
            when '*' then
                resultado := num1 * num2;
            when '/' then
                if num2 != 0 then
                    resultado := num1 / num2;
                else
                    dbms_output.put_line('Erro: Divis�o por zero');
                end if;
            else
                dbms_output.put_line('Opera��o inv�lida');
        end case;
    end;

declare
    resultado number;
begin
    calculadora(10, 20, '+', resultado);
    dbms_output.put_line('Resultado da soma �: ' || resultado);
    
    calculadora(10, 20, '-', resultado);
    dbms_output.put_line('Resultado da subtra��o �: ' || resultado);
    
    calculadora(10, 20, '*', resultado);
    dbms_output.put_line('Resultado da multiplica��o �: ' || resultado);
    
    calculadora(10, 20, '/', resultado);
    dbms_output.put_line('Resultado da divis�o �: ' || resultado);
end;

-- Criando function
create or replace function calculadora (
    num1 in number,
    num2 in number,
    operacao in varchar2
) RETURN NUMBER
    AS 
        resultado number;
        BEGIN
        case operacao
            when '+' then
                resultado := num1 + num2;
            when '-' then
                resultado := num1 - num2;
            when '*' then
                resultado := num1 * num2;
            when '/' then
                if num2 != 0 then
                    resultado := num1 / num2;
                else
                    RAISE_APPLICATION_ERROR(-20001, 'Erro: Divis�o por zero');
                end if;
            else
            RAISE_APPLICATION_ERROR(-20002,'Opera��o inv�lida');
        end case;
    end;
    
declare
    resultado number;
begin
    calculadora(10, 20, '+', resultado);
    dbms_output.put_line('Resultado da soma �: ' || resultado);
    
    calculadora(10, 20, '-', resultado);
    dbms_output.put_line('Resultado da subtra��o �: ' || resultado);
    
    calculadora(10, 20, '*', resultado);
    dbms_output.put_line('Resultado da multiplica��o �: ' || resultado);
    
    calculadora(10, 20, '/', resultado);
    dbms_output.put_line('Resultado da divis�o �: ' || resultado);
exception
    when others then
        dbms_output.put_line('Erro: ' || SQLERRM);
end;

select calculadora(10,5,'+') as resultado_adicao,
    calculdora(10,5,'-') as resultado_subtracao,
    calculdora(10,5,'*') as resultado_multiplicacao,
    calculdora(10,5,'/') as resultado_divisao
    from dual;