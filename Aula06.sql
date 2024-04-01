create table aluno (
    RA INT PRIMARY KEY,
    NOME VARCHAR2(50)
);

DECLARE
    v_ra int := 2254 ;
    v_nome varchar2(50) := 'João Lima';
BEGIN
    insert into aluno (ra,nome) values (v_ra,v_nome);
END;

DECLARE
    v_ra int := 2254 ;
    v_nome varchar2(50) := 'João Lima';
BEGIN
    delete from aluno where ra=v_ra;
END;

DECLARE
    v_ra int := 2254 ;
    v_nome varchar2(50);
BEGIN
    select nome into v_nome from aluno where ra=v_ra;
    dbms_output.put_line(v_nome);
END;




DECLARE
    CURSOR prod_cursor(id_prod integer) is
        select desc_produto, valor_produto from produto where id_produto = is_prod;
        
    rowp prod_cursor%rowtype;
BEGIN
    OPEN prod_cursor(10);
    LOOP
        FETCH prod_cursor into rowp;
        exit when prod_cursor%notfound;
        dbms_output.put_line('Nome: ' || rowp.desc_produto);
        dbms_output.put_line('Valor: ' || rowp.valor_produto);
    END LOOP;
    CLOSE PROD_CURSOR;
END;
    