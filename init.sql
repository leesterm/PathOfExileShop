DROP DATABASE IF EXISTS PathOfExile;
CREATE DATABASE PathOfExile;

\c pathofexile;

CREATE TABLE users(
	username varchar(32) PRIMARY KEY,
	password varchar(32),
	address varchar(32),
	dob DATE,
	balance decimal
);
CREATE TABLE bases(
	id serial PRIMARY KEY,
	item_name varchar(32),
	item_level integer,
	item_type varchar(32),
	dex_req integer,
	str_req integer,
	int_req integer,
	item_image text
);
/*CREATE TABLE weapons(
	id serial REFERENCES items(id),
	item_min_attk integer,
	item_max_attk integer,
	block_chance integer,
	attk_speed decimal,
	num_of_hands integer
);*/
CREATE TABLE affixes(
	id serial PRIMARY KEY,
	description text,
	min_v decimal,
	max_v decimal,
	name varchar(32),
	level_req integer,
	a_type varchar(32),
	rings boolean,
	amulets boolean,
	belts boolean,
	helmets boolean,
	gloves boolean,
	boots boolean,
	chests boolean,
	shields boolean,
	quivers boolean,
	wands boolean,
	daggers boolean,
	claws boolean,
	sceptres boolean,
	staffs boolean,
	bows boolean,
	one_h_swords_axe boolean,
	two_h_swords_axe boolean,
	one_h_mace boolean,
	two_h_mace boolean
);
CREATE TABLE binding(
	bind_id serial PRIMARY KEY,
	base_id serial REFERENCES bases(id),
	username varchar(32) REFERENCES users(username),
	buyer varchar(32) REFERENCES users(username),
	status varchar(32),
	cost decimal
);
CREATE TABLE set_of_affixes(
	bind_id serial REFERENCES binding(bind_id),
	affix_id serial REFERENCES affixes(id)
	/*value integer*/
);
CREATE TABLE shopping_cart(
	username varchar(32) REFERENCES users(username),
	bind_id serial REFERENCES binding(bind_id)
);

INSERT INTO users(username,password,address,dob,balance) VALUES ('john123','123','123 Fake Street','1999-01-08',100059683.00);	
INSERT INTO users(username,password,address,dob,balance) VALUES ('jill123','123','1234 Even Faker Street','1900-02-10',22283.00);	
INSERT INTO users(username,password,address,dob,balance) VALUES ('jack123','123','12345 Fakest Street','1971-11-29',4352283.00);	

INSERT INTO affixes(description,min_v,max_v,name,level_req,a_type,rings,amulets,belts,helmets,gloves,boots,chests,shields,quivers,wands,daggers,claws,sceptres,staffs,bows,one_h_swords_axe,two_h_swords_axe,one_h_mace,two_h_mace) VALUES(
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	1, 2, 'Frosted',2,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	3, 8, '	Chilled	',13,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	5, 12, '	Icy	',21,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	6, 16, '	Frigid	',29,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	8, 19, '	Freezing	',37,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(	
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	10, 24, '	Frozen	',50,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(	
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	12, 28, '	Glaciated	',60,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	14, 34, '	Polar	',71,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(	
'Base Min Added Cold Dmg / Base Max Added Cold Dmg',	17, 40, '	Entombing	',77,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	1, 2, '	Heated	',1,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	3, 8, '	Smoldering	',12,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	5, 13, '	Smoking	',20,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	7, 18, '	Burning	',28,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	9, 22, '	Flaming	',36,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(		
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	11, 29, '	Scorching	',48,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	13, 35, '	Incinerating	',59,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	16, 42, '	Blasting	',70,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Fire Dmg / Base Max Added Fire Dmg',	19, 45, '	Cremating	',76,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	1, 5, '	Humming	',3,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	1, 15, '	Buzzing	',13,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	1, 23, '	Snapping	',22,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	1, 28, '	Crackling	',30,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	1, 34, '	Sparking	',38,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	1, 43, '	Arcing	',50,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	2, 50, '	Shocking	',58,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	3, 61, '	Discharging	',69,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Lightning Dmg / Base Max Added Lightning Dmg',	3, 72, '	Electrocuting	',76,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	1, 2, '	Glinting	',5,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	2, 5, '	Burnished	',13,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	3, 7, '	Polished	',19,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	4, 10, '	Honed	',28,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	5, 12, '	Gleaming	',35,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	6, 15, '	Annealed	',44,'Prefix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	7, 18, '	Razor Sharp	',52,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	9, 22, '	Tempered	',64,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Min Added Physical Dmg / Base Max Added Physical Dmg',	11, 26, '	Flaring	',76,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	1, 3, '	Glinting	',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	4, 10, '	Burnished	',13,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	6, 14, '	Polished	',21,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	7, 18, '	Honed	',29,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	9, 22, '	Gleaming	',36,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	12, 28, '	Annealed	',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	13, 32, '	Razor Sharp	',54,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	16, 38, '	Tempered	',65,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	19, 45, '	Flaring	',77,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	false,	true,	false,	true,	false),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	2, 5, '	Glinting	',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	6, 14, '	Burnished	',13,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	9, 21, '	Polished	',21,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	11, 27, '	Honed	',29,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	14, 33, '	Gleaming	',36,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	18, 42, '	Annealed	',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	20, 48, '	Razor Sharp	',54,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	24, 57, '	Tempered	',65,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Local Min Added Physical Dmg / Local Max Added Physical Dmg',	29, 68, '	Flaring	',77,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	true),(
'Physical Dmg To Return To Melee Attacker',	1, 4, '	Thorny	',1,'Prefix',	false,	false,	true,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Physical Dmg To Return To Melee Attacker',	5, 10, '	Spiny	',10,'Prefix',	false,	false,	true,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Physical Dmg To Return To Melee Attacker',	11, 24, '	Barbed	',20,'Prefix',	false,	false,	true,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Physical Dmg To Return To Melee Attacker',	25, 50, '	Jagged	',35,'Prefix',	false,	false,	true,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Physical Dmg +%',	20, 49, '	Heavy	',1,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +%',	50, 69, '	Serrated	',11,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +%',	70, 89, '	Wicked	',23,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +%',	90, 109, '	Vicious	',35,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +%',	110, 129, '	Bloodthirsty	',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +%',	130, 149, '	Cruel	',60,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +%',	150, 169, '	Tyrannical	',73,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(		
'Local Physical Dmg +% / Local Accuracy Rating',	10, 24, '	Squires',1,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(		
'Local Physical Dmg +% / Local Accuracy Rating',	25, 34, '	Journeymans',11,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(		
'Local Physical Dmg +% / Local Accuracy Rating',	35, 44, '	Reavers',23,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +% / Local Accuracy Rating',	45, 54, '	Mercenarys',35,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +% / Local Accuracy Rating',	55, 64, '	Champions',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +% / Local Accuracy Rating',	65, 74, '	Conquerors',60,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Physical Dmg +% / Local Accuracy Rating',	75, 80, '	Emperors',73,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Armor Rating',	3, 10, '	Lacquered	',1,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating',	11, 35, '	Studded	',18,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating',	36, 60, '	Ribbed	',30,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating',	61, 138, '	Fortified	',44,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating',	139, 322, '	Plated	',57,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating',	323, 400, '	Carapaced	',71,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor Rating',	3, 10, '	Lacquered	',1,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor Rating',	11, 35, '	Studded	',18,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor Rating',	36, 60, '	Ribbed	',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor Rating',	61, 138, '	Fortified	',46,'Prefix',	false,	false,	false,	true, 	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor Rating',	139, 322, '	Plated	',59,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor Rating',	323, 400, '	Carapaced	',73,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +%',	11, 28, '	Reinforced	',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +%',	29, 46, '	Layered	',17,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +%',	47, 64, '	Lobstered	',29,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +%',	65, 82, '	Buttressed	',42,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +%',	83, 100, '	Thickened	',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +%',	101, 120, '	Girded	',72,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	2, 4, '	Reinforced	',2,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	5, 7, '	Layered	',18,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	8, 10, '	Lobstered	',30,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	11, 13, '	Buttressed	',42,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	14, 16, '	Thickened	',56,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	17, 19, '	Solid	',70,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Armor Rating +%',	20, 22, '	Impregnable	',77,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +% / Base Stun Recovery +%',	6, 14, '	Beetles',1,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +% / Base Stun Recovery +%',	15, 23, '	Crabs',17,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +% / Base Stun Recovery +%',	24, 32, '	Armadillos',29,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +% / Base Stun Recovery +%',	33, 41, '	Rhinos',42,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +% / Base Stun Recovery +%',	42, 50, '	Elephants',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armor +% / Base Stun Recovery +%',	51, 56, '	Mammoths',78,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	1, 3, '	Shining	',3,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	4, 8, '	Glimmering	',11,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	9, 12, '	Glittering	',17,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	13, 15, '	Glowing	',23,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	16, 19, '	Radiating	',29,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	20, 22, '	Pulsing	',35,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	23, 26, '	Seething	',42,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	27, 31, '	Blazing	',50,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	32, 37, '	Scintillating	',59,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	38, 43, '	Incandescent	',68,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Energy Shield',	44, 47, '	Resplendent	',74,'Prefix',	false,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	3, 5, '	Shining	',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	6, 8, '	Glimmering	',11,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	9, 12, '	Glittering	',17,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	13, 15, '	Glowing	',23,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	16, 19, '	Radiating	',29,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	20, 29, '	Pulsing	',35,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	30, 48, '	Seething	',43,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	49, 72, '	Blazing	',51,'Prefix',	false,	false,	false,	true, 	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	73, 106, '	Scintillating	',60,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	107, 135, '	Incandescent	',69,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield',	136, 145, '	Resplendent	',75,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +%',	11, 28, '	Protective	',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +%',	29, 46, '	Strong-Willed	',18,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +%',	47, 64, '	Resolute	',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +%',	65, 82, '	Fearless	',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +%',	83, 100, '	Dauntless	',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +%',	101, 120, '	Unconquerable	',72,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	2, 4, '	Protective	',3,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	5, 7, '	Strong-Willed	',18,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	8, 10, '	Resolute	',30,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	11, 13, '	Fearless	',42,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	14, 16, '	Dauntless	',56,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	17, 19, '	Indomitable	',70,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Max Energy Shield +%',	20, 22, '	Unassailable	',77,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +% / Base Stun Recovery +%',	6, 14, '	Pixies',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +% / Base Stun Recovery +%',	15, 23, '	Gremlins',18,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +% / Base Stun Recovery +%',	24, 32, '	Boggarts',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +% / Base Stun Recovery +%',	33, 41, '	Nagas',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +% / Base Stun Recovery +%',	42, 50, '	Djinns',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Energy Shield +% / Base Stun Recovery +%',	51, 56, '	Seraphins',78,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Evasion Rating',	3, 10, '	Agile	',1,'Prefix',	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Evasion Rating',	11, 35, '	Dancers',18,'Prefix',	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Evasion Rating',	36, 60, '	Acrobats',29,'Prefix',	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Evasion Rating',	61, 80, '	Fleet	',42,'Prefix',	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Evasion Rating',	81, 120, '	Blurred	',58,'Prefix',	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Evasion Rating',	121, 150, '	Phased	',72,'Prefix',	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	2, 4, '	Agile	',2,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	5, 7, '	Dancers',19,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	8, 10, '	Acrobats',30,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	11, 13, '	Fleet	',42,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	14, 16, '	Blurred	',56,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	17, 19, '	Phased	',70,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Evasion Rating +%',	20, 22, '	Vaporous	',77,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating',	3, 10, '	Agile	',1,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating',	11, 35, '	Dancers',18,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating',	36, 60, '	Acrobats',29,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating',	61, 138, '	Fleet	',42,'Prefix',	false,	false,	false,	true, 	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating',	139, 322, '	Blurred	',56,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating',	323, 400, '	Vaporous	',70,'Prefix',	false,	false,	false,	false,	false,	false,	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +%',	11, 28, '	Shades',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +%',	29, 46, '	Ghosts',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +%',	47, 64, '	Spectres',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +%',	65, 82, '	Wraiths',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +%',	83, 100, '	Phantasms',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +%',	101, 120, '	Nightmares',72,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +% / Base Stun Recovery +%',	6, 14, '	Mosquitos',2,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +% / Base Stun Recovery +%',	15, 23, '	Moths',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +% / Base Stun Recovery +%',	24, 32, '	Butterflys',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +% / Base Stun Recovery +%',	33, 41, '	Wasps',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +% / Base Stun Recovery +%',	42, 50, '	Dragonflys',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion Rating +% / Base Stun Recovery +%',	51, 56, '	Hummingbirds',78,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Flask Life Recovery Rate +%',	10, 20, '	Recovering	',5,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Flask Mana Recovery Rate +%',	10, 20, '	Inspiring	',5,'Prefix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Socketed Bow Gem Level +	1',	1, 1, '	Fletchers',9,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false),(
'Local Socketed Bow Gem Level +	2',	2, 2, 'Sharpshooters',64,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false),(
'Local Socketed Cold Gem Level +',	1, 1, '	Frost Weavers',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Local Socketed Cold Gem Level +',	2, 2, '	Winterbringers',55,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Local Socketed Fire Gem Level +',	1, 1, '	Flame Spinners',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Local Socketed Fire Gem Level +',	2, 2, '	Lava Callers',55,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Local Socketed Lightning Gem Level +',	1, 1, '	Thunder Lords',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Local Socketed Lightning Gem Level +',	2, 2, '	Tempest Kings',55,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Local Socketed Melee Gem Level +',	1, 1, '	Combatants',8,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	false,	true,	true,	true,	true,	false,	true,	true,	true,	true),(
'Local Socketed Melee Gem Level +',	2, 2, '	Weaponmasters',63,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	false,	true,	true,	true,	true,	false,	true,	true,	true,	true),(
'Local Socketed Minion Gem Level +',	1, 1, '	Reanimators',14,'Prefix',	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Socketed Minion Gem Level +',	2, 2, '	Summoners',65,'Prefix',	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Socketed Gem Level +	1,',	1, 1,	'Paragons',55,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Armour And Energy Shield +%',	11, 28, '	Infixed	',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +%',	29, 46, '	Ingrained	',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +%',	47, 64, '	Instilled	',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +%',	65, 82, '	Infused	',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +%',	83, 100, '	Inculcated	',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +%',	100, 120, '	Interpolated	',72,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +%',	11, 28, '	Scrappers',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +%',	29, 46, '	Brawlers',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +%',	47, 64, '	Fencers',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +%',	65, 82, '	Gladiators',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +%',	83, 100, '	Duelists',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +%',	100, 120, '	Heros',72,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +%',	11, 28, '	Shadowy	',3,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +%',	29, 46, '	Ethereal	',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +%',	47, 64, '	Unworldly	',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +%',	65, 82, '	Ephemeral	',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +%',	83, 100, '	Evanescent	',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +%',	100, 120, '	Unreal	',72,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +% / Base Stun Recovery +%',	6, 14, '	Pixies',2,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +% / Base Stun Recovery +%',	15, 23, '	Gremlins',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +% / Base Stun Recovery +%',	24, 32, '	Boggarts',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +% / Base Stun Recovery +%',	33, 41, '	Nagas',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +% / Base Stun Recovery +%',	42, 50, '	Djinns',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Energy Shield +% / Base Stun Recovery +%',	51, 56, '	Seraphims',78,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +% / Base Stun Recovery +%',	6, 14, '	Beetles',2,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +% / Base Stun Recovery +%',	15, 23, '	Crabs',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +% / Base Stun Recovery +%',	24, 32, '	Armadillos',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +% / Base Stun Recovery +%',	33, 41, '	Rhinos',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +% / Base Stun Recovery +%',	42, 50, '	Elephants',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Armour And Evasion +% / Base Stun Recovery +%',	51, 56, '	Mammoths',78,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +% / Base Stun Recovery +%',	6, 14, '	Mosquitos',2,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +% / Base Stun Recovery +%',	15, 23, '	Moths',19,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +% / Base Stun Recovery +%',	24, 32, '	Butterflys',30,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +% / Base Stun Recovery +%',	33, 41, '	Wasps',44,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +% / Base Stun Recovery +%',	42, 50, '	Dragonflys',60,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Evasion And Energy Shield +% / Base Stun Recovery +%',	51, 56, '	Hummingbirds',78,'Prefix',	false,	false,	false,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	8, 12, '	Magpies	',20,'Prefix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	13, 18, '	Pirates	',39,'Prefix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	19, 24, '	Dragons	',62,'Prefix',	true,	true,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	10, 19, '	Healthy	',1,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	20, 29, '	Sanguine	',11,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	30, 39, '	Stalwart	',18,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	40, 49, '	Stout	',24,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	50, 59, '	Robust	',30,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	60, 69, '	Rotund	',36,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	70, 79, '	Virile	',44,'Prefix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	80, 89, '	Athletes',54,'Prefix',	false,	false,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	90, 99, '	Fecund	',64,'Prefix',	false,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Max Life',	100, 109, '	Vigorous	',73,'Prefix',	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Life Leech From Physical Dmg %',	1, 2, '	Remoras',9,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Leech From Physical Dmg %',	3, 5, '	Lampreys',25,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Leech From Physical Dmg %',	5, 6, '	Vampires',72,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Max Mana',	15, 19, '	Beryl	',1,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	20, 24, '	Cobalt	',11,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	25, 29, '	Azure	',17,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	30, 34, '	Sapphire	',23,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	35, 39, '	Cerulean	',29,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	40, 44, '	Aqua	',35,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	45, 49, '	Opalescent	',42,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	50, 54, '	Gentian	',51,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	55, 59, '	Chalybeous	',60,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	60, 64, '	Mazarine	',69,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Max Mana',	65, 68, '	Blue	',75,'Prefix',	true,	true,	false,	true, 	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Mana Leech From Physical Dmg %',	1, 2, '	Thirsty	',9,'Prefix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Mana Leech From Physical Dmg %',	3, 4, '	Parched	',74,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Movement Velocity +%',	10, 10, '	Runners',1,'Prefix',	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Movement Velocity +%',	15, 15, '	Sprinters',15,'Prefix',	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Movement Velocity +%',	20, 20, '	Stallions',30,'Prefix',	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Movement Velocity +%',	25, 25, '	Gazelles',40,'Prefix',	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Movement Velocity +%',	30, 30, '	Cheetahs',55,'Prefix',	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	3, 7, '	Chanters',5,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	8, 12, '	Mages',20,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	13, 17, '	Sorcerers',38,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	18, 22, '	Thaumaturgists',56,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	23, 26, '	Wizards',76,'Prefix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Weapon Elemental Dmg +%',	5, 10, '	Catalyzing	',4,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon Elemental Dmg +%',	11, 20, '	Infusing	',15,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon Elemental Dmg +%',	21, 30, '	Empowering	',30,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon Elemental Dmg +%',	31, 36, '	Unleashed	',75,'Prefix',	true,	true,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	2, 4, '	Frosted	',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	5, 13, '	Chilled	',13,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	8, 20, '	Icy	',21,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	11, 26, '	Frigid	',29,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	14, 34, '	Freezing	',38,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	18, 43, '	Frozen	',50,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	21, 50, '	Glaciated	',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	25, 59, '	Polar	',69,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	27, 64, '	Entombing	',75,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	1, 4, '	Heated	',1,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	6, 14, '	Smoldering	',12,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	9, 22, '	Smoking	',20,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	12, 29, '	Burning	',28,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	16, 39, '	Flaming	',38,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	21, 50, '	Scorching	',50,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	24, 57, '	Incinerating	',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	28, 67, '	Blasting	',68,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	30, 72, '	Cremating	',74,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	1, 10, '	Humming	',3,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	1, 25, '	Buzzing	',13,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	1, 38, '	Snapping	',22,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	2, 50, '	Crackling	',30,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	2, 61, '	Sparking	',38,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	3, 79, '	Arcing	',50,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	4, 91, '	Shocking	',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	5, 106, '	Discharging	',68,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	5, 115, '	Electrocuting	',74,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	false,	true,	false),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	2, 7, '	Frosted	',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	8, 19, '	Chilled	',13,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	11, 27, '	Icy	',21,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	16, 21, '	Frigid	',29,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	19, 46, '	Freezing	',38,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	24, 57, '	Frozen	',50,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	29, 68, '	Glaciated	',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	35, 81, '	Polar	',69,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Cold Dmg / Local Max Added Cold Dmg',	41, 96, '	Entombing	',75,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	2, 6, '	Heated	',1,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	8, 20, '	Smoldering	',12,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	12, 30, '	Smoking	',20,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	17, 41, '	Burning	',28,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	21, 51, '	Flaming	',38,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	27, 64, '	Scorching	',50,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	32, 76, '	Incinerating	',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	39, 92, '	Blasting	',68,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Fire Dmg / Local Max Added Fire Dmg',	46, 109, '	Cremating	',74,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	1, 15, '	Humming	',3,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	1, 37, '	Buzzing	',13,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	2, 50, '	Snapping	',22,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	3, 77, '	Crackling	',30,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	3, 79, '	Sparking	',38,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	5, 101, '	Arcing	',50,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	6, 121, '	Shocking	',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	6, 148, '	Discharging	',68,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Local Min Added Lightning Dmg / Local Max Added Lightning Dmg',	8, 172, '	Electrocuting	',74,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	false,	true),(
'Spell Dmg +%',	10, 19, '	Apprentices',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	20, 29, '	Adepts',11,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	30, 39, '	Scholars',23,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	40, 49, '	Professors',35,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	50, 59, '	Occultists',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	60, 69, '	Incanters',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	70, 74, '	Glyphics',79,'Prefix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	5, 9, '	Casters',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	10, 14, '	Magicians',11,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	15, 19, '	Wizards',23,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	20, 24, '	Warlocks',35,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	25, 29, '	Mages',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	30, 34, '	Archmages',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	false,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	15, 29, '	Apprentices',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	30, 44, '	Adepts',11,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	45, 59, '	Scholars',23,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	60, 74, '	Professors',35,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	75, 89, '	Occultists',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	90, 104, '	Incanters',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +%',	105, 110, '	Glyphics',79,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	8, 14, '	Casters',2,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	15, 22, '	Magicians',11,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	23, 29, '	Wizards',23,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	30, 37, '	Warlocks',35,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	38, 44, '	Mages',46,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Spell Dmg +% / Base Max Mana',	45, 50, '	Archmages',58,'Prefix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false),(
'Projectile speed +%',	10, 17, '	of Darting	',14,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	false,	false,	false,	true,	false,	false,	false,	false),(
'Projectile speed +%',	18, 25, '	of Flight	',27,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	false,	false,	false,	true,	false,	false,	false,	false),(
'Projectile speed +%',	26, 33, '	of Propulsion	',41,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	false,	false,	false,	true,	false,	false,	false,	false),(
'Projectile speed +%',	34, 41, '	of the Zephyr	',55,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	false,	false,	false,	true,	false,	false,	false,	false),(
'Accuracy Rating',	5, 15, '	of Calm	',1,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	16, 60, '	of Steadiness	',12,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	61, 100, '	of Accuracy	',20,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	101, 130, '	of Precision	',26,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	131, 165, '	of the Sniper	',33,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	166, 200, '	of the Marksman	',41,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	201, 250, '	of the Deadeye	',50,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	251, 320, '	of the Ranger	',63,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Accuracy Rating',	321, 400, '	of the Assassin	',76,'Suffix',	true,	true,	false,	true,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Accuracy Rating',	5, 15, '	of Calm	',1,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	16, 60, '	of Steadiness	',12,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	61, 100, '	of Accuracy	',20,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	101, 130, '	of Precision	',26,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	131, 165, '	of the Sniper	',33,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	166, 200, '	of the Marksman	',41,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	201, 250, '	of the Deadeye	',50,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Accuracy Rating',	251, 320, '	of the Ranger	',63,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Light Radius / +Accuracy Rating',	5, 5, '	of Shining	',8,'Suffix',	true,	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Light Radius / +Accuracy Rating',	10, 10, '	of Light	',15,'Suffix',	true,	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Light Radius / +Accuracy Rating',	15, 15, '	of Radiance	',30,'Suffix',	true,	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Attack Speed +%',	5, 7, '	of Skill	',1,'Suffix',	true,	false,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Attack Speed +%',	8, 10, '	of Ease	',11,'Suffix',	false,	false,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Attack Speed +%',	11, 13, '	of Mastery	',22,'Suffix',	false,	false,	false,	false,	true,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Attack Speed +%',	14, 16, '	of Grandmastery	',76,'Suffix',	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Attack Speed +%',	6, 9, '	of Skill	',1,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Attack Speed +%',	5, 10, '	of Ease	',11,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Attack Speed +%',	11, 13, '	of Mastery	',22,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Attack Speed +%',	14, 16, '	of Renown	',30,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Attack Speed +%',	17, 19, '	of Acclaim	',37,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	true,	true),(
'Local Attack Speed +%',	20, 22, '	of Fame	',45,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	true,	true),(
'Local Attack Speed +%',	23, 25, '	of Infamy	',60,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	true,	true),(
'Local Attack Speed +%',	26, 27, '	of Celebration	',77,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	true,	true,	true),(
'Additional All Attributes',	1, 4, '	of the Clouds	',1,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	5, 8, '	of the Sky	',11,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	9, 12, '	of the Meteor	',22,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	13, 16, '	of the Comet	',33,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	17, 20, '	of the Heavens	',44,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	21, 24, '	of the Galaxy	',55,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	25, 28, '	of the Universe	',66,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional All Attributes',	29, 32, '	of the Infinite	',77,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Additional Dexterity',	8, 12, '	of the Mongoose	',1,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	13, 17, '	of the Lynx	',11,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	18, 22, '	of the Fox	',22,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	23, 27, '	of the Falcon	',33,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	28, 32, '	of the Panther	',44,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	33, 37, '	of the Leopard	',55,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	38, 42, '	of the Jaguar	',66,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Dexterity',	43, 50, '	of the Phantasm	',74,'Suffix',	true,	true,	false,	true, 	true,	true, 	true, 	true, 	true,	false,	true,	true,	false,	false,	true,	true,	true,	false,	false),(
'Additional Intelligence',	8, 12, '	of the Pupil	',1,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	13, 17, '	of the Student	',11,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	18, 22, '	of the Prodigy	',22,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	23, 27, '	of the Augur	',33,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	28, 32, '	of the Philosopher	',44,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	33, 37, '	of the Sage	',55,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	38, 42, '	of the Savant	',66,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Intelligence',	43, 50, '	of the Virtuoso	',74,'Suffix',	true,	true,	false,	true,	true, 	true, 	true, 	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Additional Strength',	8, 12, '	of the Brute	',1,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	13, 17, '	of the Wrestler	',11,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	18, 22, '	of the Bear	',22,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	23, 27, '	of the Lion	',33,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	28, 32, '	of the Gorilla	',44,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	33, 37, '	of the Goliath	',55,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	38, 42, '	of the Leviathan	',66,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Additional Strength',	43, 50, '	of the Titan	',74,'Suffix',	true,	true,	true,	true, 	true, 	true, 	true, 	true, 	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Base Cast Speed +%',	5, 7, '	of Talent	',2,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Base Cast Speed +%',	8, 10, '	of Nimbleness	',15,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Base Cast Speed +%',	11, 13, '	of Expertise	',30,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Base Cast Speed +%',	14, 16, '	of Legerdemain	',40,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Base Cast Speed +%',	17, 19, '	of Prestidigitation	',55,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Base Cast Speed +%',	20, 22, '	of Sortilege	',72,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Base Critical Strike Multiplier +%',	7, 12, '	of Ire	',8,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Critical Strike Multiplier +%',	13, 26, '	of Anger	',21,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Critical Strike Multiplier +%',	27, 39, '	of Rage	',31,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Critical Strike Multiplier +%',	40, 53, '	of Fury	',45,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Critical Strike Multiplier +%',	54, 66, '	of Ferocity	',59,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Critical Strike Multiplier +%',	67, 70, '	of Destruction	',74,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Weapon-only Critical Strike Multiplier +%',	7, 12, '	of Ire	',8,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon-only Critical Strike Multiplier +%',	15, 19, '	of Anger	',21,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon-only Critical Strike Multiplier +%',	20, 24, '	of Rage	',30,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon-only Critical Strike Multiplier +%',	25, 29, '	of Fury	',44,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon-only Critical Strike Multiplier +%',	30, 34, '	of Ferocity	',59,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Weapon-only Critical Strike Multiplier +%',	35, 38, '	of Destruction	',73,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Critical Strike Chance +%',	10, 14, '	of Needling	',5,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Critical Strike Chance +%',	15, 19, '	of Stinging	',20,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Critical Strike Chance +%',	20, 24, '	of Piercing	',30,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Critical Strike Chance +%',	25, 29, '	of Puncturing	',44,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Critical Strike Chance +%',	30, 34, '	of Penetrating	',58,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Critical Strike Chance +%',	35, 38, '	of Incision	',72,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Critical Strike Chance +%',	10, 14, '	of Needling	',1,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Critical Strike Chance +%',	15, 19, '	of Stinging	',20,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Critical Strike Chance +%',	20, 24, '	of Piercing	',30,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Critical Strike Chance +%',	25, 29, '	of Puncturing	',44,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Critical Strike Chance +%',	30, 34, '	of Penetrating	',59,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Critical Strike Chance +%',	35, 38, '	of Incision	',73,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Spell Critical Strike Chance +%',	11, 20, '	of Menace	',11,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Spell Critical Strike Chance +%',	20, 39, '	of Havoc	',21,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Spell Critical Strike Chance +%',	40, 59, '	of Disaster	',28,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Spell Critical Strike Chance +%',	60, 79, '	of Calamity	',41,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Spell Critical Strike Chance +%',	80, 99, '	of Ruin	',59,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Spell Critical Strike Chance +%',	100, 109, '	of Unmaking	',76,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	false,	true,	true,	false,	false,	false,	false,	false),(
'Cold Dmg +%',	3, 7, '	of SNow	',12,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Cold Dmg +%',	8, 12, '	of Sleet	',24,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Cold Dmg +%',	13, 17, '	of Ice	',36,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Cold Dmg +%',	18, 22, '	of Rime	',50,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Cold Dmg +%',	23, 26, '	of Floe	',64,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Cold Dmg +%',	27, 30, '	of Glaciation	',76,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Fire Dmg +%',	3, 7, '	of Embers	',8,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Fire Dmg +%',	8, 12, '	of Coals	',22,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Fire Dmg +%',	13, 17, '	of Cinders	',36,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Fire Dmg +%',	18, 22, '	of Flames	',50,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Fire Dmg +%',	23, 26, '	of Immolation	',64,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Fire Dmg +%',	27, 30, '	of Ashes	',76,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Lightning Dmg +%',	3, 7, '	of Sparks	',10,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Lightning Dmg +%',	8, 12, '	of Static	',23,'Suffix',	true,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Lightning Dmg +%',	13, 17, '	of Electricity	',36,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Lightning Dmg +%',	18, 22, '	of Voltage	',50,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Lightning Dmg +%',	23, 26, '	of Discharge	',64,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Lightning Dmg +%',	27, 30, '	of Arcing	',76,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	true,	true,	false,	false,	false,	false,	false),(
'Charges Gained +%',	10, 20, '	of Refilling	',2,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Flask Charges Used +%',	-10,	-20,	'of Sipping	',3,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Flask Duration +%',	10, 20, '	of Savouring	',7,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Quantity +%',	4, 8, '	of Collecting	',2,'Suffix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Quantity +%',	9, 12, '	of Gathering	',32,'Suffix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Quantity +%',	13, 16, '	of Hoarding	',55,'Suffix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Quantity +%',	17, 20, '	of Amassment	',77,'Suffix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	6, 10, '	of Plunder	',3,'Suffix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	11, 14, '	of Raiding	',30,'Suffix',	true,	true,	false,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	15, 20, '	of Archaeology	',53,'Suffix',	true,	true,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Item Found Rarity +%',	21, 26, '	of Excavation	',75,'Suffix',	true,	true,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Life Gain Per Target',	2, 2, '	of Rejuvenation	',8,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Gain Per Target',	3, 3, '	of Restoration	',20,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Gain Per Target',	4, 4, '	of Regrowth	',30,'Suffix',	false,	true,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Gain Per Target',	5, 5, '	of Nourishment	',40,'Suffix',	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Gained On Enemy Death',	2, 4, '	of Success	',1,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Gained On Enemy Death',	5, 7, '	of Victory	',23,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Life Gained On Enemy Death',	8, 11, '	of Triumph	',40,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Life Regeneration Rate Per Second',	0.7, 1.1,'	of the Newt	',1,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Life Regeneration Rate Per Second',	1.6, 2.4,'	of the Lizard	',18,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Life Regeneration Rate Per Second',	2.2, 3.3,'	of the Starfish	',30,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Life Regeneration Rate Per Second',	2.9, 4.3,'	of the Hydra	',44,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Life Regeneration Rate Per Second',	3.6, 5.5,'	of the Troll	',59,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Life Regeneration Rate Per Second',	6, 7, '	of the Phoenix	',78,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Mana Gained On Enemy Death',	1, 1, '	of Absorption	',1,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Mana Gained On Enemy Death',	2, 3, '	of Osmosis	',24,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Mana Gained On Enemy Death',	4, 6, '	of Consumption	',40,'Suffix',	true,	true,	false,	false,	true,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Mana Regeneration Rate +%',	10, 19, '	of Excitement	',2,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Mana Regeneration Rate +%',	20, 29, '	of Joy	',18,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Mana Regeneration Rate +%',	30, 39, '	of Elation	',29,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Mana Regeneration Rate +%',	40, 49, '	of Bliss	',42,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Mana Regeneration Rate +%',	50, 59, '	of Euphoria	',55,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Mana Regeneration Rate +%',	60, 69, '	of Nirvana	',79,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true, 	false,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false),(
'Base Cold Dmg Resistance %',	6, 11, '	of the Inuit	',1,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Cold Dmg Resistance %',	12, 17, '	of the Seal	',14,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Cold Dmg Resistance %',	18, 23, '	of the Penguin	',26,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Cold Dmg Resistance %',	24, 29, '	of the Yeti	',38,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Cold Dmg Resistance %',	30, 35, '	of the Walrus	',50,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Cold Dmg Resistance %',	36, 41, '	of the Polar Bear	',60,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Cold Dmg Resistance %',	42, 45, '	of the Ice	',72,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	6, 11, '	of the Whelpling	',1,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	12, 17, '	of the Salamander	',12,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	18, 23, '	of the Drake	',24,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	24, 29, '	of the Kiln	',36,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	30, 35, '	of the Furnace	',48,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	36, 41, '	of the Volcano	',60,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Fire Dmg Resistance %',	42, 45, '	of the Magma	',72,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	6, 11, '	of the Cloud	',1,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	12, 17, '	of the Squall	',13,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	18, 23, '	of the Storm	',25,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	24, 29, '	of the Thunderhead	',37,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	30, 35, '	of the Tempest	',49,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	36, 41, '	of the Maelstrom	',60,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Lightning Dmg Resistance %',	42, 45, '	of the Lightning	',72,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Chaos Dmg Resistance %',	5, 10, '	of the Lost	',16,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Chaos Dmg Resistance %',	11, 15, '	of Banishment	',30,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Chaos Dmg Resistance %',	16, 20, '	of Eviction	',44,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Chaos Dmg Resistance %',	21, 25, '	of Expulsion	',56,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Chaos Dmg Resistance %',	26, 30, '	of Exile	',65,'Suffix',	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Resist All Elements %',	3, 5, '	of the Crystal	',12,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Resist All Elements %',	6, 8, '	of the Prism	',24,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Resist All Elements %',	9, 11, '	of the Kaleidoscope	',36,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Resist All Elements %',	12, 14, '	of Variegation	',48,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Resist All Elements %',	15, 16, '	of the Rainbow	',60,'Suffix',	true,	true,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Attribute Requirements -%',	18, 18, '	of the Worthy	',36,'Suffix',	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Attribute Requirements -%',	32, 32, '	of the Apt	',60,'Suffix',	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Local Additional Block Chance %',	1, 3, '	of Intercepting	',10,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Local Additional Block Chance %',	4, 6, '	of Walling	',58,'Suffix',	false,	false,	false,	false,	false,	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Stun Duration +%',	11, 15, '	of Impact	',5,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Stun Duration +%',	16, 20, '	of Dazing	',18,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Stun Duration +%',	21, 25, '	of Stunning	',30,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Stun Duration +%',	26, 30, '	of Slamming	',44,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Stun Duration +%',	31, 35, '	of Staggering	',58,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true,	true),(
'Base Stun Threshold Reduction +%',	5, 7, '	of the Pugilist	',5,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Base Stun Threshold Reduction +%',	8, 9, '	of the Brawler	',20,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Base Stun Threshold Reduction +%',	10, 11, '	of the Boxer	',30,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Base Stun Threshold Reduction +%',	12, 13, '	of the Combatant	',44,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Base Stun Threshold Reduction +%',	14, 15, '	of the Gladiator	',58,'Suffix',	false,	false,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	true,	true,	false,	true,	true,	true,	true),(
'Base Stun Recovery +%',	11, 13, '	of Thick Skin	',1,'Suffix',	false,	false,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Stun Recovery +%',	14, 16, '	of Stone Skin	',17,'Suffix',	false,	false,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Stun Recovery +%',	17, 19, '	of Iron Skin	',28,'Suffix',	false,	false,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Stun Recovery +%',	20, 22, '	of Steel Skin	',42,'Suffix',	false,	false,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Stun Recovery +%',	23, 25, '	of Adamantite Skin	',56,'Suffix',	false,	false,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false),(
'Base Stun Recovery +%',	26, 28, '	of Corundum Skin	',79,'Suffix',	false,	false,	true,	true,	true,	true,	true,	true,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false,	false);		


INSERT INTO bases(item_name,item_level,item_type,dex_req,str_req,int_req,item_image) VALUES
('Plate Vest',1,'armour',0,1,0,'Plate_vest.png'),
('Chest Plate',6,'armour',0,25,0,'Chest_plate.png'),
('Copper Plate',11,'armour',0,53,0,'Copper_plate.png'),
('War Plate',16,'armour',0,63,0,'War_plate.png'),
('Full Plate',21,'armour',0,81,0,'Full_plate.png'),
('Arena Plate',26,'armour',0,91,0,'Arena_plate.png'),
('Lordly Plate',31,'armour',0,99,0,'Lordly_plate.png'),

('Shabby Jerkin',1,'armour',1,0,0,'Shabby_Jerkin.png'),
('Strapper Leather',6,'armour',25,0,0,'Strapped_Leather.png'),
('Buckskin Tunic',11,'armour',53,0,0,'Buckskin_Tunic.png'),
('Wild Leather',16,'armour',63,0,0,'Wild_Leather.png'),
('Full Leather',21,'armour',81,0,0,'Full_Leather.png'),
('Sun Leather',26,'armour',91,0,0,'Sun_Leather.png'),
('Theifs Garb',31,'armour',99,0,0,'Thiefs_garb.png'),

('Simple Robe',1,'armour',0,0,1,'Simple_Robe.png'),
('Silken Vest',6,'armour',0,0,25,'Silken_Vest.png'),
('Scholars Robe',11,'armour',0,0,53,'Scholars_Robe.png'),
('Silken Robe',16,'armour',0,0,63,'Silken_Robe.png'),
('Mages Vestment',21,'armour',0,0,81,'Mages_Vestment.png'),
('Silk Robe',26,'armour',0,0,91,'Silk_Robe.png'),
('Cabalist Regalia',31,'armour',0,0,99,'Cabalist_Regalia.png'),

('Scale Vest',1,'armour',1,1,0,'Scale_Vest.png'),
('Light Brigadine',8,'armour',16,16,0,'Light_Brigadine.png'),
('Scale Doublet',17,'armour',28,28,0,'Scale_Doublet.png'),
('Infantry Brigadine',21,'armour',34,34,0,'Infantry Brigadine.png'),
('Full Scale Armour',28,'armour',43,43,0,'Full_Scale_Armour.png'),
('Soldiers Brigadine',32,'armour',48,48,0,'Soldiers_Brigadine.png'),
('Field Lamellar',35,'armour',53,53,0,'Field_Lamellar.png'),

('Chainmail Vest',1,'armour',0,1,1,'Chainmail_Vest.png'),
('Chainmail Tunic',6,'armour',0,16,16,'Chainmail_Tunic.png'),
('Ringmail Coat',11,'armour',0,28,28,'Ringmail_Coat.png'),
('Chainmail Doublet',16,'armour',0,34,34,'Chainmail_Doublet.png'),
('Full Ringmail',21,'armour',0,43,43,'Full_Ringmail.png'),
('Full Chainmail',26,'armour',0,48,48,'Full_Chainmail.png'),
('Holy Chainmail',31,'armour',0,53,53,'Holy_Chainmail.png'),

('Padded Vest',1,'armour',1,0,1,'Padded_Vest.png'),
('Oiled Vest',6,'armour',17,0,17,'Oiled_Vest.png'),
('Padded Jacket',11,'armour',30,0,30,'Padded_Jacket.png'),
('Oiled Coat',16,'armour',35,0,35,'Oiled_Coat.png'),
('Scarlet Rainment',21,'armour',43,0,43,'Scarlet_Rainment.png'),
('Waxed Garb',26,'armour',45,0,45,'Waxed_Garb.png'),
('Bone Armour',31,'armour',53,0,53,'Bone_Armour.png'),

('Sacrificial Garb',72,'armour',66,66,66,'Sacrifical_Garb.png');