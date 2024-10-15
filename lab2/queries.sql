-- 3
SELECT *
FROM vehicle
ORDER BY hour_rent_price;

-- 4
SELECT client_id
FROM rent
WHERE
    (start_date >= '2023-01-22 00:00:00' AND end_date <= '2023-01-30 23:59:59')
GROUP BY client_id
ORDER BY client_id;
-- 4 alt
SELECT *
FROM client
WHERE
    id IN
    (SELECT rent.client_id FROM rent WHERE (start_date >= '2023-01-22 00:00:00' AND end_date <= '2023-01-30 23:59:59'));

-- 5
SELECT *
FROM vehicle
WHERE
      hour_rent_price >= 20::MONEY
  AND hour_rent_price < 30::MONEY;

-- 6
SELECT client_id, SUM(total_cost) AS total_rent_cost
FROM rent client_id
GROUP BY client_id
ORDER BY client_id;

SELECT *
FROM client;

-- 7
-- Никак без JOIN
SELECT v.type, COUNT(r.id) AS rented_count
FROM vehicle v
         JOIN rent r ON v.id = r.vehicle_id
GROUP BY v.type;

-- 8
SELECT client_id, SUM(total_cost) AS total_rent_cost
FROM rent
GROUP BY client_id
HAVING
    SUM(total_cost) > 1300::MONEY;


-- 9
SELECT *
FROM vehicle;
UPDATE vehicle
SET hour_rent_price = 22::MONEY
WHERE
    type = 'Bike';

UPDATE vehicle
SET hour_rent_price = 15::MONEY
WHERE
    brand = 'Yamaha';
UPDATE vehicle
SET hour_rent_price = 18::MONEY
WHERE
    brand = 'Kawasaki';

-- 10
DELETE
FROM rent
WHERE
    affirmation_date < CURRENT_DATE - INTERVAL '1 year';

-- 11
SELECT *
FROM rent
WHERE
    vehicle_id IN (SELECT id FROM vehicle WHERE type = 'Car');

-- 12
SELECT *
FROM rent
LIMIT 5 OFFSET 23;

-- 13
SELECT type, AVG(hour_rent_price) AS average_rent_price
FROM vehicle
GROUP BY type;

-- 14
SELECT *
FROM rent
ORDER BY affirmation_date;

-- 15
SELECT *
FROM client
WHERE
    id IN (SELECT client_id
           FROM rent
           GROUP BY client_id
           ORDER BY COUNT(id) DESC);
-- to check 15
SELECT r.client_id,
       COUNT(r.id) AS rental_count
FROM rent r
GROUP BY r.client_id
ORDER BY rental_count DESC;