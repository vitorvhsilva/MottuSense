set verify off;
set serveroutput on;

-- SPRINT 1/2

/*
deletar todas as tabelas se necessario
BEGIN
  FOR cur_rec IN (SELECT table_name FROM user_tables) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE "' || cur_rec.table_name || '" CASCADE CONSTRAINTS';
  END LOOP;
END;
*/

drop table TB_ESTRUTURA_PATIO cascade constraints;
drop table TB_LOCALIZACAO_MOTO cascade constraints;
drop table TB_EVENTO_MOTO cascade constraints;
drop table TB_EVENTO cascade constraints;
drop table TB_MOTO cascade constraints;
drop table TB_PATIO cascade constraints;

//estrutura uuid para os ids, por isso varchar2

create table TB_PATIO (
    id_patio VARCHAR2(255),
    id_filial VARCHAR2(255), 
    estrutura_criada_patio NUMBER(1),
    CONSTRAINT tb_patio_id_patio_pk PRIMARY KEY(id_patio)
);

create table TB_ESTRUTURA_PATIO (
    id_patio VARCHAR2(255),
    coordenada_x_estrutura NUMBER,
    coordenada_y_estrutura NUMBER,
    tamanho_estrutura NUMBER,
    rotacao_estrutura NUMBER,
    CONSTRAINT tb_estrutura_patio_id_patio_fk FOREIGN KEY(id_patio) 
        REFERENCES TB_PATIO(id_patio)
);

create table TB_MOTO (
    id_moto VARCHAR2(255),
    id_patio VARCHAR2(255),
    placa_moto VARCHAR2(255),
    modelo_moto VARCHAR2(255),
    status_moto VARCHAR2(255),
    chassi_moto VARCHAR2(255),
    iot_moto VARCHAR2(255),
    CONSTRAINT tb_moto_id_moto_pk PRIMARY KEY (id_moto),
    CONSTRAINT tb_moto_id_patio_fk FOREIGN KEY (id_patio)
        REFERENCES TB_PATIO(id_patio)
);

create table TB_EVENTO (
    id_evento VARCHAR2(255),
    descricao_evento VARCHAR2(255),
    cor_evento VARCHAR2(255),
    CONSTRAINT tb_evento_id_evento_pk PRIMARY KEY (id_evento)
);

create table TB_EVENTO_MOTO (
    id_moto VARCHAR2(255),
    id_evento VARCHAR2(255),
    data_hora_evento TIMESTAMP,
    visualizado_evento NUMBER(1),
    CONSTRAINT tb_evento_moto_id_evento_fk FOREIGN KEY (id_evento)
        REFERENCES TB_EVENTO(id_evento),
    CONSTRAINT tb_evento_moto_id_moto_fk FOREIGN KEY (id_moto)
        REFERENCES TB_MOTO(id_moto)
);

create table TB_LOCALIZACAO_MOTO (
    id_moto VARCHAR2(255),
    latitude_moto VARCHAR2(255),
    longitude_moto VARCHAR2(255),
    CONSTRAINT tb_localizacao_moto_id_moto_pk PRIMARY KEY (id_moto),
    CONSTRAINT tb_localizacao_moto_id_moto_fk FOREIGN KEY (id_moto)
        REFERENCES TB_MOTO(id_moto)
);

begin
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('1', '1', 0);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('2', '2', 0);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('3', '3', 0);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('4', '4', 0);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('5', '5', 1);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('6', '6', 1);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('7', '7', 0);
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) values ('8', '8', 1);

    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('5', 12, 10, 50, 90);
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('5', 20, 0, 100, 180);
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('5', 20, 100, 100, 180);
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('5', 20, 0, 100, 90);
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('5', 120, 100, 65, 180);
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('6', 10, 10, 50, 0);
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) values ('8', 20, 20, 75, 90);

    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('1', '5', 'XXXX-777', 'MOTTU-POP', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('2', '5', 'AAAA-123', 'MOTTU-SPORT', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('3', '5', 'FFFF-321', 'MOTTU-E', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('4', '5', 'YYYY-453', 'MOTTU-POP', 'SEM_PLACA', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('5', '5', 'OOOO-544', 'MOTTU-POP', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('6', '6', 'BBBB-111', 'MOTTU-E', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('7', '6', 'CCCC-222', 'MOTTU-POP', 'SEM_PLACA', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('8', '7', 'DDDD-333', 'MOTTU-SPORT', 'EM_MANUTENCAO', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('9', '8', 'EEEE-444', 'MOTTU-E', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto) values ('10', '8', 'FFFF-555', 'MOTTU-POP', 'SEM_PLACA', 'ID-CHASSI', 'ID-IOT');

    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('1', '1232334132', '2312321312');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('2', '3231312332', '8928101011');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('3', '8748041278', '3210937811');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('4', '2189038012', '2301837218');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('5', '3812738129', '8904819441');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('6', '1234567890', '9876543210');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('7', '1122334455', '5566778899');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('8', '2233445566', '6677889900');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('9', '3344556677', '7788990011');
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto) values ('10', '4455667788', '8899001122');

    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento) values ('1', 'Moto em manutenção!', 'CINZA');
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento) values ('2', 'Moto pronta para ser alugada!', 'VERDE');
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento) values ('3', 'Moto chegou sem placa!', 'VERMELHO');
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento) values ('4', 'Moto em manutenção', 'AMARELO');
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento) values ('5', 'Moto pronta para aluguel', 'VERDE');
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento) values ('6', 'Moto sem placa', 'VERMELHO');

    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('1', '1', TIMESTAMP '2025-04-25 10:00:00', 1);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('1', '2', TIMESTAMP '2025-04-25 12:00:00', 1);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('2', '2', TIMESTAMP '2025-04-26 09:00:00', 1);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('3', '3', TIMESTAMP '2025-04-27 15:30:00', 0);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('3', '2', TIMESTAMP '2025-04-27 17:30:00', 0);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('6', '5', TIMESTAMP '2025-05-01 08:00:00', 1);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('7', '6', TIMESTAMP '2025-05-01 09:30:00', 0);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('8', '4', TIMESTAMP '2025-05-02 10:15:00', 1);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('9', '5', TIMESTAMP '2025-05-03 11:45:00', 1);
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento) values ('10', '6', TIMESTAMP '2025-05-03 12:30:00', 0);
end;
/


-- Motos com suas localizações e quantidade de eventos
declare
    cursor c_motos_localizacoes_eventos is
        select
            m.id_moto,
            m.placa_moto,
            m.modelo_moto,
            lm.latitude_moto,
            lm.longitude_moto,
            count(em.id_moto) as quantidade_eventos
        from TB_MOTO m
        inner join TB_LOCALIZACAO_MOTO lm on m.id_moto = lm.id_moto
        left join TB_EVENTO_MOTO em on m.id_moto = em.id_moto
        group by m.id_moto, m.placa_moto, m.modelo_moto, lm.latitude_moto, lm.longitude_moto
        order by quantidade_eventos desc;
            
    v_resultado VARCHAR2(1000);
begin
    dbms_output.put_line('Motos com sua localização e quantidade de eventos:');
    dbms_output.put_line('Id | Placa      | Modelo       | Latitude       | Longitude      | Qtd Eventos');
    dbms_output.put_line('------------------------------------------------------------------------------');
    for moto_rec in c_motos_localizacoes_eventos loop
        v_resultado := moto_rec.id_moto || '  | ' || 
                       rpad(moto_rec.placa_moto, 10) || ' | ' || 
                       rpad(moto_rec.modelo_moto, 12) || ' | ' || 
                       rpad(moto_rec.latitude_moto, 14) || ' | ' || 
                       rpad(moto_rec.longitude_moto, 14) || ' | ' || 
                       moto_rec.quantidade_eventos;
        
        dbms_output.put_line(v_resultado);
    end loop;
end;
/

-- Pátios com estruturas e motos
declare
    cursor c_patios_estruturas_motos is
        select 
            p.id_patio,
            p.estrutura_criada_patio,
            count(distinct ep.coordenada_x_estrutura) as qtd_estruturas,
            count(distinct m.id_moto) as qtd_motos
        from tb_patio p
        left join tb_estrutura_patio ep on p.id_patio = ep.id_patio
        left join tb_moto m on p.id_patio = m.id_patio
        group by p.id_patio, p.estrutura_criada_patio
        order by qtd_motos desc, qtd_estruturas desc;
    
    v_linha varchar2(1000);
begin
    dbms_output.put_line('Pátios com informações de estrutura e quantidade de motos');
    dbms_output.put_line('Pátio | Estrut Criada  | Qtd Estrut  | Qtd motos');
    dbms_output.put_line('------------------------------------------------');
    for rec in c_patios_estruturas_motos loop
        v_linha := 
            rpad(rec.id_patio, 5) || ' | ' ||
            rpad(to_char(rec.estrutura_criada_patio), 14) || ' | ' ||
            rpad(to_char(rec.qtd_estruturas), 11) || ' | ' ||
            rpad(to_char(rec.qtd_motos), 9);
        
        dbms_output.put_line(v_linha);
    end loop;
end;
/

-- Relatório que lê a linha anterior e a próxima
declare
    cursor c_motos is
        select
            id_moto,
            placa_moto,
            lag(placa_moto) over (order by id_moto) as placa_anterior,
            lead(placa_moto) over (order by id_moto) as placa_proxima
        from tb_moto
        order by id_moto;
    
    v_linha VARCHAR2(200);
begin
    dbms_output.put_line('Id | Placa Atual | Placa Anterior | Próxima Placa');
    dbms_output.put_line('--------------------------------------------------');
    
    for moto_rec in c_motos loop
        v_linha := 
            moto_rec.id_moto || '  | ' ||
            rpad(NVL(moto_rec.placa_moto, 'Vazio'), 11) || ' | ' ||
            rpad(NVL(moto_rec.placa_anterior, 'Vazio'), 14) || ' | ' ||
            NVL(moto_rec.placa_proxima, 'Vazio');
        dbms_output.put_line(v_linha);
    end loop;
end;
/









-- SPRINT 3

create or replace function fn_to_json_moto_completa(
    p_id_moto varchar2
) return varchar2
is
    v_json varchar2(4000);
    v_eventos varchar2(2000);
    v_estruturas varchar2(2000);
begin
    v_eventos := '';
    for ev in (
        select e.descricao_evento, e.cor_evento, em.data_hora_evento, em.visualizado_evento
        from tb_evento_moto em
        inner join tb_evento e on em.id_evento = e.id_evento
        where em.id_moto = p_id_moto
        order by em.data_hora_evento
    ) loop
        if v_eventos is not null and v_eventos <> '' then
            v_eventos := v_eventos || ',';
        end if;
        v_eventos := v_eventos || '{' ||
                      '"descricao":"' || ev.descricao_evento || '",' ||
                      '"cor":"' || ev.cor_evento || '",' ||
                      '"data_hora":"' || to_char(ev.data_hora_evento,'yyyy-mm-dd hh24:mi:ss') || '",' ||
                      '"visualizado":' || ev.visualizado_evento ||
                      '}';
    end loop;
    v_eventos := '[' || v_eventos || ']';
    
    v_estruturas := '';
    for est in (
        select ep.coordenada_x_estrutura, ep.coordenada_y_estrutura, ep.tamanho_estrutura, ep.rotacao_estrutura
        from tb_moto m
        inner join tb_patio p on m.id_patio = p.id_patio
        inner join tb_estrutura_patio ep on ep.id_patio = p.id_patio
        where m.id_moto = p_id_moto
    ) loop
        if v_estruturas is not null and v_estruturas <> '' then
            v_estruturas := v_estruturas || ',';
        end if;
        v_estruturas := v_estruturas || '{' ||
                        '"x":' || est.coordenada_x_estrutura || ',' ||
                        '"y":' || est.coordenada_y_estrutura || ',' ||
                        '"tamanho":' || est.tamanho_estrutura || ',' ||
                        '"rotacao":' || est.rotacao_estrutura ||
                        '}';
    end loop;
    v_estruturas := '[' || v_estruturas || ']';

    select 
        '{' ||
        '"id_moto":"' || m.id_moto || '",' ||
        '"placa":"' || m.placa_moto || '",' ||
        '"modelo":"' || m.modelo_moto || '",' ||
        '"status":"' || m.status_moto || '",' ||
        '"chassi":"' || m.chassi_moto || '",' ||
        '"iot":"' || m.iot_moto || '",' ||
        '"latitude":"' || lm.latitude_moto || '",' ||
        '"longitude":"' || lm.longitude_moto || '",' ||
        '"patio":{' ||
            '"id_patio":"' || p.id_patio || '",' ||
            '"id_filial":"' || p.id_filial || '",' ||
            '"estrutura_criada":' || p.estrutura_criada_patio || ',' ||
            '"estruturas":' || v_estruturas ||
        '},' ||
        '"eventos":' || v_eventos ||
        '}'
    into v_json
    from tb_moto m
    inner join tb_localizacao_moto lm on m.id_moto = lm.id_moto
    inner join tb_patio p on m.id_patio = p.id_patio
    where m.id_moto = p_id_moto;

    return v_json;

exception
    when no_data_found then
        return '{"error":"Moto não encontrada"}';
    when value_error then
        return '{"error":"Erro de valor"}';
    when others then
        return '{"error":"Erro desconhecido"}';
end;
/

create or replace procedure sp_listar_motos_json_completo
is
    cursor c_motos is
        select id_moto from tb_moto;
    v_json varchar2(4000);
begin
    dbms_output.put_line('json completo das motos:');

    for rec in c_motos loop
        v_json := fn_to_json_moto_completa(rec.id_moto);
        dbms_output.put_line(v_json);
    end loop;

exception
    when no_data_found then
        dbms_output.put_line('nenhuma moto encontrada.');
    when value_error then
        dbms_output.put_line('erro de valor na conversão.');
    when others then
        dbms_output.put_line('erro desconhecido: ' || sqlerrm);
end;
/

begin
    sp_listar_motos_json_completo;
end;
/

create or replace function fn_status_moto_num(p_id_moto varchar2) return number
is
    v_status varchar2(50);
begin
    select status_moto into v_status
    from tb_moto
    where id_moto = p_id_moto;

    if v_status = 'PRONTA_ALUGUEL' then
        return 1;
    elsif v_status = 'SEM_PLACA' then
        return 0;
    else
        return -1;
    end if;

exception
    when no_data_found then
        return -99; 
    when value_error then
        return -98;
    when others then
        return -97; 
end;
/

create or replace procedure sp_relatorio_motos_status
is
    cursor c_motos is
        select id_moto, id_patio from tb_moto order by id_patio;

    v_id_patio varchar2(255);
    v_id_moto varchar2(255);
    v_status_num number;

    v_subtotal_status number := 0;
    v_total_status number := 0;
    v_patio_atual varchar2(255) := null;
begin
    dbms_output.put_line('Quantidade de Motos por Pátio');
    dbms_output.put_line('------------------------------');
    dbms_output.put_line('Patio | Status Num | Qtd Motos');
    dbms_output.put_line('------------------------------');

    for rec in c_motos loop
        v_id_moto := rec.id_moto;
        v_id_patio := rec.id_patio;

        v_status_num := fn_status_moto_num(v_id_moto);

        if v_patio_atual is not null and v_patio_atual != v_id_patio then
            dbms_output.put_line(rpad(v_patio_atual,6) || ' | Subtotal | ' || v_subtotal_status);
            v_subtotal_status := 0; -- reset subtotal
        end if;

        dbms_output.put_line(rpad(v_id_patio,6) || ' | ' || rpad(v_status_num,10) || ' | 1');

        v_subtotal_status := v_subtotal_status + 1;
        v_total_status := v_total_status + 1;
        v_patio_atual := v_id_patio;
    end loop;

    -- imprime último subtotal
    if v_patio_atual is not null then
        dbms_output.put_line(rpad(v_patio_atual,6) || ' | Subtotal | ' || v_subtotal_status);
    end if;

    -- total geral
    dbms_output.put_line('Total Geral |           | ' || v_total_status);

exception
    when no_data_found then
        dbms_output.put_line('Nenhuma moto encontrada.');
    when value_error then
        dbms_output.put_line('Erro de valor encontrado.');
    when others then
        dbms_output.put_line('Erro desconhecido: ' || sqlerrm);
end;
/

begin
    sp_relatorio_motos_status;
end;
/
