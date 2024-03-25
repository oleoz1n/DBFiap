set SERVEROUTPUT on;

DECLARE
    soma number := 0;
BEGIN
    for i in 1..10 loop
        soma := soma + i;
    end loop;
    dbms_output.put_line('A soma é: ' || soma);
END;

DECLARE
    soma number := 0;
BEGIN
    for i in reverse 1..10 loop
        soma := soma + i;
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('A soma é: ' || soma);
END;

DECLARE
    i NUMBER := 1;
    total number := 0;
BEGIN
    while i <= 5 loop
        total := total + i;
        dbms_output.put_line(i);
        i := i +1;
    end loop;
    dbms_output.put_line('O total é: ' || total);
END;

DECLARE
    st_ varchar2(10) := 'o';
    nome varchar2(50) := 'Francisco';
BEGIN
    while (st_ = 'o') loop
        st_ := 'e';
        nome := 'Francisco Douglas';
        dbms_output.put_line(st_);
    end loop;
    dbms_output.put_line(nome);
END;

ACCEPT nome_ent prompt 'Digite seu nome';
DECLARE
    nome_ varchar2(255);
BEGIN
    nome_:= '&nome_ent';
    while nome_ != 'Francisco' LOOP
        nome_ := '&nome_ent';
    END LOOP;
END;

DECLARE
    multiplicando number;
    multiplicador NUMBER;
    resultado number;
    
BEGIN
    for multiplicando in 1..2 loop
        for multiplicador in 1..10 loop
            resultado := multiplicando * multiplicador;
            dbms_output.put_line(multiplicando || ' * ' || multiplicador || ' = ' || resultado || '   ' );
        end loop;
    end loop;
END;