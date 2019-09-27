DROP TABLE IF EXISTS Love;
DROP TABLE IF EXISTS Favor;
DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS SimpleForum;
DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
username VARCHAR(10) NOT NULL UNIQUE,
stuId VARCHAR(10) NULL
);

INSERT INTO Person (name, username, stuId)
VALUES ("Paul", "ab123", "18"),
       ("Peter", "cd456", "16");

CREATE TABLE SimpleForum (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL
);

CREATE TABLE Topic (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
forum INTEGER NOT NULL,
FOREIGN KEY (forum) REFERENCES SimpleForum(id)
);

CREATE TABLE Post (
id INTEGER PRIMARY KEY AUTO_INCREMENT,
topic INTEGER NOT NULL,
author INTEGER NOT NULL,
content TEXT,
atTime VARCHAR(100),
FOREIGN KEY (topic) REFERENCES Topic(id),
FOREIGN KEY (author) REFERENCES Person(id)
);

CREATE TABLE Favor (
person INTEGER NOT NULL,
topic INTEGER NOT NULL,
PRIMARY KEY (person, topic),
FOREIGN KEY (person) REFERENCES Person(id),
FOREIGN KEY (topic) REFERENCES Topic(id)
);

CREATE TABLE Love (
person INTEGER NOT NULL,
post INTEGER NOT NULL,
PRIMARY KEY (person, post),
FOREIGN KEY (person) REFERENCES Person(id),
FOREIGN KEY (post) REFERENCES Post(id)
);




