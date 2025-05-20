
--this turns on foreign key enforcement, ensuring referential integrity
PRAGMA foreign_keys = ON;

--creating the lookup tables to keep consistency in data, and make updation and extension easy
CREATE TABLE category  (
    id INTEGER PRIMARY KEY AUTOINCREMENT, --increments each rows pk by one & prevents reuse of deleted keys
    category_name TEXT NOT NULL UNIQUE
);

CREATE TABLE member_status(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    status_value TEXT NOT NULL UNIQUE
);

CREATE TABLE reservation_status(
    id INTEGER PRIMARY KEY,
    status_value TEXT NOT NULL UNIQUE
);


--Creating core entities
CREATE TABLE book(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    category_id INTEGER NOT NULL REFERENCES category(id),
    publication_date DATE,
    copies_owned INTEGER NOT NULL
);

CREATE TABLE member(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    joined_date DATE NOT NULL,
    active_status_id INTEGER NOT NULL REFERENCES member_status(id)
);

CREATE TABLE author(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

--associative join table for book and author
CREATE TABLE book_author(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER NOT NULL REFERENCES book(id),
    author_id INTEGER NOT NULL REFERENCES author(id)
);

--transactionary tables
CREATE TABLE loan(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER NOT NULL REFERENCES book(id),
    member_id INTEGER NOT NULL REFERENCES member(id),
    loan_date DATE NOT NULL,
    returned_date DATE
);

CREATE TABLE fine(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL REFERENCES member(id),
    loan_id INTEGER NOT NULL  REFERENCES loan(id),
    fine_date DATE NOT NULL,
    fine_amount REAL NOT NULL
);

CREATE TABLE fine_payment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    member_id INTEGER NOT NULL REFERENCES member(id),
    payment_date DATE NOT NULL ,
    payment_amount REAL NOT NULL
);

CREATE TABLE reservation(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    book_id INTEGER NOT NULL REFERENCES book(id),
    member_id INTEGER NOT NULL REFERENCES member(id),
    reservation_date DATE NOT NULL,
    reservation_status_id INTEGER NOT NULL REFERENCES reservation_status(id)
);