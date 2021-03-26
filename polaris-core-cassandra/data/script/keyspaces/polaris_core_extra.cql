
CREATE KEYSPACE polaris_core_extra WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_extra.agency_code (
    agco_id uuid PRIMARY KEY,
    agco_code text,
    agco_name text
);

CREATE TABLE polaris_core_extra.agente (
    agente_serial text PRIMARY KEY,
    agente_clave text,
    agente_segmento text
);

CREATE INDEX agente_agente_clave_idx ON polaris_core_extra.agente (agente_clave);

CREATE TABLE polaris_core_extra.all_exits (
    alle_id int PRIMARY KEY,
    alle_users int,
    alle_warehouses int
);

CREATE TABLE polaris_core_extra.audit (
    audi_id uuid PRIMARY KEY,
    audi_action text,
    audi_after text,
    audi_before text,
    audi_client text,
    audi_date text,
    audi_ip text,
    audi_user text,
    audi_view text
);

CREATE TABLE polaris_core_extra.autoid (
    auid_name text PRIMARY KEY,
    auid_number int
);

CREATE TABLE polaris_core_extra.city (
    city_id uuid PRIMARY KEY,
    city_country text,
    city_name text
);

CREATE TABLE polaris_core_extra.company_flag (
    cofl_id text PRIMARY KEY,
    cofl_country text,
    cofl_geo_precision text,
    cofl_geo_speed text,
    cofl_geodist text,
    cofl_identi_commerce text,
    cofl_name_commerce text,
    cofl_sesion_expire text,
    cofl_validate text,
    cofl_variable text,
    cofl_warehouse text,
    cofl_workday list<text>
);

CREATE TABLE polaris_core_extra.country (
    coun_id uuid PRIMARY KEY,
    coun_indicative text,
    coun_name text
);

CREATE TABLE polaris_core_extra.cuenta (
    cuenta_numero text PRIMARY KEY,
    cuenta_nombre text,
    cuenta_tipo text
);

CREATE INDEX cuenta_cuenta_tipo_idx ON polaris_core_extra.cuenta (cuenta_tipo);

CREATE TABLE polaris_core_extra.dashboard (
    dashboard_id bigint PRIMARY KEY,
    dashboard_name text
);

CREATE TABLE polaris_core_extra.encrypted_key (
    enke_key text PRIMARY KEY,
    enke_model text,
    enke_type text
);

CREATE TABLE polaris_core_extra.events (
    event_id uuid PRIMARY KEY,
    event_data text,
    event_date text,
    event_desc text,
    event_method text,
    event_params text,
    event_url text
);

CREATE TABLE polaris_core_extra.file_paramatrization (
    file_param_id uuid PRIMARY KEY,
    file_param_format text,
    file_param_name text,
    file_param_type text
);

CREATE TABLE polaris_core_extra.grafico_dashboard (
    grafico_dashboard_id int PRIMARY KEY,
    dashboard_id int,
    grafico_dashboard_name text
);

CREATE TABLE polaris_core_extra.holidays (
    holi_id uuid PRIMARY KEY,
    holi_country text,
    holi_date date
);

CREATE TABLE polaris_core_extra.listing_type (
    lity_id uuid PRIMARY KEY,
    lity_name text,
    lity_type text
);

CREATE TABLE polaris_core_extra.subgrafico (
    subgrafico_id int PRIMARY KEY,
    grafico_dashboard_id int,
    subgrafico_name text
);

CREATE TABLE polaris_core_extra.sucursal_rubro (
    suru_id uuid PRIMARY KEY,
    suru_general text,
    suru_specific text
);

CREATE TABLE polaris_core_extra.technical_productivity (
    tepro_id uuid PRIMARY KEY,
    tepro_city text,
    tepro_country text,
    tepro_date_register text,
    tepro_province text,
    tepro_quantity_services text,
    tepro_register_by text
);

CREATE TABLE polaris_core_extra.type_typification (
    tyty_name text PRIMARY KEY,
    tyty_date_register text,
    tyty_register_by text
);

CREATE TABLE polaris_core_extra.user_dashboard (
    usercode text PRIMARY KEY,
    dashboard text
);
