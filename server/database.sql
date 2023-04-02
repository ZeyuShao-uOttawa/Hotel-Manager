-- Create Datebase
CREATE DATABASE hotel_management;


-- Create Tables
CREATE TABLE hotel_chain(
  HC_id VARCHAR(30) NOT NULL,
  address VARCHAR(150) NOT NULL,
  num_hotels INT NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone NUMERIC(10) NOT NULL,
  PRIMARY KEY (HC_id)
);
 
CREATE TABLE hotel(
  hotel_id VARCHAR(30) NOT NULL,
  rating NUMERIC(3,2) NOT NULL CHECK (rating >= 0 AND rating <=5),
  num_rooms INT NOT NULL,
  address VARCHAR(150) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone NUMERIC(10) NOT NULL,
  HC_id VARCHAR(30) NOT NULL,
  manager_SSN NUMERIC(9) NOT NULL,
  PRIMARY KEY (hotel_id),
  FOREIGN KEY (HC_id) REFERENCES hotel_chain(HC_id)
    ON DELETE CASCADE
);
 
CREATE TABLE employee(
  name VARCHAR(50) NOT NULL,
  address VARCHAR(150) NOT NULL,
  SSN NUMERIC(9) NOT NULL,
  role_pos VARCHAR(100),
  hotel_id VARCHAR(30),
  PRIMARY KEY(SSN),
  FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
    ON DELETE SET NULL
);
 
CREATE TABLE room(
  room_id VARCHAR(30) NOT NULL,
  room_num VARCHAR(10) NOT NULL,
  price NUMERIC(10,2) NOT NULL,
  capacity INT NOT NULL,
  outside_view VARCHAR(100),
  can_be_extended BOOLEAN NOT NULL,
  has_damage BOOLEAN NOT NULL,
  is_rented BOOLEAN NOT NULL,
  hotel_id VARCHAR(30) NOT NULL,
  PRIMARY KEY (room_id),
  FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
    ON DELETE CASCADE
);
 
CREATE TABLE amenity(
  amenity_id VARCHAR(30) NOT NULL,
  amenity_name VARCHAR(100) NOT NULL,
  PRIMARY KEY(amenity_id)
);
 
CREATE TABLE room_amenity(
  room_id VARCHAR(30) NOT NULL,
  amenity_id VARCHAR(30) NOT NULL,
  PRIMARY KEY (room_id, amenity_id),
  FOREIGN KEY (room_id) REFERENCES room(room_id)
    ON DELETE CASCADE,
  FOREIGN KEY (amenity_id) REFERENCES amenity(amenity_id)
    ON DELETE CASCADE
);
 
CREATE TABLE customer(
  name VARCHAR(50) NOT NULL,
  address VARCHAR(150) NOT NULL,
  SSN NUMERIC(9) NOT NULL,
  reg_date DATE NOT NULL,
  PRIMARY KEY(SSN)
);
 
 
CREATE TABLE booking(
  booking_id VARCHAR(30) NOT NULL,
  date DATE NOT NULL,
  room_id VARCHAR(30) NOT NULL,
  SSN NUMERIC(9) NOT NULL,
  PRIMARY KEY (booking_id),
  FOREIGN KEY (room_id) REFERENCES room(room_id)
    ON DELETE CASCADE,
  FOREIGN KEY (SSN) REFERENCES customer(SSN)
    ON DELETE SET NULL
);
 
CREATE TABLE rentings(
  renting_id VARCHAR(30) NOT NULL,
  date DATE NOT NULL,
  booking_id VARCHAR(30),
  room_id VARCHAR(30) NOT NULL,
  SSN NUMERIC(9) NOT NULL,
  PRIMARY KEY (renting_id),
  FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
    ON DELETE SET NULL,
  FOREIGN KEY (room_id) REFERENCES room(room_id)
    ON DELETE CASCADE,
  FOREIGN KEY (SSN) REFERENCES customer(SSN)
    ON DELETE SET NULL
);


-- inserting hotel chain
INSERT INTO hotel_chain VALUES (1,  '768 Carling Avenue, Montreal', 	8,  	'001carling@gmail.com',   6133341575);
INSERT INTO hotel_chain VALUES (2,  '2629 Yonge Street, Ottawa',    	8,  	'002yonge@gmail.com',     4163196792);
INSERT INTO hotel_chain VALUES (3,  '3833 Glover Road, Toronto',   	8,  	'003glover@gmail.com',    6045745369);
INSERT INTO hotel_chain VALUES (4,  '281 MacLaren Street, Calgary',	8,  	'004maclaren@gmail.com',  6139925365);
INSERT INTO hotel_chain VALUES (5,  '1486 Bayfield St, Vancouver',  	8, 	'005bayfield@gmail.com',  7057941622);
-- inserting hotels
INSERT INTO hotel VALUES (1, 1,	5,	'10 Ross St, Montreal',		'001ross@gmail.com',	6135398729,	1,	381947194);
INSERT INTO hotel VALUES (2, 2, 5,	'20 Main St, Montreal',		'002main@gmail.com',	6042972840,	1,	283710389);
INSERT INTO hotel VALUES (3, 3, 5,	'30 Elgin Ave, Sherbrooke', 	'003eglgin@gmail.com',  905973-6472,	1,	294892738);
INSERT INTO hotel VALUES (4, 4, 5,	'40 Main St, Sherbrooke',	'004main@gmail.com',  	6135397292,	1,	173950392);
INSERT INTO hotel VALUES (5, 5, 5,	'50 Rue Levy, Quebec',		'005rue@gmail.com',   	5195623719,	1,	739281674);
INSERT INTO hotel VALUES (6, 1, 5,	'60 Weir Crescent, Quebec',	'006weir@gmail.com',  	4182548077,	1,	209193729);
INSERT INTO hotel VALUES (7, 3, 5,	'70 Baker St, Laval',		'007baker@gmail.com', 	4164899590,	1,	739274927);
INSERT INTO hotel VALUES (8, 5, 5,	'80 Ross St, Laval',		'008ross@gmail.com',	4166189016,	1,	483928492);

INSERT INTO hotel VALUES (9, 1, 5,	'10 Holdom Ave, Ottawa',	'009holdom@gmail.com',  6045866171,	2,	289403892);
INSERT INTO hotel VALUES (10, 2, 5,	'20 Island Hwy, Ottawa',	'010island@gmail.com', 	2503326053,	2,	765432189);
INSERT INTO hotel VALUES (11, 3, 5,	'30 Victor Ave, Ottawa',	'011victor@gmail.com', 	4167554811,	2,	127563249);
INSERT INTO hotel VALUES (12, 4, 5,	'40 Laren St, Ottawa',		'012laren@gmail.com', 	6138801358,	2,	954872634);
INSERT INTO hotel VALUES (13, 5, 5,	'50 Cork St, Gatineau',		'013cork@gmail.com', 	5198365078,	2,	631784956);
INSERT INTO hotel VALUES (14, 1, 5,	'60 Tycos Dr, Gatineau',	'013tycos@gmail.com', 	4169319518,	2,	841967328);
INSERT INTO hotel VALUES (15, 3, 5,	'70 Ham St, Gatineau',		'014ham@gmail.com',   	3063780357,	2,	192635847);
INSERT INTO hotel VALUES (16, 5, 5,	'80 Lept Ave, Gatineau',	'016lept@gmail.com',  	7804958494,	2,	526374981);

INSERT INTO hotel VALUES (17, 1, 5,	'10 Prisk Rd, Toronto', 	'017prisk@gmail.com', 	2508472434, 	3, 	975823456);
INSERT INTO hotel VALUES (18, 2, 5,	'20 11th Ave, Toronto', 	'01811@gmail.com', 	4032051243, 	3, 	123456789);
INSERT INTO hotel VALUES (19, 3, 5,	'30 Clay Ave, Brampton', 	'019clay@gmail.com',  	4165229455,	3, 	867530901);
INSERT INTO hotel VALUES (20, 4, 5,	'40 Toy Ave, Brampton', 	'020toy@gmail.com',   	9028431973, 	3, 	987654321);
INSERT INTO hotel VALUES (21, 5, 5,	'50 Grey St, Hamilton', 	'021grey@gmail.com',  	9054497141, 	3, 	642857643);
INSERT INTO hotel VALUES (22, 1, 5,	'60 Keith Rd, Hamilton', 	'022keith@gmail.com', 	3649820436, 	3, 	561987423);
INSERT INTO hotel VALUES (23, 3, 5,	'70 Kyle Ave, Mississauga',	'023kyle@gmail.com',  	4165032867, 	3, 	739586124);
INSERT INTO hotel VALUES (24, 5, 5,	'80 Port Rd, Mississauga', 	'024port@gmail.com',  	4036872458, 	3, 	489632175);

INSERT INTO hotel VALUES (25, 1, 5,	'10 Brim Blvd, Calgary', 	'025brim@gmail.com',   	5145811948, 	4, 	198567432);
INSERT INTO hotel VALUES (26, 2, 5,	'20 Crane St, Calgary', 	'026crane@gmail.com', 	8198550613, 	4, 	841279856);
INSERT INTO hotel VALUES (27, 3, 5,	'30 James St, Calgary', 	'027james@gmail.com', 	6048566219, 	4, 	523987410);
INSERT INTO hotel VALUES (28, 4, 5,	'40 Royale Ave, Calgary',   	'028royale@gmail.com', 	4962613196, 	4, 	710243689);
INSERT INTO hotel VALUES (29, 5, 5,	'50 Yoho Valley Rd, Edmonton',  '029yoho@gmail.com',  	6304396363, 	4, 	627410395);
INSERT INTO hotel VALUES (30, 1, 5,	'60 Brew Creek Rd, Edmonton', 	'030brew@gmail.com', 	2509691428, 	4, 	184726503);
INSERT INTO hotel VALUES (31, 3, 5,	'70 Central Pkwy, Edmonton', 	'031central@gmail.com',	9056092096, 	4, 	563890124);
INSERT INTO hotel VALUES (32, 5, 5,	'80 Derry Rd, Edmonton', 	'032derry@gmail.com',  9868914798, 	4, 	290183765);

INSERT INTO hotel VALUES (33, 1, 5,	'10 Lauzon Pkwy, Vancouver', 	'033lauzon@gmail.com', 	5199806515, 	5, 	318495672);
INSERT INTO hotel VALUES (34, 2, 5,	'20 102nd Ave, Vancouver',	'034102@gmail.com', 	2507874373, 	5, 	786219045);
INSERT INTO hotel VALUES (35, 3, 5,	'30 Derry Rd, Burnaby', 	'035derry@gmail.com', 	6049045388, 	5, 	957468123);
INSERT INTO hotel VALUES (36, 4, 5,	'40 Keith Rd, Burnaby', 	'036keith@gmail.com', 	4505501998, 	5, 	542378619);
INSERT INTO hotel VALUES (37, 5, 5,	'50 Chemin du Lac, Victoria', 	'037chemin@gmail.com', 	5149057575, 	5, 	174836295);
INSERT INTO hotel VALUES (38, 1, 5,	'60 Tray, Victoria', 		'038tray@gmail.com', 	4169663340, 	5, 	619287345);
INSERT INTO hotel VALUES (39, 3, 5,	'70 Yonge St, Richmond',	'039yonge@gmail.com', 	2503189829, 	5, 	329856417);
INSERT INTO hotel VALUES (40, 5, 5,	'80 McGill Rd, Richmond', 	'040mcgill@gmail.com', 	5145784133, 	5,	736492581);

-- inserting amenities
INSERT INTO amenity VALUES (1, 'Free Wi-Fi');
INSERT INTO amenity VALUES (2, 'Swimming pool');
INSERT INTO amenity VALUES (3, 'Fitness center');
INSERT INTO amenity VALUES (4, 'Breakfast included');
INSERT INTO amenity VALUES (5, 'Room service');
INSERT INTO amenity VALUES (6, 'Spa');

-- inserting rooms
DO $$
DECLARE
	roomId INTEGER := 5;
	hotelId INTEGER := 2;

BEGIN
	INSERT INTO room (room_id, room_num, price, capacity, outside_view, can_be_extended, has_damage, is_rented, hotel_id)
	VALUES	(1, 1, 200, 'single', 'mountain view', true, false, false, 1),
			(2, 2, 300, 'double', 'bay view', false, false, false, 1),
			(3, 3, 400, 'studio', 'city view', true, false, false, 1),
			(4, 4, 500, 'deluxe', 'mountain view', false, false, false, 1),
			(5, 5, 600, 'suites', 'bay view', true, false, false, 1);
      
	WHILE (roomId <= 200 AND hotelId<= 40) LOOP
		INSERT INTO room (room_id, room_num, price, capacity, outside_view, can_be_extended, has_damage, is_rented, hotel_id)
		VALUES(roomId+1,
			   roomId%5+1,
			   (roomId%5+2)*100, 
			   
			   CASE
			   WHEN roomId%5=0 THEN 'suites'
			   WHEN roomId%5=1 THEN 'deluxe'
			   WHEN roomId%5=2 THEN 'studio'
			   WHEN roomId%5=3 THEN 'double'
			   WHEN roomId%5=4 THEN 'single'
			   ELSE 'single'
			   END,

			   CASE
			   WHEN roomId%3=0 THEN 'mountain view'
			   WHEN roomId%3=1 THEN 'bay view'
			   WHEN roomId%3=2 THEN 'city view'
			   ELSE 'city view'
			   END,
			   
			   roomId%2=0,
			   false,
			   false,
			   hotelId
			  );
			roomId := roomId + 1;
			IF (roomId%5=0) THEN hotelId := hotelId + 1;
			END IF;
	  END LOOP;
END $$;