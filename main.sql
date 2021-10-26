-- C reate -> INSERT
-- R ead -> SELECT
-- U pdate -> UPDATE
-- D elete -> DELETE

PRAGMA foreign_keys = ON;
CREATE TABLE Restaurants (
  restaurant_ID INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  imageLink TEXT
);

CREATE TABLE Menus (
  menu_ID INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  restaurant_ID INT, FOREIGN KEY (restaurant_ID) REFERENCES Restaurants(restaurant_ID)
);

CREATE TABLE MenuItems (
  menuItem_ID INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  price INTEGER,
  menu_ID INT, FOREIGN KEY (menu_ID) REFERENCES Menus(menu_ID)
);


INSERT INTO Restaurants (name, imageLink) VALUES
("Veg_Restaurant", "https://a.com"), ("Meat_Restaurant", "https://b.com");

INSERT INTO Menus (name, restaurant_ID) VALUES
("VegMenu", 1), ("MeatMenu", 2), ("Drinks", 1), ("Sides", 2);

INSERT INTO MenuItems (name, price, menu_ID) VALUES 
("Veg Curry", 2000, 1), ("Vegan Sausage Roll", 600, 1), ("Roast Chiken", 1700, 2), ("Lamb Kebab", 1400, 2), ("Sparkling Water :)", 100000, 3), ("Still Water", 1, 3), ("Cheese Cake", 500, 4), ("Apple Pie", 500, 4);

--SELECT Restaurants.name AS "Restaurant Name", Menus.name AS "Menu Name", MenuItems.name AS "Menu Item Name", MenuItems.price /100.00 AS "Menu Item Price" 
--FROM Restaurants
--JOIN Menus ON
--Restaurants.restaurant_ID = Menus.restaurant_ID
--JOIN MenuItems ON
--Menus.menu_ID = MenuItems.menu_ID
--WHERE Restaurants.name = "Veg_Restaurant"
--AND Menus.name = "VegMenu"

-- SELECT Restaurants.name AS "Restaurant Name", COUNT (Menus.menu_ID) AS "Number of Menus"
-- FROM Restaurants
-- JOIN Menus
-- ON Restaurants.restaurant_ID = Menus.restaurant_ID
-- GROUP BY Restaurants.name

-- ALmost same as doing it by using FROM restaurants, Menus

SELECT Menus.name AS "Menu Name", SUM (MenuItems.price) AS "Sum of Items"
FROM MenuItems
JOIN Menus
ON MenuItems.menu_ID = Menus.menu_ID
GROUP BY Menus.name
ORDER BY "Sum of Items" DESC