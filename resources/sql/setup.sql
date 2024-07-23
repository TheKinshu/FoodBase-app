-- Table for categories
CREATE TABLE categories
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Modified table for food products to include category_id
CREATE TABLE food_products
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories (id)
);

-- Table for stores
CREATE TABLE stores
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Junction table for product prices at different stores
CREATE TABLE products
(
    id                 SERIAL         PRIMARY KEY,
    name               VARCHAR(255)   NOT NULL,
    store_id           INT            NOT NULL,
    category_id        INT            NOT NULL,
    price              DECIMAL(10, 2) NOT NULL,
    price_last_updated TIMESTAMP      NOT NULL,
    amount             VARCHAR(255)   NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores (id),
    FOREIGN KEY (category_id) REFERENCES categories (id)
);


INSERT INTO categories (name)
VALUES ('Produce'),
       ('Animal Proteins'),
       ('Bakery'),
       ('Frozen'),
       ('Canned/Jarred Goods'),
       ('Beverages'),
       ('Alcohol'),
       ('Snacks'),
       ('Condiments & Sauces'),
       ('Health and Wellness'),
       ('Sundries'),
       ('Personal Care'),
       ('Pet Care'),
       ('Baby Care'),
       ('Dry Goods'),
       ('Oil & Vinegar'),
       ('Dairy'),
       ('Other');

INSERT INTO stores (name, location)
VALUES ('Rexall', 'Newmarket'),
       ('Costco', 'Newmarket'),
       ('Walmart', 'Newmarket'),
       ('Metro', 'Newmarket'),
       ('Sobeys', 'Newmarket'),
       ('No Frills', 'Newmarket'),
       ('FreshCo', 'Newmarket'),
       ('Food Basics', 'Newmarket'),
       ('Shoppers Drug Mart', 'Newmarket'),
       ('Superstore', 'Newmarket'),
       ('T&T Supermarket', 'Aurora'),
       ('Ranch Fresh', 'Aurora'),
       ('Loblaws', 'Aurora'),
       ('Farm Boy', 'Newmarket'),
       ('Centra', 'Aurora'),
       ('H Mart', 'Richmond Hill'),
       ('Nature''s Emporium', 'Newmarket');



-- product_name	price	amount	store
-- Greenfield bacon 	$16.49	1,125 g	Costco
-- chicken drumsticks	$7.49	7.49 kg	Costco
-- KS marble cheddar 	$14.99	1.15kg	Costco
-- ks low salt bacon	$18.99	2000g	Costco
-- ks bacon	$18.99	2000g	Costco
-- tostitos rounds	$7.49	826g	Costco
-- short cabbage	$0.98	1lb	Ranch Fresh
-- asian pear	$1.99	1lb	Ranch Fresh
-- apple	$1.59	1lb	Ranch Fresh
-- garlic	$4.99	1 kg	Ranch Fresh
-- onion	$1.99	2 lb	Ranch Fresh
-- green onion	$1.99	2 stalk	Ranch Fresh
-- chives 	$3.99	1lb	Ranch Fresh
-- ginger	$2.99	1lb	Ranch Fresh
-- gochugaru	$6.99	453g	Ranch Fresh
-- diakon radish	$0.99	1lb	Ranch Fresh
-- kombu	$2.79	57g	Ranch Fresh
-- anchovy sauce			Costco
-- glutinous rice flowerr			Costco
-- plum cheong			Costco
-- msg	$3.59	1lb	Ranch Fresh
-- beef eye round	$4.99	1lb	NoFrills
-- villageo classico	$4.29	675g	NoFrills
-- tortillas whole wheat dempster	$4.79	610g	NoFrills
-- large egg	$6.69	18 eggs 	NoFrills
-- no name cheese	$5.99	400g	NoFrills
-- no name cheese 	$9.99	700g	NoFrills
-- Armstrong cheese 	$7.79	400g	NoFrills
-- Pc cheese 	$6.49	400g	NoFrills
-- saputo mozz	$9.49	500g	NoFrills
-- tazo ice passion 	$8.49	946ml	NoFrills
-- tazo Chai latte	$8.99	946ml	NoFrills
-- RH Flour All Purpose	$16.99	10kg	NoFrills
-- hashbrown	$10.00	2.25kg	NoFrills
-- milk 2% neilson	$5.89	4l	NoFrills
-- villaggio whole wheat 	$5.49	2*675g	Costco
-- tortillas whole wheat dempster	$5.99	915g	Costco
-- Dempster whole wheat	$6.99	3*675g	Costco
-- brioche buns	$5.99	1.15kg	Costco
-- milk  2% Beatrice 	$5.59	4l	Costco
-- pork belly	$6.99	1lb	Ranch Fresh
-- milkis	$4.99	1.5l	Costco

INSERT INTO products (name, store_id, category_id, price, price_last_updated, amount)
VALUES ('Greenfield Bacon', 2, 2, 16.49, '2024-02-12', '1,125 g'),
       ('Chicken Drumsticks', 2, 2, 7.49, '2024-02-12', '7.49 kg'),
       ('KS Marble Cheddar', 2, 17, 14.99, '2024-02-12', '1.15kg'),
       ('KS Low Salt Bacon', 2, 2, 18.99, '2024-02-12', '2000g'),
       ('KS Bacon', 2, 2, 18.99, '2024-02-12', '2000g'),
       ('Tostitos Rounds', 2, 8, 7.49, '2024-02-12', '826g'),
       ('Short Cabbage', 12, 1, 0.98, '2024-02-17', '1lb'),
       ('Asian Pear', 12, 1, 1.99, '2024-02-17', '1lb'),
       ('Apple', 12, 1, 1.59, '2024-02-17', '1lb'),
       ('Garlic', 12, 1, 4.99, '2024-02-17', '1 kg'),
       ('Onion', 12, 1, 1.99, '2024-02-17', '2 lb'),
       ('Green Onion', 12, 1, 1.99, '2024-02-17', '2 stalk'),
       ('Chives', 12, 1, 3.99, '2024-02-17', '1lb'),
       ('Ginger', 12, 1, 2.99, '2024-02-17', '1lb'),
       ('Gochugaru', 12, 1, 6.99, '2024-02-17', '453g'),
       ('Diakon Radish', 12, 1, 0.99, '2024-02-17', '1lb'),
       ('Kombu', 12, 1, 2.79, '2024-02-17', '57g'),
       ('MSG', 12, 1, 3.59, '2024-02-17', '1lb'),
       ('Beef Eye Round', 6, 2, 4.99, '2024-02-24', '1lb'),
       ('Villageo Classico', 6, 8, 4.29, '2024-02-24', '675g'),
       ('Tortillas Whole Wheat Dempster', 6, 3, 4.79, '2024-02-24', '610g'),
       ('Large Egg', 6, 2, 6.69, '2024-02-24', '18 eggs'),
       ('No Name Cheese', 6, 17, 5.99, '2024-02-24', '400g'),
       ('Armstrong Cheese', 6, 17, 7.79, '2024-02-24', '400g'),
       ('PC Cheese', 6, 17, 6.49, '2024-02-24', '400g'),
       ('Saputo Mozzarella', 6, 17, 9.49, '2024-02-24', '500g'),
       ('Tazo Ice Passion', 6, 6, 8.49, '2024-02-24', '946ml'),
       ('Tazo Chai Latte', 6, 6, 8.99, '2024-02-24', '946ml'),
       ('RH Flour All Purpose', 6, 15, 16.99, '2024-02-24', '10kg'),
       ('Hashbrown', 6, 4, 10.00, '2024-02-24', '2.25kg'),
       ('Milk 2% Neilson', 6, 17, 5.89, '2024-02-24', '4l'),
       ('Villaggio Whole Wheat', 2, 3, 5.49, '2024-02-24', '2*675g'),
       ('Dempster Whole Wheat', 2, 3, 6.99, '2024-02-24', '3*675g'),
       ('Brioche Buns', 2, 3, 5.99, '2024-02-24', '1.15kg'),
       ('Milk 2% Beatrice', 2, 17, 5.59, '2024-02-24', '4l'),
       ('Pork Belly', 12, 2, 6.99, '2024-04-07', '1lb'),
       ('Milkis', 12, 6, 4.99, '2024-04-07', '1.5l');
