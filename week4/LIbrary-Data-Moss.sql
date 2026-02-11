INSERT INTO PUBLISHER (Name, Address, Phone) VALUES
('Pearson','221B Baker St, New York, NY','555-0101'),
('OReilly','10 Tech Ave, San Jose, CA','555-0202'),
('Penguin','50 Book Rd, Boston, MA','555-0303');

INSERT INTO BOOK (Book_id, Title, Publisher_name) VALUES
(1,'Intro to SQL','Pearson'),
(2,'Advanced Databases','OReilly'),
(3,'Literary Classics','Penguin');

INSERT INTO LIBRARY_BRANCH (Branch_id, Branch_name, Address) VALUES
(1,101,'100 Main St'),
(2,102,'200 Oak Ave'),
(3,103,'300 Pine Rd');

INSERT INTO BORROWER (Card_no, Name, Address, Phone) VALUES
(1001,'Hawkeye Pierce','1 First St','555-1001'),
(1002,'Kevin McAllister','2 Second St','555-1002'),
(1003,'Wade Boggs','3 Third St','555-1003');

INSERT INTO BOOK_AUTHORS (Book_id, Author_name) VALUES
(1,'S. King'),
(2,'M. Chrichton'),
(3,'J. Heller');

INSERT INTO BOOK_COPIES (Book_id, Branch_id, No_of_copies) VALUES
(1,1,400),
(2,2,69),
(3,3,37);

INSERT INTO BOOK_LOANS (Book_id, Branch_id, Card_no, Date_out, Due_date) VALUES
(1,1,1001,'2026-01-10','2026-01-24'),
(2,2,1002,'2026-01-15','2026-01-29'),
(3,3,1003,'2026-01-20','2026-02-03');