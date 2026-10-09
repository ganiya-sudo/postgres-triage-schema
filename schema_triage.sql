-- =========================================================================
-- STEP 1: INFRASTRUCTURE CORE LAYOUT (Postgres & Standard SQL Table Creation)
-- =========================================================================
DROP TABLE IF EXISTS rental_locations;
DROP TABLE IF EXISTS customer_rentals;

CREATE TABLE customer_rentals (
    rental_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    movie_title VARCHAR(150),
    rental_rate DECIMAL(4,2),
    status VARCHAR(50),
    days_overdue INT
);

CREATE TABLE rental_locations (
    rental_id INT,
    store_city VARCHAR(100)
);

-- =========================================================================
-- STEP 2: DATA LOADING LAYER (Standard SQL Data Influx Insertion Strings)
-- =========================================================================
INSERT INTO customer_rentals (rental_id, customer_name, movie_title, rental_rate, status, days_overdue) VALUES
(101, 'Ganiya Ibrahim', 'Chamber Italian', 4.99, 'Returned', 0),
(102, 'Alex Analyst', 'Academy Dinosaur', 0.99, 'Overdue', 5),
(103, 'Paul Ibeabuchi', 'Ace Goldfinger', 4.99, 'Active', 0),
(104, 'Deji Ibrahim', 'Adaptation Holes', 2.99, 'Overdue', 2),
(105, 'Amigo Code', 'Affair Prejudice', 2.99, 'Returned', 0);

INSERT INTO rental_locations (rental_id, store_city) VALUES
(101, 'Lagos'),
(102, 'London'),
(103, 'Manchester'),
(104, 'New York'),
(105, 'Chicago');

-- =========================================================================
-- STEP 3: TRIAGE QUERY LAYER A (Standard SQL Multi-Condition Filtering)
-- =========================================================================
SELECT * FROM customer_rentals
WHERE rental_rate > 2.00 AND status = 'Overdue';

-- =========================================================================
-- STEP 4: TRIAGE QUERY LAYER B (Standard SQL Cross-Table Relational INNER JOIN)
-- =========================================================================
SELECT cr.customer_name, cr.movie_title, loc.store_city
FROM customer_rentals AS cr
INNER JOIN rental_locations AS loc ON cr.rental_id = loc.rental_id;

-- =========================================================================
-- STEP 5: BOSS LEVEL OPERATIONAL FILTER (Postgres-Exclusive RETURNING Clause)
-- This specific execution string drops a syntax error inside a MySQL engine.
-- =========================================================================
INSERT INTO customer_rentals (rental_id, customer_name, movie_title, rental_rate, status, days_overdue) 
VALUES (106, 'Supabase Recruiter', 'The Impossible Support Engineer', 4.99, 'Active', 0)
RETURNING customer_name, movie_title, status;
