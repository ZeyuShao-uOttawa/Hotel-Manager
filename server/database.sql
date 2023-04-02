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


-- Insert Data
INSERT INTO hotel_chain(HC_id,address,num_hotels,email,phone) VALUES (001,'768 Carling Avenue',8,'001carling@gmail.com',6133341575);
INSERT INTO hotel_chain(HC_id,address,num_hotels,email,phone) VALUES (002,'2629 Yonge Street',10,'002yonge@gmail.com',4163196792);
INSERT INTO hotel_chain(HC_id,address,num_hotels,email,phone) VALUES (003,'3833 Glover Road',8,'003glover@gmail.com',6045745369);
INSERT INTO hotel_chain(HC_id,address,num_hotels,email,phone) VALUES (004,'281 MacLaren Street',8,'004maclaren@gmail.com',6139925365);
INSERT INTO hotel_chain(HC_id,address,num_hotels,email,phone) VALUES (005,'1486 Bayfield St',8,'005bayfield@gmail.com',7057941622);
 
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (001,4,284,'471 Ross Street','001ross@gmail.com',6135398729,001,381947194);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (002,3,392,'2280 Ross Terrasse','002ross@gmail.com',6042972840,001,283710389);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (003,1,192,'957 Eglinton Avenue','003eglinton@gmail.com',9059736472,001,294892738);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (004,5,383,'919 Main St','004main@gmail.com',6135397292,001,173950392);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (005,4,482,'3988 rue Levy','005rue@gmail.com',5195623719,001,739281674);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (006,2,192,'2324 Weir Crescent','006weir@gmail.com',4182548077,001,209193729);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (007,4,302,'4802 Baker Street','007baker@gmail.com',4164899590,001,739274927);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (008,2,262,'476 Ross Street','008ross@gmail.com',4166189016,001,483928492);
 
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (009,5,442,'1630 Holdom Avenue','009holdom@gmail.com',6045866171,002,289403892);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (010,3,880,'3241 Island Hwy','010island@gmail.com',2503326053,002,765432189);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (011,2,307,'3688 Victoria Park Ave','011victoria@gmail.com',4167554811,002,127563249);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (012,1,862,'3568 MacLaren Street','012maclaren@gmail.com',6138801358,002,954872634);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (013,5,776,'970 Cork St','013cork@gmail.com',5198365078,002,631784956);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (014,4,67,'594 Tycos Dr','013tycos@gmail.com',4169319518,002,841967328);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (015,5,846,'1080 Hamilton Street','014hamilton@gmail.com',3063780357,002,192635847);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (016,3,433,'1022 A Avenue','016a@gmail.com',7804958494,002,526374981);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (017,2,555,'717 Kennedy Rd','017kennedy@gmail.com',5148856426,002,328745169);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (018,1,221,'1100 Burdett Avenue','018burdett@gmail.com',7053132184,002,954872634);
 
 
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (019, 5, 307, '4 Tchesinkut Lake Rd', '019tchesinkut@gmail.com', 2508472434, 003, 975823456);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (020, 3, 482, '4856 11th Ave', '02011@gmail.com', 4032051243, 003, 123456789);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (021, 2, 125, '742 Islington Ave', '021islington@gmail.com', 4165229455, 003, 867530901);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (022, 1, 87, '3668 Toy Avenue', '022toy@gmail.com', 9028431973, 003, 987654321);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (023, 4, 212, '447 Granville St', '023granville@gmail.com', 9054497141, 003, 642857643);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (024, 2, 463, '4463 Keith Road', '024keith@gmail.com', 3649820436, 003, 561987423);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (025, 5, 144, '3250 Islington Ave', '025islington@gmail.com', 4165032867, 003, 739586124);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (026, 3, 298, '2711 Port Washington Road', '026port@gmail.com', 4036872458, 003, 489632175);
 
 
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (027, 2, 788, '4443 Rene-Levesque Blvd', '027rene@gmail.com', 5145811948, 004, 198567432);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (028, 5, 421, '2400 St Jean Baptiste St', '028stjean@gmail.com', 8198550613, 004, 841279856);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (029, 1, 564, '903 James Street', '029james@gmail.com', 6048566219, 004, 523987410);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (030, 4, 771, '3483 avenue Royale', '030avenue@gmail.com', 4962613196, 004, 710243689);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (031, 3, 345, '2351 Yoho Valley Road', '031yoho@gmail.com', 6304396363, 004, 627410395);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (032, 2, 922, '4529 Brew Creek Rd', '032brew@gmail.com', 2509691428, 004, 184726503);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (033, 5, 520, '1877 Central Pkwy', '033central@gmail.com', 9056092096, 004, 563890124);
INSERT INTO hotel(hotel_id,rating,num_rooms,address,email,phone,HC_id,manager_SSN) VALUES (034, 1, 902, '3650 Derry Rd', '034derry@gmail.com', 9868914798, 004, 290183765);
 
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES (035, 2, 974, '2764 Lauzon Parkway', '034lauzon@gmail.com', 5199806515, 005, 318495672);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES (036, 5, 491, '224 102nd Avenue', '035102@gmail.com', 2507874373, 005, 786219045);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES (037, 4, 562, '1983 Derry Rd', '036derry@gmail.com', 6049045388, 005, 957468123);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES(038, 1, 621, '3481 Keith Road', '037keith@gmail.com', 4505501998, 005, 542378619);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES(039, 3, 321, '2106 chemin du Lac', '038chemin@gmail.com', 5149057575, 005, 174836295);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES(040, 5, 731, '3808 Ste. Catherine Ouest', '039catherine@gmail.com', 4169663340, 005, 619287345);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES(041, 2, 654, '3443 Yonge Street', '040yonge@gmail.com', 2503189829, 005, 329856417);
INSERT INTO hotel(hotel_id, rating, num_rooms, address, email, phone, HC_id, manager_SSN) VALUES(042, 5, 251, '1554 McGill Road', '041mcgill@gmail.com', 5145784133, 005, 736492581);

