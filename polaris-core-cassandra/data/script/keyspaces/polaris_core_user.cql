
CREATE KEYSPACE polaris_core_user WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_user.autoid (
    auid_name text PRIMARY KEY,
    auid_number int
);

CREATE TABLE polaris_core_user.icons (
    icon_item text PRIMARY KEY,
    icon_icon text
);

CREATE TABLE polaris_core_user.module (
    module_id int PRIMARY KEY,
    module_name text
);

CREATE INDEX module_module_name_idx ON polaris_core_user.module (module_name);

CREATE TABLE polaris_core_user.pin (
    pin_id text PRIMARY KEY,
    pin_hash text
);

CREATE TABLE polaris_core_user.position (
    posi_id uuid PRIMARY KEY,
    posi_name text,
    posi_number int,
    posi_type text
);

CREATE TABLE polaris_core_user.roles (
    role_id int PRIMARY KEY,
    role_modules text,
    role_name text
);

CREATE CUSTOM INDEX roles_idx ON polaris_core_user.roles (role_modules) USING 'org.apache.cassandra.index.sasi.SASIIndex';

CREATE TABLE polaris_core_user.schedule (
    sche_id uuid PRIMARY KEY,
    sche_end text,
    sche_name text,
    sche_start text,
    sche_type text
);

CREATE TABLE polaris_core_user.security_questions_user (
    sq_user text PRIMARY KEY,
    sq_questions text
);

CREATE TABLE polaris_core_user.submodule (
    submodule_id int PRIMARY KEY,
    submodule_idmodule int,
    submodule_name text
);

CREATE INDEX submodule_submodule_name_idx ON polaris_core_user.submodule (submodule_name);

CREATE TABLE polaris_core_user.technical_schedule (
    tesc_technical text,
    tesc_id uuid,
    sche_id uuid,
    tesc_end timestamp,
    tesc_name text,
    tesc_start timestamp,
    tesc_title text,
    tesc_type text,
    PRIMARY KEY (tesc_technical, tesc_id)
) WITH CLUSTERING ORDER BY (tesc_id ASC);

CREATE TABLE polaris_core_user.user (
    user_identification text PRIMARY KEY,
    user_address text,
    user_email text,
    user_hashclose text,
    user_id_segurity text,
    user_id_user text,
    user_immediate_boss text,
    user_location text,
    user_locations text,
    user_login text,
    user_login_external text,
    user_name text,
    user_password text,
    user_phone text,
    user_photo text,
    user_position text,
    user_quadrant_name text,
    user_role text,
    user_sesion_id uuid,
    user_session text,
    user_state text
);

CREATE INDEX user_user_email_idx ON polaris_core_user.user (user_email);

CREATE INDEX user_user_id_user_idx ON polaris_core_user.user (user_id_user);

CREATE INDEX user_user_session_idx ON polaris_core_user.user (user_session);

CREATE TABLE polaris_core_user.user_city (
    usercode text PRIMARY KEY,
    citys text
);

CREATE CUSTOM INDEX user_city_idx ON polaris_core_user.user_city (citys) USING 'org.apache.cassandra.index.sasi.SASIIndex';

CREATE TABLE polaris_core_user.user_commerce (
    usco_id text PRIMARY KEY,
    usco_cellphone text,
    usco_date_register text,
    usco_name text,
    usco_password text,
    usco_phone text
);

CREATE INDEX user_commerce_usco_name_idx ON polaris_core_user.user_commerce (usco_name);

CREATE TABLE polaris_core_user.user_dashboard (
    usercode text PRIMARY KEY,
    dashboard text
);

CREATE TABLE polaris_core_user.views (
    view_id uuid PRIMARY KEY,
    view_idsubmodule int,
    view_name text
);

CREATE INDEX views_view_idsubmodule_idx ON polaris_core_user.views (view_idsubmodule);
