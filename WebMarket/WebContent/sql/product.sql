CREATE TABLE IF NOT EXISTS product(
	p_id VARCHAR(10) NOT NULL,
	p_name varchar(10),
	p_unitPrice integer,
	p_description TEXT,
	p_category varchar(20),
	p_manufacturer varchar(20),
	p_unitsInStock LONG,
	p_condition varchar(20),
	p_fileName varchar(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;