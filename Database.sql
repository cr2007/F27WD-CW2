-- SQL Database - F27WD Coursework 2 - Group 10

--COUNTRIES TABLE
 CREATE TABLE countries(
    country VARCHAR(56) PRIMARY KEY, -- Unique Identifer
    CURRENCY VARCHAR(3),
    visa VARCHAR (3)
)ENGINE=INNODB;

--CITIES TABLE
CREATE TABLE cities(
    cityName VARCHAR(85) PRIMARY KEY, -- Unique Identifer
    country VARCHAR(56), 
    --Foreign Key Additions
    FOREIGN KEY (country) REFERENCES countries(country)
)ENGINE=INNODB;

--SITES TABLE
CREATE TABLE sites(
    siteName VARCHAR(255) PRIMARY KEY, -- Unique Identifer
    cityName VARCHAR(85),
    siteCategory VARCHAR(85),
    --Foreign Key Additions
    FOREIGN KEY (cityName) REFERENCES cities(cityName)  
)ENGINE=INNODB;

--USER TABLE
CREATE TABLE user(
    userName VARCHAR(255) PRIMARY KEY, -- Unique Identifer
    userEmail VARCHAR(255)
)ENGINE=INNODB;

--USER VISITS TABLE
CREATE TABLE userVisits(
    commentNumber DECIMAL(3)  PRIMARY KEY, -- Unique Identifer
    userName VARCHAR(255),
    siteName VARCHAR(255),
    rating DECIMAL(1),
    --Foreign Key Additions
    FOREIGN KEY (userName) REFERENCES user(userName),
    FOREIGN KEY (siteName) REFERENCES sites(siteName)
)ENGINE=INNODB;

--Populating (Adding) all the Tables

--Country
INSERT INTO countries values 
("UAE","AED","Yes"),
("India","INR","Yes"),
("Egypt","EGP","Yes"),
("Pakistan","PKR","Yes"),
("France","EUR","No")
;

--Cities
INSERT INTO cities values
("Dubai", "UAE"),
("Abu Dhabi", "UAE"),
("Jaipur", "India"),
("Chennai", "India"),
("Sharm El-Sheikh", "Egypt"),
("Luxor", "Egypt"),
("Karachi", "Pakistan"),
("Peshawar", "Pakistan"),
("Nice", "France"),
("Marseille", "France")
;

--Sites of Interest
INSERT INTO sites values
("Hatta", "Dubai", "Nature Reserve"),
("Burj Al-Arab", "Dubai", "Hotel"),
("Qasr AL Watan", "Abu Dhabi", "Architecture"),
("Louvre Abu Dhabi", "Abu Dhabi", "Museum"),
("Thousand Lights Mosque", "Chennai", "Religous Site"),
("Marina Beach", "Chennai", "Beach"),
("Jantar Mantar", "Jaipur", "Historical Site"),
("Palace of the Winds", "Jaipur", "Historical Site"),
("Ras Mohamed Nature Reserve", "Sharm El-Sheikh", "Nature Reserve"),
("Jabal Mousa", "Sharm El-Sheikh", "Nature Reserve"),
("Valley of the Kings", "Luxor", "Historical Site"),
("Luxor Temple", "Luxor", "Historical Site"),
("Mazar-e-Quaid", "Karachi", "Historical Site"),
("Churna Island", "Karachi", "Wildlife"),
("Saif-ul-Maluk", "Peshawar", "National Park"),
("Bala Hisar fort Peshawar", "Peshawar", "Historical Site"),
("Castle of Nice", "Nice", "Historical Site"),
("Nice Cathedral", "Nice", "Religous Site"),
("Palais Longchamp", "Marseille", "Historical Site"),
("Parc national des Calanques", "Marseille", "National Park")
;

--Users
INSERT INTO user values
("Itachi Uchiha", "uchihaitachi@gmail.com"),
("Tanjiro Kamado", "kamado_t@gmail.com"),
("Levi Ackerman", "leviackerman@gmail.com"),
("Eren Jeager", "jeager_eren@gmail.com"),
("Sher Khan", "sherkhan@gmail.com")
;


--User Review
INSERT INTO userVisits values
(1, "Itachi Uchiha", "Hatta", 5),
(2, "Itachi Uchiha", "Burj Al-Arab", 4),
(3, "Itachi Uchiha", "Qasr AL Watan", 3),
(4, "Itachi Uchiha", "Louvre Abu Dhabi", 4),
(5, "Tanjiro Kamado", "Thousand Lights Mosque", 2),
(6, "Tanjiro Kamado", "Marina Beach", 5),
(7,"Tanjiro Kamado", "Jantar Mantar", 4),
(8,"Levi Ackerman", "Palace of the Winds", 3),
(9, "Levi Ackerman", "Ras Mohamed Nature Reserve", 4),
(10, "Levi Ackerman", "Jabal Mousa", 1),
(11, "Levi Ackerman", "Valley of the Kings", 2),
(12, "Eren Jeager", "Luxor Temple", 5),
(13, "Eren Jeager", "Mazar-e-Quaid", 3),
(14, "Eren Jeager", "Churna Island", 4),
(15, "Eren Jeager", "Saif-ul-Maluk", 1),
(16, "Sher Khan", "Bala Hisar fort Peshawar", 5),
(17, "Sher Khan", "Castle of Nice", 1),
(18, "Sher Khan", "Nice Cathedral", 2),
(19, "Sher Khan", "Palais Longchamp", 3),
(20, "Tanjiro Kamado", "Parc national des Calanques", 2)
;


--Querying
SELECT DISTINCT cityName FROM sites WHERE siteCategory = "Museum";
SELECT cityName FROM cities RIGHT JOIN countries ON cities.country = countries.country WHERE countries.visa = "No";
SELECT cityName FROM cities,countries WHERE cities.country = countries.country AND countries.visa = "No";
SELECT userName FROM userVisits WHERE siteName = "Hatta";

--Interesting queries

--Returns Sites which have a rating ≥4
SELECT siteName, rating FROM userVisits WHERE rating >= 4 ORDER BY rating DESC, siteName ASC;

--Returns the highest rating 
SELECT MAX(rating) FROM userVisits WHERE userName = "Itachi Uchiha";
