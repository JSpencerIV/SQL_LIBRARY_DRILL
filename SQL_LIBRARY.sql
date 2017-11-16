USE MASTER
GO
DROP DATABASE db_Library;
GO
CREATE DATABASE db_Library;
GO
USE db_Library
GO




--DROP TABLE PUBLISHER;


--DROP TABLE BOOKS;BOOK_AUTHORS,PUBLISHER,BOOK_LOANS,BOOK_COPIES,BORROWER,LIBRARY_BRANCH;



CREATE TABLE PUBLISHER (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50)NOT NULL
);


CREATE TABLE BOOKS (
	Bookid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_Name_to_Publisher FOREIGN KEY REFERENCES PUBLISHER(Name)
);



CREATE TABLE BOOK_AUTHORS (
	Bookid  INT NOT NULL CONSTRAINT fk_Book_Author_to_Bookid FOREIGN KEY REFERENCES BOOKS(Bookid),
	AuthorName VARCHAR(50) NOT NULL
);


CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);


CREATE TABLE BOOK_LOANS (
	Bookid INT NOT NULL CONSTRAINT fk_Book_Loans_to_Bookid FOREIGN KEY REFERENCES BOOKS(Bookid),
	Branchid VARCHAR(50) NOT NULL,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo_to_Borrower FOREIGN KEY REFERENCES BORROWER(CardNo),
	DateOut DATE NOT NULL,
	DueDate DATE NOT NULL
);



CREATE TABLE LIBRARY_BRANCH (
	Branchid  INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);



CREATE TABLE BOOK_COPIES (
	Bookid INT NOT NULL CONSTRAINT fk_Books_Copies_to_Bookid FOREIGN KEY REFERENCES BOOKS(Bookid),
	Branchid INT NOT NULL CONSTRAINT fk_Branchid FOREIGN KEY REFERENCES LIBRARY_BRANCH(Branchid),
	No_of_Copies VARCHAR(50) NOT NULL
);




SELECT * FROM BOOKS






INSERT INTO PUBLISHER
	(Name,Address,Phone)
	VALUES
	('Picador USA','1204 Kingston Dr. Concord,CA 94518', '925-715-1422'),
	('Scholastic Inc','1320 Watergate St. Houston,TX 94518', '705-365-1822'),
	('Children''s Classics','1873 Lennox St. Lynnwood,CA 94518', '274-362-2536'),
	('Penguin','2207 Manderin St. Portland,OR 94518', '393-258-1747'),
	('Modern Library','7109 John St. Seattle,WA 94518', '914-753-8520'),
	('Harper Perennial Modern Classics','4402 Yesler St. Orlando,FL 94518', '473-246-1200'),
	('New American Library','4201 Denny Rd. Telsa,CO 94518', '386-985-1362')
;



INSERT INTO BOOKS
	(Title,PublisherName)
	VALUES
	('The Lost Tribe','Picador USA'),
	('Harry Potter and the Sorcerer''s Stone','Scholastic Inc'),
	('To Kill a Mockingbird','Harper Perennial Modern Classics'),
	('1984','New American Library'),
	('Pride and Prejudice','Modern Library'),
	('The Diary of a Young Girl','New American Library'),
	('The Hobbit','Modern Library'),
	('The Little Prince','Children''s Classics'),
	('The Great Gatsby' ,'Harper Perennial Modern Classics'),
	('The Book Thief' ,'Scholastic Inc'),
	('Lord of the Flies','New American Library'),
	('The Green Mile','Harper Perennial Modern Classics'),
	('The Giving Tree','Modern Library'),
	('The Kite Runner' ,'New American Library'),
	('Charlotte''s Web' ,'Children''s Classics'),
	('Of Mice and Men','Harper Perennial Modern Classics'),
	('The Adventures of Huckleberry Finn','Modern Library'),
	('The Alchemist','Penguin'),
	('Crime and Punishment','Penguin'),
	('The Secret Garden', 'Children''s Classics')
;

SELECT * FROM BOOKS

INSERT INTO BOOK_AUTHORS
	(Bookid,AuthorName)
	VALUES
	(1,'Antoine De Saint-Exupéry'),
	(2,'Stephen King'),
	(3,'Harper Lee'),
	(4,'J.K. Rowling'),	
	(5,'George Orwell'),
	(6,'Mark Lee'),
	(7,'Khaled Hosseini'),
	(8,'Jane Austen'),
	(9,'E.B. White'),
	(10,'Frances Hodgson Burnett'),
	(11,'Antoine De Saint-Exupéry'),
    (12,'Stephen King'),
	(13,'Harper Lee'),
	(14,'J.K. Rowling'),	
	(15,'George Orwell'),
	(16,'Mark Lee'),
	(17,'Khaled Hosseini'),
	(18,'Jane Austen'),
	(19,'E.B. White'),
	(20,'Frances Hodgson Burnett')
;

INSERT INTO LIBRARY_BRANCH
	(BranchName,Address)
	VALUES
	('Sharpstown','1109 Bell ave. Billingham,WA 98244'),
	('Central','4111 Read St. Billingham,WA 98234'),
	('Kingsville','2306 Geneva Blvd. Billingham,WA 98244'),
	('Momentocity','7866 Breaks St. Billingham,WA 98234')
;



INSERT INTO BORROWER
	(Name,Address,Phone)
	VALUES
	('John smith','4506 Concord ave. Billingham,WA 98244','360-426-0098'),
	('Ann Thompson','2501 New St. Billingham,WA 98234','360-426-1747'),
	('Chris Game','5390 Neel Rd. Billingham,WA 98244','360-426-7735'),
	('Garry Strong','9500 Heaven Rd. Billingham,WA 98244','360-426-0098'),
	('Darius Maze','4301 Old St. Billingham,WA 98234','360-416-1747'),
	('Jenny Pomma','6309 Benson Rd. Billingham,WA 98244','360-426-2475'),
	('Mark Vil','9500 Forest Dr. Billingham,WA 98244','360-426-1648'),
	('Karen Cost','8921 Jetson St. Billingham,WA 98234','360-416-1443'),
	('Joe Lemons','6309 Carson St. Billingham,WA 98244','360-426-7967'),
	('Steve Lemon','6310 Carsons St. Billingham,WA 98244','360-430-7967')
;



INSERT INTO BOOK_LOANS
	(Bookid,Branchid,CardNo,DateOut,DueDate)
	VALUES
	(1,1,1,'12/30/2012','01/07/2013'),
	(2,2,1,'04/12/2013','04/19/2013'),
	(3,3,1,'03/01/2013','03/07/2013'),
	(4,4,1,'04/21/2013','04/28/2013'),
	(5,1,1,'05/16/2013','05/24/2013'),
	(6,2,2,'06/12/2013','06/19/2013'),
	(7,3,2,'07/01/2013','07/07/2013'),
	(8,4,2,'08/11/2013','08/18/2013'),
	(9,1,2,'02/02/2013','02/10/2013'),
	(10,2,2,'03/11/2013','03/19/2013'),
	(12,3,3,'12/30/2013','01/07/2014'),
	(13,4,3,'04/12/2014','04/19/2014'),
	(14,1,3,'03/01/2014','03/07/2014'),
	(15,2,4,'04/21/2014','04/28/2014'),
	(16,3,4,'05/16/2014','05/24/2014'),
	(17,4,4,'06/12/2014','06/19/2014'),
	(18,1,4,'11/08/2017','11/13/2017'),
	(19,2,5,'08/11/2014','08/18/2014'),
	(20,3,5,'02/02/2014','02/10/2014'),
	(1,4,5,'03/11/2014','03/19/2014'),
	(2,1,5,'12/30/2014','01/07/2015'),
	(3,2,6,'04/12/2015','04/19/2015'),
	(4,3,6,'03/01/2015','03/07/2015'),
	(5,4,6,'04/21/2015','04/28/2015'),
	(6,1,6,'05/16/2015','05/24/2015'),
	(7,2,7,'06/12/2015','06/19/2015'),
	(8,3,7,'07/01/2015','07/07/2015'),
	(9,4,7,'08/11/2015','08/18/2015'),
	(10,1,7,'02/02/2015','02/10/2015'),
	(11,2,8,'03/11/2015','03/19/2015'),
	(12,3,8,'12/30/2015','01/07/2016'),
	(13,4,8,'04/12/2016','04/19/2016'),
	(14,1,8,'03/01/2016','03/07/2016'),
	(15,2,9,'04/21/2016','04/28/2016'),
	(16,3,9,'05/16/2016','05/24/2016'),
	(17,4,9,'06/12/2016','06/19/2016'),
	(18,2,9,'07/01/2016','07/07/2016'),
	(19,3,9,'08/11/2016','08/18/2016'),
	(20,4,9,'02/02/2016','02/10/2016'),
	(1,1,8,'03/11/2016','03/19/2016'),
	(2,2,1,'12/30/2016','01/07/2017'),
	(3,2,2,'04/12/2017','04/19/2017'),
	(4,3,3,'03/01/2017','03/07/2017'),
	(5,4,4,'04/21/2017','04/28/2017'),
	(6,1,5,'05/16/2017','05/24/2017'),
	(7,2,6,'06/12/2017','06/19/2017'),
	(8,3,7,'07/01/2017','07/07/2017'),
	(9,4,8,'08/11/2017','08/18/2017'),
	(10,1,2,'02/02/2017','02/10/2017'),
	(11,2,3,'03/11/2017','03/19/2017')
;



INSERT INTO BOOK_COPIES
	(Bookid,Branchid,No_of_Copies)
	VALUES
	(1,1,2),
	(2,1,2),
	(3,1,2),
	(4,1,2),
	(5,1,2),
	(6,1,2),
	(7,1,2),
	(8,1,2),
	(9,1,2),
	(10,1,2)
;

INSERT INTO BOOK_COPIES
	(Bookid,Branchid,No_of_Copies)
	VALUES
	(1,2,2),
	(2,2,2),
	(3,2,2),
	(4,2,2),
	(5,2,2),
	(6,2,2),
	(7,2,2),
	(8,2,2),
	(9,2,2),
	(10,2,2)
;

INSERT INTO BOOK_COPIES
	(Bookid,Branchid,No_of_Copies)
	VALUES
	(1,3,2),
	(2,3,2),
	(3,3,2),
	(4,3,2),
	(5,3,2),
	(6,3,2),
	(7,3,2),
	(8,3,2),
	(9,3,2),
	(10,3,2)
;

INSERT INTO BOOK_COPIES
	(Bookid,Branchid,No_of_Copies)
	VALUES
	(1,4,2),
	(2,4,2),
	(3,4,2),
	(4,4,2),
	(5,4,2),
	(6,4,2),
	(7,4,2),
	(8,4,2),
	(9,4,2),
	(10,4,2)
;

SELECT * FROM PUBLISHER 
SELECT * FROM BOOKS
SELECT * FROM LIBRARY_BRANCH
SELECT * FROM BOOK_LOANS
SELECT * FROM BORROWER
SELECT * FROM BOOK_AUTHORS
SELECT * FROM BOOK_COPIES




SELECT BOOKS.Bookid,BOOKS.Title,BOOK_COPIES.No_of_Copies,LIBRARY_BRANCH.Branchid,LIBRARY_BRANCH.BranchName
FROM BOOKS
INNER JOIN  BOOK_COPIES ON BOOKS.Bookid = BOOK_COPIES.Bookid
INNER JOIN  LIBRARY_BRANCH ON LIBRARY_BRANCH.Branchid = BOOK_COPIES.Branchid
WHERE Title = 'The Lost Tribe';


SELECT COUNT (*) 'No_of_Copies'
FROM BOOKS
INNER JOIN  BOOK_COPIES ON BOOKS.Bookid = BOOK_COPIES.Bookid
INNER JOIN  LIBRARY_BRANCH ON LIBRARY_BRANCH.Branchid = BOOK_COPIES.Branchid
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown';



SELECT BORROWER.Name 
FROM BORROWER
Left JOIN BOOK_LOANS ON BOOK_LOANS.CardNo = BORROWER.CardNo
WHERE BOOK_LOANS.CardNo IS NULL;


SELECT BOOKS.Title,BORROWER.Name,BORROWER.Address
FROM BOOKS
INNER JOIN BOOK_LOANS ON BOOKS.Bookid = BOOK_LOANS.Bookid
INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
INNER JOIN LIBRARY_BRANCH ON BOOK_LOANS.Branchid = LIBRARY_BRANCH.Branchid
WHERE BranchName = 'Sharpstown' AND DueDate = '11/13/2017';


USE db_Library



SELECT  LIBRARY_BRANCH.BranchName,COUNT(BOOK_LOANS.Branchid) AS QtyperBranch
FROM LIBRARY_BRANCH 
INNER JOIN BOOK_LOANS ON BOOK_LOANS.Branchid = LIBRARY_BRANCH.Branchid
GROUP BY  LIBRARY_BRANCH.BranchName 



SELECT BORROWER.Name,BORROWER.[Address], COUNT(BOOK_LOANS.CardNo)
FROM BORROWER 
INNER JOIN BOOK_LOANS ON BOOK_LOANS.CardNo = BORROWER.CardNo
GROUP BY BORROWER.Name, BORROWER.[Address]
HAVING COUNT(BOOK_LOANS.CardNo) > 5



SELECT BOOKS.Title,BOOK_COPIES.No_of_Copies,LIBRARY_BRANCH.BranchName,BOOK_AUTHORS.AuthorName 
FROM BOOKS
INNER JOIN BOOK_COPIES ON BOOKS.Bookid = BOOK_COPIES.Bookid
INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.Branchid = BOOK_COPIES.Branchid
INNER JOIN BOOK_AUTHORS ON BOOK_AUTHORS.Bookid = BOOKS.Bookid
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central';