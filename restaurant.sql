PRAGMA foreign_keys = ON;

CREATE TABLE restaurant (
	restaurant_id INTEGER NOT NULL PRIMARY KEY,
  	restaurant_name TEXT,
  	imagelink TEXT
);

CREATE TABLE menu (
	menu_id INTEGER NOT NULL PRIMARY KEY,
  	menu_title TEXT,
  	restaurant_id INTEGER NOT NULL,
  	FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

CREATE TABLE menuItem (
	menuItem_id INTEGER NOT NULL PRIMARY KEY,
  	menuItem_name TEXT,
  	menuItem_price INTEGER,
  	menu_id INTEGER NOT NULL,
  	FOREIGN KEY (menu_id) REFERENCES menu(menu_id)
);




-------



--create

INSERT INTO restaurant VALUES (1, "Maccies", "maccies.png");
INSERT INTO menu VALUES (1, "Breakfast", 1);
INSERT INTO menuItem VALUES (1, "Sausage McMuffin", 3.00, 1);
INSERT INTO menuItem VALUES (2, "Egg McMuffin", 2.50, 1);
INSERT INTO menuItem VALUES (3, "Pancakes", 3.00, 1);

INSERT INTO restaurant VALUES (2, "Burger King", "burgerking.png");
INSERT INTO menu VALUES (2, "Lunch", 2);
INSERT INTO menuItem VALUES (4, "Whopper", 4.50, 2);
INSERT INTO menuItem VALUES (5, "Double Whopper", 5.50, 2);
INSERT INTO menuItem VALUES (6, "Bacon Cheeseburger", 3.50, 2);
INSERT INTO menu VALUES (3, "Kids Menu", 2);
INSERT INTO menuItem VALUES (7, "Mini Whopper", 2.50, 3);
INSERT INTO menuItem VALUES (8, "Mini Double Whopper", 3.50, 3);

--read
SELECT * FROM restaurant;
SELECT * FROM menu;
SELECT * FROM menuItem;



--JOIN -select the name of a menu from a restaurant and list the menu items:
SELECT menu.menu_title, menuItem.menuItem_name
FROM menu
JOIN menuItem ON menu.menu_id = menuItem.menu_id
WHERE menu.menu_id =1;


--SELECT all the restaurants with a count of the number of menus each restaurant has:
SELECT restaurant.restaurant_name AS "Restaurants", COUNT(menu.menu_id) AS "Number of menus"
FROM menu
JOIN restaurant ON menu.restaurant_id = restaurant.restaurant_id
GROUP BY restaurant_name;

--SELECT all the menus, with the total cost of all the menu items summed, and have the list in descending order (most expensive first):
SELECT menu.menu_title AS "Menus", SUM(menuItem.menuItem_price) AS "Total Price"
FROM menu 
JOIN menuItem ON menu.menu_id = menuItem.menu_id
GROUP BY menu_title
ORDER BY "Total Price";


--finding the average price of each menu:
SELECT menu.menu_title AS "Menus", AVG(menuItem.menuItem_price) AS "Average Price"
FROM menu
JOIN menuItem ON menu.menu_id = menuItem.menu_id
GROUP BY menu_title
ORDER BY "Average Price";

--finding max price of each menu:
SELECT menu.menu_title AS "Menus", MAX(menuItem.menuItem_price) AS "Max Price"
FROM menu
JOIN menuItem ON menu.menu_id = menuItem.menu_id
GROUP BY menu_title
ORDER BY "Max Price";

--finding min price of each menu:
SELECT menu.menu_title AS "Menus", MIN(menuItem.menuItem_price) AS "Min Price"
FROM menu
JOIN menuItem ON menu.menu_id = menuItem.menu_id
GROUP BY menu_title
ORDER BY "Min Price";
