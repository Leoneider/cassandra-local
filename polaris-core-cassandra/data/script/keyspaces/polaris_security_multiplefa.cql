
CREATE KEYSPACE polaris_security_multiplefa WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_security_multiplefa.user_code (
    user_pool_id uuid,
    created_date date,
    user_email text,
    code text,
    expiration_datetime timestamp,
    expiration_in_seconds int,
    is_used boolean,
    PRIMARY KEY (user_pool_id, created_date, user_email, code)
) WITH CLUSTERING ORDER BY (created_date DESC, user_email ASC, code ASC);
