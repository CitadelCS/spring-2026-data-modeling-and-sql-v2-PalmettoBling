CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE IF NOT EXISTS library.PUBLISHER (
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    PRIMARY KEY (Name)
);

CREATE TABLE IF NOT EXISTS library.BOOK (
    Book_id serial,
    Title VARCHAR(100),
    Publisher_name VARCHAR(100),
    PRIMARY KEY (Book_id),
    FOREIGN KEY (Publisher_name) REFERENCES library.PUBLISHER(Name)
);

CREATE TABLE IF NOT EXISTS library.LIBRARY_BRANCH (
    Branch_id INT,
    Branch_name INT,
    Address VARCHAR(255),
    PRIMARY KEY (Branch_id)
);

CREATE TABLE IF NOT EXISTS library.BORROWER (
    Card_no INT,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(15),
    PRIMARY KEY (Card_no)
);

CREATE TABLE IF NOT EXISTS library.BOOK_AUTHORS (
    Book_id INT,
    Author_name VARCHAR(100),
    PRIMARY KEY (Author_name),
    FOREIGN KEY (Book_id) REFERENCES library.BOOK(Book_id)
);

CREATE TABLE IF NOT EXISTS library.BOOK_COPIES (
    Book_id INT,
    Branch_id INT,
    No_of_copies INT,
    FOREIGN KEY (Book_id) REFERENCES library.BOOK(Book_id),
    FOREIGN KEY (Branch_id) REFERENCES library.LIBRARY_BRANCH(Branch_id)
);

CREATE TABLE IF NOT EXISTS library.BOOK_LOANS (
    Book_id INT,
    Branch_id INT,
    Card_no INT,
    Date_out DATE,
    Due_date DATE,
    FOREIGN KEY (Book_id) REFERENCES library.BOOK(Book_id),
    FOREIGN KEY (Branch_id) REFERENCES library.LIBRARY_BRANCH(Branch_id),
    FOREIGN KEY (Card_no) REFERENCES library.BORROWER(Card_no)
);