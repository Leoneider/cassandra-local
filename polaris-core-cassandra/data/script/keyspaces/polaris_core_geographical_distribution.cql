
CREATE KEYSPACE polaris_core_geographical_distribution WITH replication = {'class': 'SimpleStrategy', 'replication_factor': '1'}  AND durable_writes = true;

CREATE TABLE polaris_core_geographical_distribution.city (
    city_province text,
    city_id uuid,
    city_departament text,
    city_departament_id text,
    city_name text,
    city_province_id text,
    city_ubigeo text,
    PRIMARY KEY (city_province, city_id)
) WITH CLUSTERING ORDER BY (city_id ASC);

CREATE TABLE polaris_core_geographical_distribution.country (
    coun_id uuid PRIMARY KEY,
    coun_indicative text,
    coun_name text
);

CREATE TABLE polaris_core_geographical_distribution.departament (
    depa_country text,
    depa_id uuid,
    depa_name text,
    depa_ubigeo text,
    PRIMARY KEY (depa_country, depa_id)
) WITH CLUSTERING ORDER BY (depa_id ASC);

CREATE TABLE polaris_core_geographical_distribution.province (
    prov_departament text,
    prov_id uuid,
    prov_name text,
    prov_ubigeo text,
    PRIMARY KEY (prov_departament, prov_id)
) WITH CLUSTERING ORDER BY (prov_id ASC);
