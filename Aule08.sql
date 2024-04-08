
DECLARE
    CURSOR prod_cursor(id_prod integer) is
        select desc_produto, valor_produto from produto where id_produto = id_prod;
        
    rowp prod_cursor%rowtype;
BEGIN
    OPEN prod_cursor(8);
    LOOP
        FETCH prod_cursor into rowp;
        exit when prod_cursor%notfound;
        dbms_output.put_line('Nome: ' || rowp.desc_produto);
        dbms_output.put_line('Valor: ' || rowp.valor_produto);
    END LOOP;
    CLOSE PROD_CURSOR;
END;

DECLARE
    CURSOR prod_cursor(id_prod integer) is
        select desc_produto, valor_produto from produto where id_produto = id_prod;
        
    rowp prod_cursor%rowtype;
BEGIN
    FOR i IN 1..5
    LOOP
        OPEN prod_cursor(i);
        FETCH prod_cursor into rowp;
        dbms_output.put_line('Nome: ' || rowp.desc_produto);
        dbms_output.put_line('Valor: ' || rowp.valor_produto);
        CLOSE PROD_CURSOR;
    END LOOP;
END;

DECLARE
    CURSOR prod_cursor(id_prod integer) is
        select desc_produto, valor_produto from produto where id_produto = id_prod;
        
    desc_produto PRODUTO.DESC_PRODUTO%TYPE;
    valor_produto produto.valor_produto%type;
BEGIN
    OPEN prod_cursor(10);
    LOOP
        FETCH prod_cursor into desc_produto, valor_produto;
        exit when prod_cursor%notfound;
        dbms_output.put_line('Nome: ' || desc_produto);
        dbms_output.put_line('Valor: ' || valor_produto);
    END LOOP;
    CLOSE PROD_CURSOR;
END;

DECLARE
    CURSOR prod_cursor(id_prod integer) is
        select desc_produto, valor_produto from produto where id_produto = id_prod;
        
    rowp prod_cursor%rowtype;
    rows_found number := 0;
BEGIN
    for rowp in prod_cursor(10) LOOP
        if prod_cursor%found then
            dbms_output.put_line('Nome: ' || rowp.desc_produto);
            dbms_output.put_line('Valor: ' || rowp.valor_produto);
            rows_found := rows_found + 1;
        else
            dbms_output.put_line('Nenhum produto encontrado para o ID fornecido');
        END IF;
    END LOOP;
    if rows_found = 0 then
        DBMS_OUTPUT.PUT_LINE('Nenhum produto encontrado para o ID fornecido');
    END IF;
END;