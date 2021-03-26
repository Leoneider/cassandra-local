
CREATE KEYSPACE polaris_core_inventory WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_inventory.accessory (
    acce_id uuid PRIMARY KEY,
    acce_code text,
    acce_date_register text,
    acce_name text,
    acce_quantity text,
    acce_register_by text,
    acce_status text,
    acce_status_temporal text,
    acce_terminal_model text,
    acce_warehouse text
);

CREATE INDEX accessory_acce_code_idx ON polaris_core_inventory.accessory (acce_code);

CREATE TABLE polaris_core_inventory.accessory_status (
    acst_id uuid PRIMARY KEY,
    acst_name text
);

CREATE TABLE polaris_core_inventory.sim_card (
    sica_serial text PRIMARY KEY,
    sica_brand text,
    sica_date_register text,
    sica_location text,
    sica_register_by text,
    sica_status text,
    sica_status_temporal text
);

CREATE TABLE polaris_core_inventory.sim_card_brand (
    scbr_id uuid PRIMARY KEY,
    scbr_description text
);

CREATE TABLE polaris_core_inventory.sim_card_status (
    scst_id uuid PRIMARY KEY,
    scst_code text,
    scst_description text
);

CREATE TABLE polaris_core_inventory.spare (
    spar_id uuid PRIMARY KEY,
    spar_code text,
    spar_date_register text,
    spar_name text,
    spar_quantity text,
    spar_register_by text,
    spar_status text,
    spar_status_temporal text,
    spar_terminal_model text,
    spar_warehouse text
);

CREATE CUSTOM INDEX spar_terminal_model_idx ON polaris_core_inventory.spare (spar_terminal_model) USING 'org.apache.cassandra.index.sasi.SASIIndex';

CREATE INDEX spare_spar_code_idx ON polaris_core_inventory.spare (spar_code);

CREATE INDEX spare_spar_terminal_model_idx ON polaris_core_inventory.spare (spar_terminal_model);

CREATE TABLE polaris_core_inventory.spare_status (
    spst_id uuid PRIMARY KEY,
    spst_name text
);
