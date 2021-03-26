
CREATE KEYSPACE polaris_core_incidence WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_incidence.atention_time (
    atti_id text PRIMARY KEY,
    atti_installation text,
    atti_priority text,
    atti_support_and_removal text
);

CREATE TABLE polaris_core_incidence.atention_time_zone (
    atzo_id text PRIMARY KEY,
    atzo_installation text,
    atzo_support text,
    atzo_uninstall text,
    atzo_zone text
);

CREATE TABLE polaris_core_incidence.autoid (
    auid_name text PRIMARY KEY,
    auid_number int
);

CREATE TABLE polaris_core_incidence.found_incidence (
    foin_incidence text PRIMARY KEY,
    foin_accessories text,
    foin_sim_card text,
    foin_terminal text
);

CREATE TABLE polaris_core_incidence.holidays (
    holi_id uuid PRIMARY KEY,
    holi_country text,
    holi_date date
);

CREATE TABLE polaris_core_incidence.inci_incidence (
    inci_id text PRIMARY KEY,
    inci_city_id text,
    inci_code_commerce text,
    inci_comm_city text,
    inci_contac_person text,
    inci_current_account text,
    inci_date_close timestamp,
    inci_date_create timestamp,
    inci_date_finish_post_event timestamp,
    inci_date_limit_attention timestamp,
    inci_motive text,
    inci_name_commerce text,
    inci_priority text,
    inci_quco_id text,
    inci_quco_name text,
    inci_quco_zone text,
    inci_schedule_of_attention text,
    inci_status_of_visit text,
    inci_technical text,
    inci_tecnology text,
    inci_term_brand text,
    inci_term_model text,
    inci_term_number text,
    inci_term_serial text,
    inci_type text,
    inci_typing text,
    inci_quco_users list<frozen<map<text, text>>>
);

CREATE TABLE polaris_core_incidence.incidence (
    inci_id text PRIMARY KEY,
    inci_city_id uuid,
    inci_code_commerce text,
    inci_comm_city text,
    inci_commercial_boss text,
    inci_commercial_boss_code text,
    inci_contac_person text,
    inci_contact_attended text,
    inci_current_account text,
    inci_date_assignment timestamp,
    inci_date_close timestamp,
    inci_date_create timestamp,
    inci_date_finish_post_event timestamp,
    inci_date_limit_attention timestamp,
    inci_date_reception timestamp,
    inci_motive text,
    inci_name_commerce text,
    inci_notification_flag text,
    inci_priority text,
    inci_quco_id text,
    inci_quco_name text,
    inci_quco_zone text,
    inci_schedule_of_attention text,
    inci_status_of_visit text,
    inci_technical text,
    inci_tecnology text,
    inci_term_brand text,
    inci_term_model text,
    inci_term_number text,
    inci_term_serial text,
    inci_time_atention text,
    inci_type text,
    inci_typing text,
    inci_quco_users list<frozen<map<text, text>>>
);

CREATE INDEX incidence_inci_quco_users_idx ON polaris_core_incidence.incidence (values(inci_quco_users));

CREATE CUSTOM INDEX incidence_status_idx ON polaris_core_incidence.incidence (inci_status_of_visit) USING 'org.apache.cassandra.index.sasi.SASIIndex';

CREATE TABLE polaris_core_incidence.incidence_file (
    infi_id uuid PRIMARY KEY,
    infi_comm_nit text,
    infi_comm_unique_code text,
    infi_file text,
    infi_file_date date,
    infi_file_name text,
    infi_file_type text,
    infi_inci_id text
);

CREATE TABLE polaris_core_incidence.incidence_qualification (
    inqu_id text PRIMARY KEY,
    inqu_atention_time text,
    inqu_attention_technical text,
    inqu_attention_time text,
    inqu_contact_person text,
    inqu_date_register text,
    inqu_end_date text,
    inqu_localication text,
    inqu_position text,
    inqu_presentation_technical text,
    inqu_register_by text,
    inqu_start_date text
);

CREATE TABLE polaris_core_incidence.incidence_status (
    views text PRIMARY KEY,
    status text
);

CREATE TABLE polaris_core_incidence.installed_incidence (
    inin_incidence text PRIMARY KEY,
    inin_accessories text,
    inin_sim_card text
);

CREATE TABLE polaris_core_incidence.observation_incidence (
    id uuid PRIMARY KEY,
    obin_date text,
    obin_firm text,
    obin_incidence text,
    obin_observation text,
    obin_photo text,
    obin_user text
);

CREATE TABLE polaris_core_incidence.observation_prospecting (
    obpr_id uuid PRIMARY KEY,
    obpr_date text,
    obpr_observation text,
    obpr_photo text,
    obpr_prospecting text,
    obpr_user text
);

CREATE TABLE polaris_core_incidence.prospecting (
    pros_number text,
    pros_id uuid,
    pros_attach_documents text,
    pros_commercial_area text,
    pros_commercial_boss text,
    pros_commercial_boss_code text,
    pros_commercial_boss_id text,
    pros_commercial_code text,
    pros_commercial_executive text,
    pros_commercial_name text,
    pros_create_date timestamp,
    pros_current_account text,
    pros_date date,
    pros_deadline date,
    pros_num_file text,
    pros_num_terminal text,
    pros_observation text,
    pros_operative text,
    pros_pending_stock_flag text,
    pros_prospecting_status text,
    pros_quco_id text,
    pros_quco_name text,
    pros_quco_zone text,
    pros_ruc text,
    pros_technology text,
    pros_type_addendum text,
    pros_type_rejection text,
    pros_quco_users list<frozen<map<text, text>>>,
    PRIMARY KEY (pros_number, pros_id)
) WITH CLUSTERING ORDER BY (pros_id ASC);

CREATE CUSTOM INDEX prospecting_idx ON polaris_core_incidence.prospecting (pros_commercial_executive) USING 'org.apache.cassandra.index.sasi.SASIIndex';

CREATE INDEX prospecting_pros_quco_users_idx ON polaris_core_incidence.prospecting (values(pros_quco_users));

CREATE TABLE polaris_core_incidence.removed_incidence (
    rein_incidence text PRIMARY KEY,
    rein_accessories text,
    rein_sim_card text,
    rein_terminal text
);

CREATE TABLE polaris_core_incidence.times_by_commerce (
    tbco_id text PRIMARY KEY,
    tbco_city text,
    tbco_country text,
    tbco_diagnostic_time text,
    tbco_name text,
    tbco_province text,
    tbco_repair_time text
);

CREATE TABLE polaris_core_incidence.typification_incidence (
    tyin_id uuid PRIMARY KEY,
    tyin_date_register text,
    tyin_name text,
    tyin_register_by text,
    tyin_type text
);
