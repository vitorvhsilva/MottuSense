set verify off;
set serveroutput on;

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
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) 
        values ('1', '1', 0);
        
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) 
        values ('2', '2', 0);
        
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) 
        values ('3', '3', 0);
        
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) 
        values ('4', '4', 0);
        
    insert into TB_PATIO (id_patio, id_filial, estrutura_criada_patio) 
        values ('5', '5', 1);
    
    
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, 
    coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) 
        values ('5', 12, 10, 50, 90);
    
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, 
    coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) 
        values ('5', 20, 0, 100, 180);
        
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, 
    coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) 
        values ('5', 20, 100, 100, 180);
        
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, 
    coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) 
        values ('5', 20, 0, 100, 90);
        
    insert into TB_ESTRUTURA_PATIO (id_patio, coordenada_x_estrutura, 
    coordenada_y_estrutura, tamanho_estrutura, rotacao_estrutura) 
        values ('5', 120, 100, 65, 180);
        
    
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto)
        values ('1', '5', 'XXXX-777', 'MOTTU-POP', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
    
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto)
        values ('2', '5', 'AAAA-123', 'MOTTU-SPORT', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
        
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto)
        values ('3', '5', 'FFFF-321', 'MOTTU-E', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
        
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto)
        values ('4', '5', 'YYYY-453', 'MOTTU-POP', 'SEM_PLACA', 'ID-CHASSI', 'ID-IOT');
        
    insert into TB_MOTO (id_moto, id_patio, placa_moto, modelo_moto, status_moto, chassi_moto, iot_moto)
        values ('5', '5', 'OOOO-544', 'MOTTU-POP', 'PRONTA_ALUGUEL', 'ID-CHASSI', 'ID-IOT');
        
    
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto)
        values ('1', '1232334132', '2312321312');
    
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto)
        values ('2', '3231312332', '8928101011');
        
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto)
        values ('3', '8748041278', '3210937811');
        
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto)
        values ('4', '2189038012', '2301837218');
        
    insert into TB_LOCALIZACAO_MOTO (id_moto, latitude_moto, longitude_moto)
        values ('5', '3812738129', '8904819441');
        
    
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento)
        values ('1', 'Moto em manutenção!', 'CINZA');
        
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento)
        values ('2', 'Moto pronta para ser alugada!', 'VERDE');
        
    insert into TB_EVENTO (id_evento, descricao_evento, cor_evento)
        values ('3', 'Moto chegou sem placa!', 'VERMELHO');
        
    
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento)
        values ('1', '1', TIMESTAMP '2025-04-25 10:00:00', 1);
        
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento)
        values ('1', '2', TIMESTAMP '2025-04-25 12:00:00', 1);
        
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento)
        values ('2', '2', TIMESTAMP '2025-04-26 09:00:00', 1);
        
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento)
        values ('3', '3', TIMESTAMP '2025-04-27 15:30:00', 0);
        
    insert into TB_EVENTO_MOTO (id_moto, id_evento, data_hora_evento, visualizado_evento)
        values ('3', '2', TIMESTAMP '2025-04-27 17:30:00', 0);
end;

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
