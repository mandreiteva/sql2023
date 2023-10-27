-- Create a new database for the book store
CREATE DATABASE BookStore;
 
-- Switch to the newly created database
USE BookStore;
 
-- Create a table to store information about books
CREATE TABLE Book (
    BookID INT IDENTITY(1,1),
    Title VARCHAR(255),
    Author VARCHAR(100),
    PublicationYear INT,
    Price DECIMAL(10, 2)
);

ALTER TABLE Book
ADD CONSTRAINT PK_BookID PRIMARY KEY (BookID);

-- Create a table to store information about customers
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

ALTER TABLE Customer
ADD DateOfBirth DATE NOT NULL;

ALTER TABLE Customer
DROP COLUMN DateOfBirth;
 
-- Create a table to store information about orders
CREATE TABLE [Order] (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    OrderDate DATE
);
 
-- Create a table to store order details (books in orders)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    BookID INT,
    Quantity INT,
    Price DECIMAL(10, 2)
);
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Order
FOREIGN KEY (OrderID)
REFERENCES [Order] (OrderID);
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Book
FOREIGN KEY (BookID)
REFERENCES Book (BookID);
 
INSERT INTO Book (Title, Author, PublicationYear, Price)
VALUES
    ('The Lord of the Rings', 'J.R.R. Tolkien', 1954, 17.99),
    ('The Da Vinci Code', 'Dan Brown', 2003, 14.99),
    ('To the Lighthouse', 'Virginia Woolf', 1927, 12.99),
    ('The Road', 'Cormac McCarthy', 2006, 15.99),
    ('The Shining', 'Stephen King', 1977, 13.99),
    ('War and Peace', 'Leo Tolstoy', 1869, 19.99),
    ('The Catcher in the Rye', 'J.D. Salinger', 1951, 10.99),
    ('The Alchemist', 'Paulo Coelho', 1988, 12.99),
    ('Brave New World', 'Aldous Huxley', 1932, 11.99),
    ('Crime and Punishment', 'Fyodor Dostoevsky', 1866, 13.99),
    ('To Kill a Mockingbird', 'Harper Lee', 1960, 12.99),
    ('1984', 'George Orwell', 1949, 9.99),
    ('Pride and Prejudice', 'Jane Austen', 1813, 8.99),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 11.99),
    ('The Catcher in the Rye', 'J.D. Salinger', 1951, 10.99),
    ('The Hobbit', 'J.R.R. Tolkien', 1937, 14.99),
    ('To the Lighthouse', 'Virginia Woolf', 1927, 12.99);
 
INSERT INTO Customer (FirstName, LastName, Email)
VALUES
    ('John', 'Doe', 'johndoe@example.com'),
    ('Jane', 'Smith', 'janesmith@example.com'),
    ('David', 'Johnson', 'davidjohnson@example.com'),
    ('Emily', 'Williams', 'emilywilliams@example.com'),
    ('Michael', 'Brown', 'michaelbrown@example.com'),
    ('Sarah', 'Davis', 'sarahdavis@example.com'),
    ('Robert', 'Wilson', 'robertwilson@example.com'),
    ('Lisa', 'Jones', 'lisajones@example.com'),
    ('William', 'Taylor', 'williamtaylor@example.com'),
    ('Mary', 'Clark', 'maryclark@example.com'),
    ('Daniel', 'Lewis', 'daniellewis@example.com'),
    ('Elizabeth', 'Martin', 'elizabethmartin@example.com'),
    ('Christopher', 'Anderson', 'christopheranderson@example.com'),
    ('Linda', 'Harris', 'lindaharris@example.com'),
    ('Matthew', 'Thompson', 'matthewthompson@example.com'),
    ('Patricia', 'White', 'patriciawhite@example.com'),
    ('Joseph', 'Garcia', 'josephgarcia@example.com'),
    ('Nancy', 'Martinez', 'nancymartinez@example.com'),
    ('Charles', 'Johnson', 'charlesjohnson@example.com'),
    ('Jennifer', 'Thomas', 'jenniferthomas@example.com'),
	('J', 'Lo', null);
 
INSERT INTO [Order] (CustomerID, OrderDate)
VALUES
    (1, '2023-01-15'),
    (2, '2023-02-20'),
    (3, '2023-03-25'),
    (4, '2023-04-30'),
    (5, '2023-05-05'),
    (6, '2023-06-10'),
    (7, '2023-07-15'),
    (8, '2023-08-20'),
    (9, '2023-09-25'),
    (10, '2023-10-01'),
    (11, '2023-10-05'),
    (12, '2023-10-10'),
    (13, '2023-10-12'),
    (1, '2023-01-01'),
    (2, '2023-01-02'),
    (3, '2023-01-03'),
    (4, '2023-01-04'),
    (5, '2023-01-05'),
    (6, '2023-01-06'),
    (7, '2023-01-07'),
    (8, '2023-01-08'),
    (9, '2023-01-09'),
    (10, '2023-01-10'),
    (1, '2023-01-11'),
    (2, '2023-01-12'),
    (3, '2023-01-13'),
    (4, '2023-01-14'),
    (5, '2023-01-15'),
    (6, '2023-01-16');
 
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (1, 1, 2, 17.99), -- John Doe ordered 2 copies of "The Lord of the Rings"
    (1, 3, 1, 12.99); -- John Doe ordered 1 copy of "To the Lighthouse"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (2, 2, 3, 14.99), -- Jane Smith ordered 3 copies of "The Da Vinci Code"
    (2, 5, 1, 13.99); -- Jane Smith ordered 1 copy of "The Shining"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (3, 6, 2, 19.99), -- David Johnson ordered 2 copies of "War and Peace"
    (3, 12, 2, 8.99); -- David Johnson ordered 2 copies of "Pride and Prejudice"

INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (4, 7, 1, 10.99), -- Emily Williams ordered 1 copy of "The Catcher in the Rye"
    (4, 9, 3, 11.99); -- Emily Williams ordered 3 copies of "Brave New World"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (5, 10, 1, 13.99), -- Michael Brown ordered 1 copy of "Crime and Punishment"
    (5, 11, 2, 12.99); -- Michael Brown ordered 2 copies of "To Kill a Mockingbird"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (6, 14, 1, 11.99), -- Robert Wilson ordered 1 copy of "The Great Gatsby"
    (6, 16, 4, 14.99); -- Robert Wilson ordered 4 copies of "The Hobbit"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (7, 8, 2, 12.99), -- Lisa Jones ordered 2 copies of "The Alchemist"
    (7, 15, 1, 12.99); -- Lisa Jones ordered 1 copy of "The Catcher in the Rye"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (8, 18, 3, 15.99), -- William Taylor ordered 3 copies of "1984"
    (8, 19, 2, 8.99); -- William Taylor ordered 2 copies of "Pride and Prejudice"
INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (9, 4, 1, 15.99), 
    (9, 13, 2, 11.99); 

INSERT INTO [Order] (CustomerID, OrderDate)
VALUES
    (14, '2023-01-15'), 
    (15, '2023-01-15');

INSERT INTO OrderDetails (OrderID, BookID, Quantity, Price)
VALUES
    (21, 1, 2, 17.99), 
    (21, 3, 1, 12.99),
    (22, 4, 3, 15.99), 
    (22, 7, 2, 10.99);

--Output final sum of order with id=1, count how much books were bought
select sum(Price*Quantity) as 'Total price', sum(Quantity) as 'Books sold' from OrderDetails where OrderID = 1;

select * from OrderDetails where OrderID=1;
--Output average price of books in shop
select format(avg(price), 'n2') as 'Average' from Book where publicationYear >= 2000;
--Group orders by date date|number of orders
select OrderDate as 'Date', count(*) as 'Number of orders' from [Order] GROUP BY OrderDate, OrderID ORDER BY 'Number of orders' DESC;
--We decided to create discounts card for customers who spent more than 50$ in shop. Find them
select c.FirstName, c.LastName, c.Email from Customer c
join [Order] b
ON c.CustomerID=b.CustomerID
join OrderDetails o 
on b.OrderID=o.OrderID


select * from OrderDetails;

select TOP(1) c.FirstName + ' ' + c.LastName as 'Customer name', sum(Price*Quantity) as 'Total spent'
from Customer c join [Order] o on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID
group by c.CustomerID, c.FirstName, c.LastName
having sum(Price*Quantity) > 50
order by 'Total spent' DESC;

--Find customers who have placed more orders than the average number of orders per customer
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customer c
WHERE (
    SELECT COUNT(*) 
    FROM [Order] o 
    WHERE o.CustomerID = c.CustomerID
) > (
    SELECT AVG(OrderCount) 
    FROM (
        SELECT CustomerID, COUNT(*) AS OrderCount 
        FROM [Order] 
        GROUP BY CustomerID
    ) AS Subquery
);

--JOINS

--INNER
--Find customers and their order details for customers who have placed orders
SELECT o.OrderID, c.CustomerID, c.FirstName, c.LastName, od.BookID, od.Quantity
FROM Customer c
 JOIN [Order] o ON c.CustomerID = o.CustomerID
 JOIN OrderDetails od ON o.OrderID = od.OrderID;

--LEFT
--Find all customers and their order details, including customers who haven't placed any orders.


--FULL OUTER
--Find customers who haven't placed any orders

--UNION
-- Select order information for orders made by customers

UNION
-- Select order information for orders without customers (if any)






--CROSS
SELECT b.Title, c.FirstName, c.LastName
FROM Book AS b
CROSS JOIN Customer AS c;

--NATURAL JOIN is supported in MySQL and PostgreSQL
--In Sql Server inner join is used instead
SELECT *
FROM [Order] AS o
NATURAL JOIN Customer AS c on c.CustomerID = o.CustomerID
NATURAL JOIN OrderDetails AS od
NATURAL JOIN Book AS b;

--TRANSACTION
-- Start a transaction
BEGIN TRANSACTION;

-- Insert data into the Book table
INSERT INTO Book (Title, Author, PublicationYear, Price)
VALUES ('New Book 1', 'New Author 1', 2023, 25.99);

-- Insert data into the Customer table
INSERT INTO Customer (FirstName, LastName, Email)
VALUES ('New', 'Customer', 'newcustomer@example.com');

-- Attempt to insert data into the Order table
-- Note: This will fail because the CustomerID does not exist
-- You can replace the CustomerID with an existing one to make it succeed
BEGIN TRY
    INSERT INTO [Order] (CustomerID, OrderDate)
    VALUES (5, '2023-10-26');
    -- If everything is successful, commit the transaction
    COMMIT;
END TRY
BEGIN CATCH
    -- If an error occurs, roll back the transaction
    ROLLBACK;
END CATCH;

--To check that changes were applied, you can make a select to check added values


--INDEX
CREATE INDEX IX_Author ON Book (Author);

-- Retrieve books by a specific author using the index
SELECT Title, PublicationYear
FROM Book
WHERE Author = 'J.R.R. Tolkien';

-- Create a view that displays book titles published in or after 2000
CREATE VIEW NewBooks AS
SELECT Title
FROM Book
WHERE PublicationYear >= 2000;

select * from NewBooks;
-- Query the view to retrieve new book titles
SELECT Title
FROM NewBooks;

-- Create an archive table to store deleted books
CREATE TABLE BookArchive (
    BookID INT,
    Title VARCHAR(255),
    Author VARCHAR(100),
    PublicationYear INT,
    Price DECIMAL(10, 2),
    DeletionDate DATETIME
);

-- Create a trigger to archive deleted books
CREATE TRIGGER ArchiveDeletedBooks
ON Book
AFTER DELETE
AS
BEGIN
    INSERT INTO BookArchive (BookID, Title, Author, PublicationYear, Price, DeletionDate)
    SELECT
        BookID,
        Title,
        Author,
        PublicationYear,
        Price,
        GETDATE() AS DeletionDate
    FROM DELETED;
END;


select * from Book;

delete from Book
where BookID = 25;
 

INSERT INTO Book (Title, Author, PublicationYear, Price)
VALUES
    ('Test', 'Example', 1954, 17.99);

	select * from BookArchive;

--To achieve the perfect results, you can play with your imagination 
--to expand edges and database capabilities
--Or you can continue all we wrote and all we didn't ;)
--Try to create more queries, more solutions to get more practice
--You can apply this code to any db
--Good luck! :)