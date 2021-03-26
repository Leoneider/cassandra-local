
CREATE KEYSPACE polaris_core_seguridad WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TYPE polaris_core_seguridad.map_embebido (
    values map<text, text>
);

CREATE TABLE polaris_core_seguridad.access_token (
    id uuid PRIMARY KEY,
    created_by text,
    created_date timestamp,
    expiration_refresh timestamp,
    token_json text,
    updated_by text,
    updated_date timestamp
);

CREATE TABLE polaris_core_seguridad.accion (
    id text PRIMARY KEY,
    created_by text,
    created_date timestamp,
    estado text,
    updated_by text,
    updated_date timestamp,
    valor int
);

CREATE TABLE polaris_core_seguridad.directorio_activo (
    tenant_id uuid PRIMARY KEY,
    alias text,
    client_id uuid,
    cliente_id uuid,
    cliente_secret text,
    created_by text,
    created_date timestamp,
    dominio text,
    enabled boolean,
    keycloakid uuid,
    redirect_url text,
    updated_by text,
    updated_date timestamp
);

CREATE TABLE polaris_core_seguridad.keycloak (
    id uuid PRIMARY KEY,
    client_id text,
    cliente_id uuid,
    created_by text,
    created_date timestamp,
    double_factor boolean,
    key_realm text,
    name_realm text,
    password text,
    secret_client text,
    updated_by text,
    updated_date timestamp,
    url_server text,
    user_name text
);

CREATE TABLE polaris_core_seguridad.modulo (
    id uuid PRIMARY KEY,
    created_by text,
    created_date timestamp,
    estado text,
    icono text,
    menu_padre uuid,
    nombre text,
    posicion int,
    ruta text,
    tipo text,
    updated_by text,
    updated_date timestamp,
    acciones list<frozen<map_embebido>>,
    cliente_id list<uuid>,
    tablas list<frozen<map_embebido>>
);

CREATE TABLE polaris_core_seguridad.permiso (
    modulo_id uuid,
    nombre_accion text,
    created_by text,
    created_date timestamp,
    estado text,
    map_modulo frozen<map_embebido>,
    nombre text,
    updated_by text,
    updated_date timestamp,
    valor int,
    PRIMARY KEY (modulo_id, nombre_accion)
) WITH CLUSTERING ORDER BY (nombre_accion DESC);
