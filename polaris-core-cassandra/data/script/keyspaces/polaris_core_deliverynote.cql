
CREATE KEYSPACE polaris_core_deliverynote WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_deliverynote.autoid (
    auid_name text PRIMARY KEY,
    auid_number int
);

CREATE TABLE polaris_core_deliverynote.deliverynote (
    deno_id int PRIMARY KEY,
    deno_date_creation text,
    deno_date_received text,
    deno_date_send text,
    deno_dest text,
    deno_observations text,
    deno_origin text,
    deno_packinglist text,
    deno_senditems text,
    deno_simcard_send text,
    deno_state text,
    deno_user text
);

CREATE INDEX deliverynote_deno_date_creation_idx ON polaris_core_deliverynote.deliverynote (deno_date_creation);

CREATE INDEX deliverynote_deno_user_idx ON polaris_core_deliverynote.deliverynote (deno_user);

CREATE TABLE polaris_core_deliverynote.deliverynote_delete_elements (
    dde_id uuid PRIMARY KEY,
    dde_cantidad text,
    dde_deliverynote text,
    dde_elements text,
    dde_observation text
);

CREATE INDEX deliverynote_delete_elements_dde_deliverynote_idx ON polaris_core_deliverynote.deliverynote_delete_elements (dde_deliverynote);
