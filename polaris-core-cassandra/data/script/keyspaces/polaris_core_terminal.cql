
CREATE KEYSPACE polaris_core_terminal WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_terminal.audit_sim (
    audsim_id uuid PRIMARY KEY,
    audsim_codigo_unico text,
    audsim_date text,
    audsim_serial_sim text,
    audsim_serial_terminal text
);

