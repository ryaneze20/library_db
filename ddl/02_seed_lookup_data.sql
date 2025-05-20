/*Initial rows have been inserted into the lookup tables so the database
  has predefined categories, member statuses and reservation statuses*/


--Predefined book categories
INSERT INTO category (category_name) VALUES
('Fiction'),
('Non-Fiction'),
('Science'),
('History');

--Predefined account statuses
INSERT INTO member_status (status_value) VALUES
('Active'),
('Suspended'),
('Closed');

--Predefined reservation statuses
INSERT INTO reservation_status (status_value) VALUES
('Pending'),
('Fulfilled'),
('Canceled');
