CREATE TABLE IF NOT EXISTS polaris_core_user.submodule (
	submodule_id int PRIMARY KEY,
	submodule_idmodule int,
	submodule_name text,
	submodule_path text)
	WITH ID = 0f40bcf1-8b44-11eb-b399-9b89c16b65a4
	AND bloom_filter_fp_chance = 0.01
	AND caching = { 'keys': 'ALL', 'rows_per_partition': 'NONE' }
	AND cdc = false
	AND comment = ''
	AND compaction = { 'max_threshold': '32', 'min_threshold': '4', 'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy' }
	AND compression = { 'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor' }
	AND crc_check_chance = 1.0
	AND dclocal_read_repair_chance = 0.1
	AND default_time_to_live = 0
	AND extensions = {  }
	AND gc_grace_seconds = 864000
	AND max_index_interval = 2048
	AND memtable_flush_period_in_ms = 0
	AND min_index_interval = 128
	AND read_repair_chance = 0.0
	AND speculative_retry = '99PERCENTILE';
ALTER TABLE polaris_core_user.submodule DROP submodule_path USING TIMESTAMP 1616552469081000;
ALTER TABLE polaris_core_user.submodule ADD submodule_path text;
CREATE INDEX submodule_submodule_name_idx ON polaris_core_user.submodule (submodule_name);
