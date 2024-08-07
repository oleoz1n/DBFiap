// DROP DE TABELAS
DROP TABLE automoveis CASCADE CONSTRAINTS;

DROP TABLE revendedoras CASCADE CONSTRAINTS;

DROP TABLE consumidores CASCADE CONSTRAINTS;

DROP TABLE garagens CASCADE CONSTRAINTS;

DROP TABLE negocios CASCADE CONSTRAINTS;


// CRIACAO DE TABELAS
CREATE TABLE automoveis (
    codigo       NUMBER(4) PRIMARY KEY,
    fabricante   VARCHAR2(20) NOT NULL,
    modelo       VARCHAR2(10) NOT NULL,
    ano          NUMBER(4) NOT NULL,
    pais         VARCHAR2(15) NOT NULL,
    preco_tabela NUMBER(8, 2) NOT NULL
);

CREATE TABLE revendedoras (
    cnpj         VARCHAR2(16) PRIMARY KEY,
    nome         VARCHAR2(20) NOT NULL,
    proprietario VARCHAR2(20) NOT NULL,
    cidade       VARCHAR2(15) NOT NULL,
    estado       CHAR(2) NOT NULL
);

CREATE TABLE consumidores (
    id_con    NUMBER(4) PRIMARY KEY,
    nome      VARCHAR2(20) NOT NULL,
    sobrenome VARCHAR2(15) NOT NULL
);

CREATE TABLE negocios (
    anoauto   NUMBER(4) NOT NULL,
    data      DATE NOT NULL,
    preco     NUMBER(8, 2) NOT NULL,
    comprador NUMBER(4) NOT NULL,
    revenda   VARCHAR2(16) NOT NULL,
    codauto   NUMBER(4) NOT NULL,
    CONSTRAINT fk_consumidores_negocios FOREIGN KEY ( comprador )
        REFERENCES consumidores ( id_con ),
    CONSTRAINT fk_automoveis_negocios FOREIGN KEY ( codauto )
        REFERENCES automoveis ( codigo ),
    CONSTRAINT fk_revendedoras_negocios FOREIGN KEY ( revenda )
        REFERENCES revendedoras ( cnpj ),
    CONSTRAINT pk_negocios PRIMARY KEY ( comprador,
                                         revenda,
                                         codauto )
);

CREATE TABLE garagens (
    anoauto     NUMBER(4) NOT NULL,
    quantidade  NUMBER(4) NOT NULL,
    cnpjrevenda VARCHAR2(16) NOT NULL,
    codauto     NUMBER(4) NOT NULL,
    CONSTRAINT fk_revendedoras_garagens FOREIGN KEY ( cnpjrevenda )
        REFERENCES revendedoras ( cnpj ),
    CONSTRAINT fk_automoveis_garagens FOREIGN KEY ( codauto )
        REFERENCES automoveis ( codigo ),
    CONSTRAINT pk_garagens PRIMARY KEY ( cnpjrevenda,
                                         codauto )
);


//PROCEDURES DE CRIACAO
CREATE OR REPLACE PROCEDURE create_automoveis (
    p_codigo       automoveis.codigo%TYPE,
    p_fabricante   automoveis.fabricante%TYPE,
    p_modelo       automoveis.modelo%TYPE,
    p_ano          automoveis.ano%TYPE,
    p_pais         automoveis.pais%TYPE,
    p_preco_tabela automoveis.preco_tabela%TYPE
) IS
BEGIN
    INSERT INTO automoveis (
        codigo,
        fabricante,
        modelo,
        ano,
        pais,
        preco_tabela
    ) VALUES (
        p_codigo,
        p_fabricante,
        p_modelo,
        p_ano,
        p_pais,
        p_preco_tabela
    );

    COMMIT;
EXCEPTION
    WHEN value_error THEN
        ROLLBACK;
        raise_application_error(-20001, 'Erro: Tipo de atributo invalido');
    WHEN OTHERS THEN
        ROLLBACK;
        raise_application_error(-20003, 'Erro: ' || sqlerrm);
END create_user;

CREATE OR REPLACE PROCEDURE create_revendedoras (
  p_cnpj        revendedoras.cnpj%TYPE,
  p_nome        revendedoras.nome%TYPE,
  p_proprietario revendedoras.proprietario%TYPE,
  p_cidade      revendedoras.cidade%TYPE,
  p_estado      revendedoras.estado%TYPE
) IS
BEGIN
  INSERT INTO revendedoras (
    cnpj,
    nome,
    proprietario,
    cidade,
    estado
  ) VALUES (
    p_cnpj,
    p_nome,
    p_proprietario,
    p_cidade,
    p_estado
  );

  COMMIT;
EXCEPTION
  WHEN value_error THEN
    ROLLBACK;
    raise_application_error(-20001, 'Erro: Tipo de atributo invalido');
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20003, 'Erro: ' || sqlerrm);
END create_revendedoras;

CREATE OR REPLACE PROCEDURE create_consumidores (
  p_id_con     consumidores.id_con%TYPE,
  p_nome       consumidores.nome%TYPE,
  p_sobrenome  consumidores.sobrenome%TYPE
) IS
BEGIN
  INSERT INTO consumidores (
    id_con,
    nome,
    sobrenome
  ) VALUES (
    p_id_con,
    p_nome,
    p_sobrenome
  );

  COMMIT;
EXCEPTION
  WHEN value_error THEN
    ROLLBACK;
    raise_application_error(-20001, 'Erro: Tipo de atributo invalido');
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20003, 'Erro: ' || sqlerrm);
END create_consumidores;

CREATE OR REPLACE PROCEDURE create_negocios (
  p_anoauto   negocios.anoauto%TYPE,
  p_data      negocios.data%TYPE,
  p_preco     negocios.preco%TYPE,
  p_comprador negocios.comprador%TYPE,
  p_revenda   negocios.revenda%TYPE,
  p_codauto   negocios.codauto%TYPE
) IS
BEGIN
  INSERT INTO negocios (
    anoauto,
    data,
    preco,
    comprador,
    revenda,
    codauto
  ) VALUES (
    p_anoauto,
    p_data,
    p_preco,
    p_comprador,
    p_revenda,
    p_codauto
  );

  COMMIT;
EXCEPTION
  WHEN value_error THEN
    ROLLBACK;
    raise_application_error(-20001, 'Erro: Tipo de atributo invalido');
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20003, 'Erro: ' || sqlerrm);
END create_negocios;

CREATE OR REPLACE PROCEDURE create_garagens (
  p_anoauto     garagens.anoauto%TYPE,
  p_quantidade  garagens.quantidade%TYPE,
  p_cnpjrevenda garagens.cnpjrevenda%TYPE,
  p_codauto     garagens.codauto%TYPE
) IS
BEGIN
  INSERT INTO garagens (
    anoauto,
    quantidade,
    cnpjrevenda,
    codauto
  ) VALUES (
    p_anoauto,
    p_quantidade,
    p_cnpjrevenda,
    p_codauto
  );

  COMMIT;
EXCEPTION
  WHEN value_error THEN
    ROLLBACK;
    raise_application_error(-20001, 'Erro: Tipo de atributo invalido');
  WHEN OTHERS THEN
    ROLLBACK;
    raise_application_error(-20003, 'Erro: ' || sqlerrm);
END create_garagens;
