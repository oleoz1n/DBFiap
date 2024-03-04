SET SERVEROUTPUT ON;

--Ex1
ACCEPT nome CHAR prompt 'Digite seu nome:';
DECLARE
txt varchar(100);
BEGIN
    txt := '&nome';
    dbms_output.put_line( 'Meu nome é ' || txt);
END;

--Ex2
DECLARE
    total NUMBER;
    vl_real NUMBER := 4.99;
    qtd_dolar number;
BEGIN
    qtd_dolar := &qtd;
    total := qtd_dolar*vl_real;
    dbms_output.put_line(total);
END;

--Ex3
DECLARE
    vl_total number;
    juros number:=1.01;
    vl_parc number;
    qtd_parc number;
BEGIN
    vl_total := 500;
    qtd_parc:= 5;
    vl_parc := (vl_total/qtd_parc)*juros;
    dbms_output.put_line('A Quantidade de parcelas: ' || qtd_parc);
    dbms_output.put_line('O valor total da compra: ' || vl_total);
    dbms_output.put_line('O valor da parcela: ' || vl_parc);
    dbms_output.put_line('O valor total a pagar: ' || vl_parc*qtd_parc);
END;