set SERVEROUTPUT on


Create or replace PROCEDURE create_produto (
    p_id_produto in integer,
    p_desc_produto in varchar2,
    p_valor_produto in number
    )
    IS
    BEGIN
        insert into produto (id_produto, desc_produto, valor_produto) 
            values(p_id_produto, p_desc_produto, p_valor_produto);
            commit;
    exception
        when others then
            rollback;
            raise_application_error(-20001, 'Erro ao criar produto: ' || SQLERRM);
    END create_produto;
    
begin
create_produto(21,'Nescau 500g', 10.00);
END;

create or replace function get_produto (
    p_id_produto in integer 
    ) return produto%rowtype
    is
        v_produto produto%rowtype;
    BEGIN
        SELECT * into v_produto
            from produto
                where id_produto = p_id_produto;
         return v_produto;
    exception
        when no_data_found then
            raise_application_error(-20002, 'Peoduto não encontrado');
        when others then
            raise_application_error(-20001, 'Erro ao buscar produto: ' || SQLERRM);
    end get_produto;
    
declare
    v_produto produto%rowtype;
begin
    v_produto := get_produto(21);
    dbms_output.put_line('ID: ' || v_produto.id_produto || ' DESC: ' || v_produto.desc_produto || ' Valor: ' || v_produto.valor_produto);
end;

create or replace procedure update_valor_produto (
    p_id_produto in integer,
    P_novo_valor in number
    ) IS BEGIN
    update produto
    set valor_produto = p_novo_valor
    where id_produto = p_id_produto;
    commit;
    EXCEPTION
        when no_data_found then
            raise_application_error(-20002, 'Produto não encontrado');
        when others then
            rollback;
            raise_application_error(-20001, 'Erro ao atuaizar valor do produto: ' || sqlerrm);
    END update_valor_produto;
    
    
declare
    v_produto produto%rowtype;
begin
    update_valor_produto(21, 21);
    v_produto := get_produto(21);
    dbms_output.put_line('ID: ' || v_produto.id_produto || ' DESC: ' || v_produto.desc_produto || ' Valor: ' || v_produto.valor_produto);
end;

create or replace procedure delete_produto (
    p_id_produto in integer
    ) is begin
        delete from produto 
            where id_produto = p_id_produto;
        commit;
    exception
        when no_data_found then
            raise_application_error(-20002, 'Peoduto não encontrado');
        when others then
            rollback;
            raise_application_error(-20001, 'Erro ao deletar produto: ' || SQLERRM);
    END delete_produto;
    
begin
    delete_produto(21);
end;

select * from produto;
        