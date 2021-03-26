
CREATE KEYSPACE polaris_core_location WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_location.auto_code (
    auco_id text PRIMARY KEY,
    auco_number text
);

CREATE TABLE polaris_core_location.autoid (
    auid_name text PRIMARY KEY,
    auid_number int
);

CREATE TABLE polaris_core_location.commerce (
    comm_id uuid PRIMARY KEY,
    comm_address text,
    comm_agency_code text,
    comm_agency_name text,
    comm_approved boolean,
    comm_assignment_motive text,
    comm_cellphone text,
    comm_city text,
    comm_city_id uuid,
    comm_commercial_area text,
    comm_commercial_boss text,
    comm_commercial_executive text,
    comm_contact_person text,
    comm_country text,
    comm_date_register text,
    comm_document_type text,
    comm_email text,
    comm_general_rubro text,
    comm_jungle_bill text,
    comm_name text,
    comm_nit text,
    comm_number_type text,
    comm_phone text,
    comm_priority text,
    comm_province text,
    comm_reference text,
    comm_register_by text,
    comm_route_code text,
    comm_schedule_attention text,
    comm_specific_rubro text,
    comm_temporal_flag text,
    comm_ubigeo text,
    comm_uniqe_code text,
    comm_zone_diebold text,
    part_uniqe_code text,
    comm_quadrant map<text, text>
);

CREATE INDEX commerce_comm_uniqe_code_idx ON polaris_core_location.commerce (comm_uniqe_code);

CREATE MATERIALIZED VIEW polaris_core_location.commerce_info AS
    SELECT comm_uniqe_code, comm_id, comm_address, comm_cellphone, comm_email, comm_name, comm_phone
    FROM polaris_core_location.commerce
    WHERE comm_uniqe_code IS NOT NULL AND comm_id IS NOT NULL
    PRIMARY KEY (comm_uniqe_code, comm_id)
 WITH CLUSTERING ORDER BY (comm_id ASC);

CREATE TABLE polaris_core_location.localication (
    loca_id text PRIMARY KEY,
    loca_date date,
    loca_latitude text,
    loca_length text
);

CREATE TABLE polaris_core_location.localication_history (
    lohi_id uuid PRIMARY KEY,
    inci_id text,
    inci_status text,
    lohi_accuracy_range double,
    lohi_date text,
    lohi_latitude text,
    lohi_length text,
    lohi_registration_date timestamp,
    lohi_time text,
    lohi_user text
);

CREATE TABLE polaris_core_location.partner (
    part_uniqe_code text,
    part_id uuid,
    part_approved boolean,
    part_cellphone text,
    part_comercial_designation text,
    part_credit_account text,
    part_date_register text,
    part_derivation_form text,
    part_detraction_account text,
    part_document_type text,
    part_email text,
    part_legal_representative text,
    part_name text,
    part_number_type text,
    part_phone text,
    part_provider_code text,
    part_receipt_type text,
    part_regime_type text,
    part_register_by text,
    part_social_reason text,
    part_taxpayer_condition text,
    part_taxpayer_status text,
    part_taxpayer_type text,
    part_temporal_flag text,
    PRIMARY KEY (part_uniqe_code, part_id)
) WITH CLUSTERING ORDER BY (part_id ASC);

CREATE INDEX partner_part_name_idx ON polaris_core_location.partner (part_name);

CREATE TABLE polaris_core_location.priority_commerce (
    prco_code text PRIMARY KEY,
    prco_descrption text
);

CREATE TABLE polaris_core_location.prospection_file (
    prosp_file_id uuid PRIMARY KEY,
    prosp_file text,
    prosp_file_date date,
    prosp_file_dni text,
    prosp_file_name text,
    prosp_file_part_taxpayer_type text,
    prosp_file_type text
);

CREATE TABLE polaris_core_location.quadrant (
    quad_id uuid PRIMARY KEY,
    quad_color text,
    quad_name text,
    quad_zone text,
    quty_id uuid,
    quty_name text,
    quad_coordinates list<frozen<map<text, text>>>,
    quad_users list<frozen<map<text, text>>>
);

CREATE TABLE polaris_core_location.quadrant_commerce (
    quco_id uuid PRIMARY KEY,
    quco_color text,
    quco_name text,
    quco_zone text,
    quty_id uuid,
    quty_name text,
    quco_coordinates list<frozen<map<text, text>>>,
    quco_users list<frozen<map<text, text>>>
);

CREATE INDEX quadrant_commerce_quco_users_idx ON polaris_core_location.quadrant_commerce (values(quco_users));

CREATE TABLE polaris_core_location.quadrant_type (
    quty_id uuid PRIMARY KEY,
    quty_name text
);

CREATE TABLE polaris_core_location.quadrant_x_user (
    user_id uuid,
    quadrant_id uuid,
    quus_typo text,
    PRIMARY KEY (user_id, quadrant_id)
) WITH CLUSTERING ORDER BY (quadrant_id ASC);

CREATE TABLE polaris_core_location.times_by_laboratory (
    tbla_id text PRIMARY KEY,
    tbla_diagnostic_time text,
    tbla_name text,
    tbla_repair_time text
);

CREATE TABLE polaris_core_location.warehouse (
    ware_id uuid PRIMARY KEY,
    ware_city text,
    ware_country text,
    ware_date_register text,
    ware_email text,
    ware_id_warehouse text,
    ware_name text,
    ware_phone text,
    ware_position text,
    ware_province text,
    ware_register_by text,
    ware_responsable text,
    ware_status text,
    ware_type text
);

CREATE INDEX warehouse_ware_id_warehouse_idx ON polaris_core_location.warehouse (ware_id_warehouse);

CREATE INDEX warehouse_ware_status_idx ON polaris_core_location.warehouse (ware_status);

CREATE TABLE polaris_core_location.warehouse_user (
    user text PRIMARY KEY,
    warehouses text
);
