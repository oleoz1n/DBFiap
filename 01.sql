SET SERVEROUTPUT ON;

--Ex1
DECLARE
nome varchar2(100);
BEGIN
nome := 'Leo';
DBMS_OUTPUT.put_line(nome);
END;

--Ex2
DECLARE
    VL1 NUMBER;
    VL2 NUMBER;
    VL3 NUMBER;
    TOTAL NUMBER;
BEGIN
    VL1 := 1;
    VL2 := 2;
    VL3 := 3;
    TOTAL := VL1 + VL2 + VL3;
    DBMS_OUTPUT.put_line(TOTAL);
END;

--Ex3
DECLARE
    VLR int;
    ANT int;
    SUC int;
BEGIN
    vlr := 5;
    ant := vlr-1;
    suc := vlr+1;
    dbms_output.put_line('Valor é: ' || vlr);
    dbms_output.put_line('O Antecessor é: '|| ant);
    dbms_output.put_line('O sucessor é: ' || suc);
END;

--Ex4
DECLARE
    MEU_SALARIO NUMBER;
    QTD NUMBER;
BEGIN
    MEU_SALARIO := 4500;
    qtd := meu_salario/1412;
    dbms_output.put_line('Quantidade de salarios minimos é: ' || qtd);
END;

--Ex5
DECLARE
    cp1 numeric;
    cp2 numeric;
    cp3 numeric;
    media numeric;
BEGIN
    cp1 := 9;
    cp2 := 10;
    cp3 := 5;
    media := (cp1+cp2+cp3)/3;
    dbms_output.put_line('A média é: '||media);
END;

--Ex6
DECLARE
    MEU_SALARIO NUMBER;
    SALARIO_REAJ NUMBER;
    TX_REAJ NUMBER;
BEGIN
    TX_REAJ := 1.05;
    MEU_SALARIO := 4500;
    SALARIO_REAJ := MEU_SALARIO*TX_REAJ;
    dbms_output.put_line('MEU SALARIO É: R$'|| SALARIO_REAJ);
END;