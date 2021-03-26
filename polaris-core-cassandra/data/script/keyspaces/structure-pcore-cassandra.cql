-- Export of keyspace polaris_core_cliente
CREATE KEYSPACE polaris_core_cliente
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_cliente.cliente (
	id uuid,
	created_by text,
	created_date timestamp,
	descripcion text,
	estado text,
	nombre text,
	tipo_sesion LIST<text>,
	updated_by text,
	updated_date timestamp,
	PRIMARY KEY (id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_cliente.persona (
	id uuid,
	created_by text,
	created_date timestamp,
	estado text,
	nombre text,
	updated_by text,
	updated_date timestamp,
	PRIMARY KEY (id)
) WITH gc_grace_seconds = 432000;


-- Export of keyspace polaris_core_deliverynote
CREATE KEYSPACE polaris_core_deliverynote
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_deliverynote.deliverynote_delete_elements (
	dde_id uuid,
	dde_cantidad text,
	dde_deliverynote text,
	dde_elements text,
	dde_observation text,
	PRIMARY KEY (dde_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX deliverynote_delete_elements_dde_deliverynote_idx ON polaris_core_deliverynote.deliverynote_delete_elements
(dde_deliverynote);

CREATE TABLE polaris_core_deliverynote.autoid (
	auid_name text,
	auid_number int,
	PRIMARY KEY (auid_name)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_deliverynote.deliverynote (
	deno_id int,
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
	deno_user text,
	PRIMARY KEY (deno_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX deliverynote_deno_date_creation_idx ON polaris_core_deliverynote.deliverynote (deno_date_creation);

CREATE INDEX deliverynote_deno_user_idx ON polaris_core_deliverynote.deliverynote (deno_user);

-- Export of keyspace polaris_core_extra
CREATE KEYSPACE polaris_core_extra
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_extra.agente (
	agente_serial text,
	agente_clave text,
	agente_segmento text,
	PRIMARY KEY (agente_serial)
) WITH gc_grace_seconds = 432000
;

CREATE INDEX agente_agente_clave_idx ON polaris_core_extra.agente (agente_clave);

CREATE TABLE polaris_core_extra.country (
	coun_id uuid,
	coun_indicative text,
	coun_name text,
	PRIMARY KEY (coun_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.agency_code (
	agco_id uuid,
	agco_code text,
	agco_name text,
	PRIMARY KEY (agco_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.city (
	city_id uuid,
	city_country text,
	city_name text,
	PRIMARY KEY (city_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.all_exits (
	alle_id int,
	alle_users int,
	alle_warehouses int,
	PRIMARY KEY (alle_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.autoid (
	auid_name text,
	auid_number int,
	PRIMARY KEY (auid_name)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.sucursal_rubro (
	suru_id uuid,
	suru_general text,
	suru_specific text,
	PRIMARY KEY (suru_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.file_paramatrization (
	file_param_id uuid,
	file_param_format text,
	file_param_name text,
	file_param_type text,
	PRIMARY KEY (file_param_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.listing_type (
	lity_id uuid,
	lity_name text,
	lity_type text,
	PRIMARY KEY (lity_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.technical_productivity (
	tepro_id uuid,
	tepro_city text,
	tepro_country text,
	tepro_date_register text,
	tepro_province text,
	tepro_quantity_services text,
	tepro_register_by text,
	PRIMARY KEY (tepro_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.subgrafico (
	subgrafico_id int,
	grafico_dashboard_id int,
	subgrafico_name text,
	PRIMARY KEY (subgrafico_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.grafico_dashboard (
	grafico_dashboard_id int,
	dashboard_id int,
	grafico_dashboard_name text,
	PRIMARY KEY (grafico_dashboard_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.type_typification (
	tyty_name text,
	tyty_date_register text,
	tyty_register_by text,
	PRIMARY KEY (tyty_name)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.user_dashboard (
	usercode text,
	dashboard text,
	PRIMARY KEY (usercode)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.holidays (
	holi_id uuid,
	holi_country text,
	holi_date date,
	PRIMARY KEY (holi_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.audit (
	audi_id uuid,
	audi_action text,
	audi_after text,
	audi_before text,
	audi_client text,
	audi_date text,
	audi_ip text,
	audi_user text,
	audi_view text,
	PRIMARY KEY (audi_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.company_flag (
	cofl_id text,
	cofl_country text,
	cofl_geo_precision text,
	cofl_geo_speed text,
	cofl_geodist text,
	cofl_identi_commerce text,
	cofl_name_commerce text,
	cofl_sesion_expire text,
	cofl_validate text,
	cofl_variable text,
	cofl_workday LIST<text>,
	PRIMARY KEY (cofl_id)
) WITH gc_grace_seconds = 432000
;

CREATE TABLE polaris_core_extra.cuenta (
	cuenta_numero text,
	cuenta_nombre text,
	cuenta_tipo text,
	PRIMARY KEY (cuenta_numero)
) WITH gc_grace_seconds = 432000
;

CREATE INDEX cuenta_cuenta_tipo_idx ON polaris_core_extra.cuenta (cuenta_tipo);

CREATE TABLE polaris_core_extra.dashboard (
	dashboard_id bigint,
	dashboard_name text,
	PRIMARY KEY (dashboard_id)
) WITH gc_grace_seconds = 432000
;

-- Export of keyspace polaris_core_geographical_distribution
CREATE KEYSPACE polaris_core_geographical_distribution
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_geographical_distribution.country (
	coun_id uuid,
	coun_indicative text,
	coun_name text,
	PRIMARY KEY (coun_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_geographical_distribution.province (
	prov_departament text,
	prov_id uuid,
	prov_name text,
	prov_ubigeo text,
	PRIMARY KEY (prov_departament, prov_id)
) WITH CLUSTERING ORDER BY ( prov_id ASC )
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_geographical_distribution.city (
	city_province text,
	city_id uuid,
	city_departament text,
	city_name text,
	city_ubigeo text,
	PRIMARY KEY (city_province, city_id)
) WITH CLUSTERING ORDER BY ( city_id ASC )
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_geographical_distribution.departament (
	depa_country text,
	depa_id uuid,
	depa_name text,
	depa_ubigeo text,
	PRIMARY KEY (depa_country, depa_id)
) WITH CLUSTERING ORDER BY ( depa_id ASC )
AND gc_grace_seconds = 432000;

-- Export of keyspace polaris_core_incidence
CREATE KEYSPACE polaris_core_incidence
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_incidence.atention_time_zone (
	atzo_id text,
	atzo_installation text,
	atzo_support text,
	atzo_uninstall text,
	atzo_zone text,
	PRIMARY KEY (atzo_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.incidence_qualification (
	inqu_id text,
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
	inqu_start_date text,
	PRIMARY KEY (inqu_id)
) WITH gc_grace_seconds =  432000;

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
	pros_quco_users LIST<FROZEN<MAP<text, text>>>,
	pros_quco_zone text,
	pros_ruc text,
	pros_technology text,
	pros_type_addendum text,
	pros_type_rejection text,
	PRIMARY KEY (pros_number, pros_id)
) WITH CLUSTERING ORDER BY ( pros_id ASC )
AND gc_grace_seconds =  432000;

CREATE CUSTOM INDEX prospecting_idx ON polaris_core_incidence.prospecting (pros_commercial_executive) USING
'org.apache.cassandra.index.sasi.SASIIndex';

CREATE INDEX prospecting_pros_quco_users_idx ON polaris_core_incidence.prospecting (VALUES ( pros_quco_users ));

CREATE TABLE polaris_core_incidence.installed_incidence (
	inin_incidence text,
	inin_accessories text,
	inin_sim_card text,
	PRIMARY KEY (inin_incidence)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.autoid (
	auid_name text,
	auid_number int,
	PRIMARY KEY (auid_name)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.observation_prospecting (
	obpr_id uuid,
	obpr_date text,
	obpr_observation text,
	obpr_photo text,
	obpr_prospecting text,
	obpr_user text,
	PRIMARY KEY (obpr_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.times_by_commerce (
	tbco_id text,
	tbco_city text,
	tbco_country text,
	tbco_diagnostic_time text,
	tbco_name text,
	tbco_province text,
	tbco_repair_time text,
	PRIMARY KEY (tbco_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.inci_incidence (
	inci_id text,
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
	inci_quco_users LIST<FROZEN<MAP<text, text>>>,
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
	PRIMARY KEY (inci_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.holidays (
	holi_id uuid,
	holi_country text,
	holi_date date,
	PRIMARY KEY (holi_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.incidence_file (
	infi_id uuid,
	infi_comm_nit text,
	infi_comm_unique_code text,
	infi_file text,
	infi_file_date date,
	infi_file_name text,
	infi_file_type text,
	infi_inci_id text,
	PRIMARY KEY (infi_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.observation_incidence (
	id uuid,
	obin_date text,
	obin_firm text,
	obin_incidence text,
	obin_observation text,
	obin_photo text,
	obin_user text,
	PRIMARY KEY (id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.removed_incidence (
	rein_incidence text,
	rein_accessories text,
	rein_sim_card text,
	rein_terminal text,
	PRIMARY KEY (rein_incidence)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.typification_incidence (
	tyin_id uuid,
	tyin_date_register text,
	tyin_name text,
	tyin_register_by text,
	tyin_type text,
	PRIMARY KEY (tyin_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.atention_time (
	atti_id text,
	atti_installation text,
	atti_priority text,
	atti_support_and_removal text,
	PRIMARY KEY (atti_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.found_incidence (
	foin_incidence text,
	foin_accessories text,
	foin_sim_card text,
	foin_terminal text,
	PRIMARY KEY (foin_incidence)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.incidence_status (
	views text,
	status text,
	PRIMARY KEY (views)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_incidence.incidence (
	inci_id text,
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
	inci_quco_users LIST<FROZEN<MAP<text, text>>>,
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
	PRIMARY KEY (inci_id)
) WITH gc_grace_seconds =  432000;

//CREATE INDEX incidence_inci_quco_users_idx ON polaris_core_incidence.incidence (VALUES ( inci_quco_users ));

CREATE CUSTOM INDEX incidence_status_idx ON polaris_core_incidence.incidence (inci_status_of_visit) USING
'org.apache.cassandra.index.sasi.SASIIndex';


-- Export of keyspace polaris_core_inventory
CREATE KEYSPACE polaris_core_inventory
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_inventory.sim_card_brand (
	scbr_id uuid,
	scbr_description text,
	PRIMARY KEY (scbr_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_inventory.accessory_status (
	acst_id uuid,
	acst_name text,
	PRIMARY KEY (acst_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_inventory.sim_card (
	sica_serial text,
	sica_brand text,
	sica_date_register text,
	sica_location text,
	sica_register_by text,
	sica_status text,
	sica_status_temporal text,
	PRIMARY KEY (sica_serial)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_inventory.spare_status (
	spst_id uuid,
	spst_name text,
	PRIMARY KEY (spst_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_inventory.sim_card_status (
	scst_id uuid,
	scst_code text,
	scst_description text,
	PRIMARY KEY (scst_id)
) WITH gc_grace_seconds =  432000;

CREATE TABLE polaris_core_inventory.accessory (
	acce_id uuid,
	acce_code text,
	acce_date_register text,
	acce_name text,
	acce_quantity text,
	acce_register_by text,
	acce_status text,
	acce_status_temporal text,
	acce_terminal_model text,
	acce_warehouse text,
	PRIMARY KEY (acce_id)
) WITH gc_grace_seconds =  432000;

CREATE INDEX accessory_acce_code_idx ON polaris_core_inventory.accessory (acce_code);

CREATE TABLE polaris_core_inventory.spare (
	spar_id uuid,
	spar_code text,
	spar_date_register text,
	spar_name text,
	spar_quantity text,
	spar_register_by text,
	spar_status text,
	spar_status_temporal text,
	spar_terminal_model text,
	spar_warehouse text,
	PRIMARY KEY (spar_id)
) WITH gc_grace_seconds =  432000;

CREATE INDEX spare_spar_code_idx ON polaris_core_inventory.spare (spar_code);

CREATE CUSTOM INDEX spar_terminal_model_idx ON polaris_core_inventory.spare (spar_terminal_model) USING
'org.apache.cassandra.index.sasi.SASIIndex';

CREATE INDEX spare_spar_terminal_model_idx ON polaris_core_inventory.spare (spar_terminal_model);


-- Export of keyspace polaris_core_location
CREATE KEYSPACE polaris_core_location
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_location.auto_code (
	auco_id text,
	auco_number text,
	PRIMARY KEY (auco_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.quadrant_commerce (
	quco_id uuid,
	quco_color text,
	quco_coordinates LIST<FROZEN<MAP<text, text>>>,
	quco_name text,
	quco_users LIST<FROZEN<MAP<text, text>>>,
	quco_zone text,
	quty_id uuid,
	quty_name text,
	PRIMARY KEY (quco_id)
) WITH gc_grace_seconds = 432000;

//CREATE INDEX quadrant_commerce_quco_users_idx ON polaris_core_location.quadrant_commerce (VALUES ( quco_users ));

CREATE TABLE polaris_core_location.quadrant (
	quad_id uuid,
	quad_color text,
	quad_coordinates LIST<FROZEN<MAP<text, text>>>,
	quad_name text,
	quad_users LIST<FROZEN<MAP<text, text>>>,
	quad_zone text,
	quty_id uuid,
	quty_name text,
	PRIMARY KEY (quad_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.autoid (
	auid_name text,
	auid_number int,
	PRIMARY KEY (auid_name)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.quadrant_type (
	quty_id uuid,
	quty_name text,
	PRIMARY KEY (quty_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.prospection_file (
	prosp_file_id uuid,
	prosp_file text,
	prosp_file_date date,
	prosp_file_dni text,
	prosp_file_name text,
	prosp_file_part_taxpayer_type text,
	prosp_file_type text,
	PRIMARY KEY (prosp_file_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.localication (
	loca_id text,
	loca_date date,
	loca_latitude text,
	loca_length text,
	PRIMARY KEY (loca_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.commerce (
	comm_id uuid,
	comm_address text,
	comm_agency_code text,
	comm_agency_name text,
	comm_approved boolean,
	comm_assignment_motive text,
	comm_cellphone text,
	comm_city text,
	comm_city_id uuid,
	comm_commercial_area text,
	comm_commercial_boss text,
	comm_commercial_executive text,
	comm_contact_person text,
	comm_country text,
	comm_date_register text,
	comm_document_type text,
	comm_email text,
	comm_general_rubro text,
	comm_jungle_bill text,
	comm_name text,
	comm_nit text,
	comm_number_type text,
	comm_phone text,
	comm_priority text,
	comm_province text,
	comm_quadrant MAP<text, text>,
	comm_reference text,
	comm_register_by text,
	comm_route_code text,
	comm_schedule_attention text,
	comm_specific_rubro text,
	comm_temporal_flag text,
	comm_ubigeo text,
	comm_uniqe_code text,
	comm_zone_diebold text,
	part_uniqe_code text,
	PRIMARY KEY (comm_id)
) WITH gc_grace_seconds = 432000;

CREATE MATERIALIZED VIEW polaris_core_location.commerce_info AS
	SELECT comm_uniqe_code, comm_id, comm_address, comm_cellphone, comm_email, comm_name, comm_phone
	FROM commerce
	WHERE comm_uniqe_code IS NOT NULL AND comm_id IS NOT NULL
	PRIMARY KEY ( comm_uniqe_code, comm_id )
	WITH CLUSTERING ORDER BY ( comm_id ASC ) AND gc_grace_seconds = 432000;

CREATE INDEX commerce_comm_uniqe_code_idx ON polaris_core_location.commerce (comm_uniqe_code);

CREATE TABLE polaris_core_location.warehouse (
	ware_id uuid,
	ware_city text,
	ware_country text,
	ware_date_register text,
	ware_email text,
	ware_id_warehouse text,
	ware_name text,
	ware_phone text,
	ware_position text,
	ware_province text,
	ware_register_by text,
	ware_responsable text,
	ware_status text,
	ware_type text,
	PRIMARY KEY (ware_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX warehouse_ware_id_warehouse_idx ON polaris_core_location.warehouse (ware_id_warehouse);

CREATE INDEX warehouse_ware_status_idx ON polaris_core_location.warehouse (ware_status);

CREATE TABLE polaris_core_location.priority_commerce (
	prco_code text,
	prco_descrption text,
	PRIMARY KEY (prco_code)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.times_by_laboratory (
	tbla_id text,
	tbla_diagnostic_time text,
	tbla_name text,
	tbla_repair_time text,
	PRIMARY KEY (tbla_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.warehouse_user (
	user text,
	warehouses text,
	PRIMARY KEY (user)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.partner (
	part_uniqe_code text,
	part_id uuid,
	part_approved boolean,
	part_cellphone text,
	part_comercial_designation text,
	part_credit_account text,
	part_date_register text,
	part_derivation_form text,
	part_detraction_account text,
	part_document_type text,
	part_email text,
	part_legal_representative text,
	part_name text,
	part_number_type text,
	part_phone text,
	part_provider_code text,
	part_receipt_type text,
	part_regime_type text,
	part_register_by text,
	part_social_reason text,
	part_taxpayer_condition text,
	part_taxpayer_status text,
	part_taxpayer_type text,
	part_temporal_flag text,
	PRIMARY KEY (part_uniqe_code, part_id)
) WITH CLUSTERING ORDER BY ( part_id ASC )
AND gc_grace_seconds = 432000;

CREATE INDEX partner_part_name_idx ON polaris_core_location.partner (part_name);

CREATE TABLE polaris_core_location.quadrant_x_user (
	user_id uuid,
	quadrant_id uuid,
	quus_typo text,
	PRIMARY KEY (user_id, quadrant_id)
) WITH CLUSTERING ORDER BY ( quadrant_id ASC )
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_location.localication_history (
	lohi_id uuid,
	inci_id text,
	inci_status text,
	lohi_accuracy_range double,
	lohi_date text,
	lohi_latitude text,
	lohi_length text,
	lohi_registration_date timestamp,
	lohi_time text,
	lohi_user text,
	PRIMARY KEY (lohi_id)
) WITH gc_grace_seconds = 432000;

-- Export of keyspace polaris_core_postman
CREATE KEYSPACE polaris_core_postman
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_postman.notifications_user_commerce (
	nouc_id uuid,
	nouc_data text,
	nouc_date_create text,
	nouc_dest text,
	nouc_msg text,
	nouc_origin text,
	nouc_state text,
	nouc_type text,
	PRIMARY KEY (nouc_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX notifications_user_commerce_nouc_dest_idx ON polaris_core_postman.notifications_user_commerce (nouc_dest);

CREATE TABLE polaris_core_postman.notifications (
	noti_id uuid,
	noti_date_create text,
	noti_dest text,
	noti_msg text,
	noti_origin text,
	noti_state text,
	noti_type text,
	PRIMARY KEY (noti_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX notifications_noti_dest_idx ON polaris_core_postman.notifications (noti_dest);

-- Export of keyspace polaris_core_seguridad
CREATE KEYSPACE polaris_core_seguridad
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TYPE polaris_core_seguridad.map_embebido (
	values MAP<text, text>);

CREATE TABLE polaris_core_seguridad.access_token (
	id uuid,
	created_by text,
	created_date timestamp,
	expiration_refresh timestamp,
	token_json text,
	updated_by text,
	updated_date timestamp,
	PRIMARY KEY (id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_seguridad.accion (
	id text,
	created_by text,
	created_date timestamp,
	estado text,
	updated_by text,
	updated_date timestamp,
	valor int,
	PRIMARY KEY (id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_seguridad.keycloak (
	id uuid,
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
	user_name text,
	PRIMARY KEY (id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_seguridad.permiso (
	modulo_id uuid,
	nombre_accion text,
	created_by text,
	created_date timestamp,
	estado text,
	map_modulo FROZEN<map_embebido>,
	nombre text,
	updated_by text,
	updated_date timestamp,
	valor int,
	PRIMARY KEY (modulo_id, nombre_accion)
) WITH CLUSTERING ORDER BY ( nombre_accion DESC )
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_seguridad.directorio_activo (
	tenant_id uuid,
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
	updated_date timestamp,
	PRIMARY KEY (tenant_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_seguridad.modulo (
	id uuid,
	acciones LIST<FROZEN<map_embebido>>,
	cliente_id LIST<uuid>,
	created_by text,
	created_date timestamp,
	estado text,
	icono text,
	menu_padre uuid,
	nombre text,
	posicion int,
	ruta text,
	tablas LIST<FROZEN<map_embebido>>,
	tipo text,
	updated_by text,
	updated_date timestamp,
	PRIMARY KEY (id)
) WITH gc_grace_seconds = 432000;

-- Export of keyspace polaris_core_terminal
CREATE KEYSPACE polaris_core_terminal
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_terminal.user_terminals (
	uste_user text,
	uste_date text,
	uste_associated_terminals text,
	uste_completed_terminals text,
	uste_diagnosed_terminals text,
	uste_repaired_terminals text,
	PRIMARY KEY (uste_user, uste_date)
) WITH CLUSTERING ORDER BY ( uste_date ASC )
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_state (
	test_id text,
	test_description text,
	PRIMARY KEY (test_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_spares_warranty (
	tesw_id uuid,
	tesw_date text,
	tesw_open text,
	tesw_repuestos text,
	tesw_serial text,
	tesw_status text,
	tesw_type text,
	PRIMARY KEY (tesw_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminals_brand (
	tebr_id uuid,
	tebr_name text,
	PRIMARY KEY (tebr_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_history (
	tehi_serial text,
	tehi_historial text,
	PRIMARY KEY (tehi_serial)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal (
	term_serial text,
	term_brand text,
	term_buy_date text,
	term_current_account text,
	term_date_ans text,
	term_date_finish text,
	term_date_reception text,
	term_date_register text,
	term_imei text,
	term_localication text,
	term_mk text,
	term_model text,
	term_num_terminal text,
	term_register_by text,
	term_reserve_flag boolean,
	term_reserve_technology text,
	term_security_seal text,
	term_start_date_warranty text,
	term_status text,
	term_status_temporal text,
	term_technology text,
	term_technology_description text,
	term_user_reparation text,
	term_warranty_time text,
	term_warranty_type text,
	PRIMARY KEY (term_serial)
) WITH gc_grace_seconds = 432000;

CREATE INDEX terminal_term_localication_idx ON polaris_core_terminal.terminal (term_localication);

CREATE INDEX terminal_term_model_idx ON polaris_core_terminal.terminal (term_model);

CREATE INDEX terminal_term_status_idx ON polaris_core_terminal.terminal (term_status);

CREATE TABLE polaris_core_terminal.technology (
	tech_code text,
	tech_description text,
	PRIMARY KEY (tech_code)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_types_validation (
	tetv_id uuid,
	tetv_description text,
	PRIMARY KEY (tetv_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_validation_status (
	tevs_terminal_serial text,
	tevs_status text,
	tevs_date text,
	tevs_open text,
	tevs_terminal_validation text,
	tevs_user text,
	PRIMARY KEY (tevs_terminal_serial, tevs_status)
) WITH CLUSTERING ORDER BY ( tevs_status ASC )
AND gc_grace_seconds = 432000;

CREATE INDEX status_index ON polaris_core_terminal.terminal_validation_status (tevs_status);

CREATE TABLE polaris_core_terminal.terminal_model (
	temo_id uuid,
	temo_brand text,
	temo_name text,
	temo_photo text,
	PRIMARY KEY (temo_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX terminal_model_temo_name_idx ON polaris_core_terminal.terminal_model (temo_name);

CREATE TABLE polaris_core_terminal.terminal_observation (
	teob_id uuid,
	teob_date text,
	teob_description text,
	teob_fecha text,
	teob_id_user text,
	teob_open text,
	teob_photo text,
	teob_serial_terminal text,
	PRIMARY KEY (teob_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX terminal_observation_teob_serial_terminal_idx ON polaris_core_terminal.terminal_observation
(teob_serial_terminal);

CREATE TABLE polaris_core_terminal.clinic_history_terminal (
	id uuid,
	actions text,
	date_close text,
	date_register text,
	open boolean,
	term_serial text,
	PRIMARY KEY (id)
) WITH bloom_filter_fp_chance = 0.01
AND comment = 'Tabla para almacenamiento de las historias clinicas de las terminales
term_serial => serial de la terminal 
date_register => Fecha
term_status => Estado de la terminal (DIAGNOSTICO, REPARACIÓN)
actions => (TIPIFICACIONES, VALIDACIONES DE LA TERMINAL, EVIDENCIAS FOTOGRAFICAS, OBSERVACIONES)'
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_validation (
	teva_id uuid,
	teva_description text,
	PRIMARY KEY (teva_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_terminal.terminal_types_states (
	tets_terminal_serial text,
	tets_status text,
	tets_date text,
	tets_open text,
	tets_terminal_type_validation text,
	PRIMARY KEY (tets_terminal_serial, tets_status)
) WITH CLUSTERING ORDER BY ( tets_status ASC )
AND gc_grace_seconds = 432000;

CREATE INDEX status_index_types_states ON polaris_core_terminal.terminal_types_states (tets_status);


-- Export of keyspace polaris_core_user
CREATE KEYSPACE polaris_core_user
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_core_user.autoid (
	auid_name text,
	auid_number int,
	PRIMARY KEY (auid_name)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_user.module (
	module_id int,
	module_name text,
	PRIMARY KEY (module_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX module_module_name_idx ON polaris_core_user.module (module_name);

CREATE TABLE polaris_core_user.roles (
	role_id int,
	role_modules text,
	role_name text,
	PRIMARY KEY (role_id)
) WITH gc_grace_seconds = 432000;

CREATE CUSTOM INDEX roles_idx ON polaris_core_user.roles (role_modules) USING
'org.apache.cassandra.index.sasi.SASIIndex';

CREATE TABLE polaris_core_user.user_city (
	usercode text,
	citys text,
	PRIMARY KEY (usercode)
) WITH gc_grace_seconds = 432000;

CREATE CUSTOM INDEX user_city_idx ON polaris_core_user.user_city (citys) USING
'org.apache.cassandra.index.sasi.SASIIndex';

CREATE TABLE polaris_core_user.icons (
	icon_item text,
	icon_icon text,
	PRIMARY KEY (icon_item)
) WITH gc_grace_seconds = 432000;

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
) WITH CLUSTERING ORDER BY ( tesc_id ASC )
AND gc_grace_seconds = 432000;

CREATE TABLE polaris_core_user.schedule (
	sche_id uuid,
	sche_end text,
	sche_name text,
	sche_start text,
	sche_type text,
	PRIMARY KEY (sche_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_user.user_dashboard (
	usercode text,
	dashboard text,
	PRIMARY KEY (usercode)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_user.user_commerce (
	usco_id text,
	usco_cellphone text,
	usco_date_register text,
	usco_name text,
	usco_password text,
	usco_phone text,
	PRIMARY KEY (usco_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX user_commerce_usco_name_idx ON polaris_core_user.user_commerce (usco_name);

CREATE TABLE polaris_core_user.submodule (
	submodule_id int,
	submodule_idmodule int,
	submodule_name text,
	PRIMARY KEY (submodule_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX submodule_submodule_name_idx ON polaris_core_user.submodule (submodule_name);

CREATE TABLE polaris_core_user.security_questions_user (
	sq_user text,
	sq_questions text,
	PRIMARY KEY (sq_user)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_user.position (
	posi_id uuid,
	posi_name text,
	posi_number int,
	posi_type text,
	PRIMARY KEY (posi_id)
) WITH gc_grace_seconds = 432000;

CREATE TABLE polaris_core_user.user (
	user_identification text,
	user_address text,
	user_double_factor boolean,
	user_email text,
	user_hashclose text,
	user_id_segurity text,
	user_id_user text,
	user_immediate_boss text,
	user_location text,
	user_locations text,
	user_login text,
	user_name text,
	user_password text,
	user_phone text,
	user_photo text,
	user_position text,
	user_quadrant_name text,
	user_role text,
	user_secret_totp text,
	user_sesion_id uuid,
	user_session text,
	user_state text,
	PRIMARY KEY (user_identification)
) WITH gc_grace_seconds = 432000;

CREATE INDEX user_user_email_idx ON polaris_core_user.user (user_email);

CREATE INDEX user_user_id_user_idx ON polaris_core_user.user (user_id_user);

CREATE INDEX user_user_session_idx ON polaris_core_user.user (user_session);

CREATE TABLE polaris_core_user.views (
	view_id uuid,
	view_idsubmodule int,
	view_name text,
	PRIMARY KEY (view_id)
) WITH gc_grace_seconds = 432000;

CREATE INDEX views_view_idsubmodule_idx ON polaris_core_user.views (view_idsubmodule);

-- Export of keyspace polaris_security_multiplefa
CREATE KEYSPACE polaris_security_multiplefa
WITH durable_writes = true
AND replication = {
	'class' : 'SimpleStrategy',
	'replication_factor' : 2
};

CREATE TABLE polaris_security_multiplefa.user_code (
	user_pool_id uuid,
	created_date date,
	user_email text,
	code text,
	expiration_datetime timestamp,
	expiration_in_seconds int,
	is_used boolean,
	PRIMARY KEY (user_pool_id, created_date, user_email, code)
) WITH CLUSTERING ORDER BY ( created_date DESC, user_email ASC, code ASC )
AND gc_grace_seconds = 432000;