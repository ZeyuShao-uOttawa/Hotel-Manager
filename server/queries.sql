-- searching by city
SELECT * FROM hotel WHERE address LIKE '%Montreal%' OR address LIKE '%Ottawa%';


-- important details about ONLY hotel chains
SELECT HC_id, address, email, phone FROM hotel_chain

-- important details about ONLY hotel
SELECT hc_id, hotel_id, rating, address, email, phone FROM hotel

-- surface details of room
SELECT price, capacity, room.hotel_id, hotel.address
FROM room 
INNER JOIN hotel ON hotel.hotel_id = room.hotel_id
WHERE (NOT is_rented);

-- join hotel chain id, HC address, hotel id, hotel address
SELECT  hotel_chain.HC_id, hotel_chain.address, hotel.hotel_id, hotel.address
FROM hotel
INNER JOIN hotel_chain ON hotel.HC_id = hotel_chain.HC_id;

-- retrieve all rooms that can be extended
SELECT room_id
FROM room
WHERE can_be_extended;

-- Retrieve all rooms and their booking history
SELECT room.room_id, booking.date, customer.name
FROM room
LEFT JOIN booking ON room.room_id = booking.room_id
LEFT JOIN customer ON booking.SSN = customer.SSN;

--customer can view their bookings
SELECT booking.booking_id, customer.name
FROM booking
LEFT JOIN customer ON booking.SSN = customer.SSN;

--retrieve all rooms and their amenities
SELECT room.room_id, amenity.amenity_name
FROM room
INNER JOIN room_amenity ON room.room_id = room_amenity.room_id
INNER JOIN amenity ON room_amenity.amenity_id = amenity.amenity_id;

--Retrieve all customers who have rented a room
SELECT customer.name, renting.renting_id
FROM customer
INNER JOIN renting ON customer.SSN = renting.SSN;

