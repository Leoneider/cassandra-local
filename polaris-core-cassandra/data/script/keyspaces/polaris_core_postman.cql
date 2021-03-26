
CREATE KEYSPACE polaris_core_postman WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_postman.notifications (
    noti_id uuid PRIMARY KEY,
    noti_date_create text,
    noti_dest text,
    noti_msg text,
    noti_origin text,
    noti_state text,
    noti_type text
);

CREATE INDEX notifications_noti_dest_idx ON polaris_core_postman.notifications (noti_dest);

CREATE TABLE polaris_core_postman.notifications_user_commerce (
    nouc_id uuid PRIMARY KEY,
    nouc_data text,
    nouc_date_create text,
    nouc_dest text,
    nouc_msg text,
    nouc_origin text,
    nouc_state text,
    nouc_type text
);

CREATE INDEX notifications_user_commerce_nouc_dest_idx ON polaris_core_postman.notifications_user_commerce (nouc_dest);
