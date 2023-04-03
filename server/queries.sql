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