
CREATE KEYSPACE polaris_core_cliente WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '2'}  AND durable_writes = true;

CREATE TABLE polaris_core_cliente.cliente (
    id uuid PRIMARY KEY,
    created_by text,
    created_date timestamp,
    descripcion text,
    estado text,
    nombre text,
    updated_by text,
    updated_date timestamp,
    tipo_sesion list<text>
);

CREATE TABLE polaris_core_cliente.persona (
    id uuid PRIMARY KEY,
    created_by text,
    created_date timestamp,
    estado text,
    nombre text,
    updated_by text,
    updated_date timestamp
);
