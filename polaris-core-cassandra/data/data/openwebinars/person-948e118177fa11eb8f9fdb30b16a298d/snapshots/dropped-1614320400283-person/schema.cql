CREATE TABLE IF NOT EXISTS openwebinars.person (
	name text PRIMARY KEY,
	age int,
	created timestamp,
	prueba text,
	surname text)
	WITH ID = 948e1181-77fa-11eb-8f9f-db30b16a298d
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
