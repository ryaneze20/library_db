
/*remove any existing tables so that re-running the create script
  can succeed without “table already exists” errors which I was experiencing
  I firstly turned off foreign key checks to avoid dependency order issues
  Then dropped each table in reverse dependency order
  Then re-enforce foreign key enforcement*/
PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS fine_payment;
DROP TABLE IF EXISTS fine;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS book_author;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS member_status;
DROP TABLE IF EXISTS reservation_status;

PRAGMA foreign_keys = ON;
