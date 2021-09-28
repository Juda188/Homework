PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE book(pk INTEGER PRIMARY KEY, book_name VARCHAR(64));
INSERT INTO book VALUES(1,'Pet cemetery');
INSERT INTO book VALUES(2,'Passenger #23');
INSERT INTO book VALUES(3,'Dune');
INSERT INTO book VALUES(4,'Joyland');
CREATE TABLE author(pk INTEGER PRIMARY KEY, firstname VARCHAR(32), surname VARCHAR(32));
INSERT INTO author VALUES(1,'Stephen','King');
INSERT INTO author VALUES(2,'Sebastian','Fitzek');
INSERT INTO author VALUES(3,'Frank','Herbert');
CREATE TABLE category(pk INTEGER PRIMARY KEY, genre VARCHAR(32));
INSERT INTO category VALUES(1,'Detective');
INSERT INTO category VALUES(2,'Horror');
INSERT INTO category VALUES(3,'Fantasy');
CREATE TABLE tag(pk INTEGER PRIMARY KEY, description VARCHAR(64));
INSERT INTO tag VALUES(1,'for adults');
INSERT INTO tag VALUES(2,'for all family');
INSERT INTO tag VALUES(3,'dark side of cruise');
CREATE TABLE library(pk INTEGER PRIMARY KEY, book_pk REFERENCES book(pk), author_pk REFERENCES author(pk), genre REFERENCES category(pk), release VARCHAR(32), count_of_pages INTEGER NOT NULL, tag_pk REFERENCES tag(pk) );
INSERT INTO library VALUES(1,1,1,2,'21.10.1986',444,1);
INSERT INTO library VALUES(2,2,2,1,'21.11.2017',298,3);
INSERT INTO library VALUES(3,3,3,3,'31.10.1975',654,2);
INSERT INTO library VALUES(4,4,1,2,'24.08.2013',243,1);
SELECT b.book_name, a.firstname, a.surname, l.genre, l.release, l.count_of_pages, t.description FROM library l 
JOIN book b ON l.pk = b.pk
JOIN author a ON l.pk = a.pk
JOIN tag t ON l.pk = t.pk;
SELECT a.firstname, a.surname, COUNT(l.author_pk) FROM author a LEFT JOIN library l ON a.pk = l.author_pk GROUP BY a.firstname;
SELECT release, COUNT(*) FROM library GROUP bY release;
SELECT c.genre, COUNT(l.genre) FROM category c LEFT JOIN library l ON c.pk = l.genre GROUP BY c.genre;
COMMIT;
