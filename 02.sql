SET SERVEROUTPUT ON;

--Ex1
variable nome VARCHAR2(255);
BEGIN
    :nome := 'Leo';
    dbms_output.put_line(:nome);
END;

--Ex2
variable total NUMBER;
variable vl_real number;
variable qtd_dolar number;

BEGIN
    :vl_real := 4.99;
    :qtd_dolar := 3;
    :total := :qtd_dolar*:vl_real;
    dbms_output.put_line(:total);
END;

--Ex3 não entendi