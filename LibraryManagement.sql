CREATE DATABASE IF NOT EXISTS db_LibraryManagement;


CREATE PROCEDURE LibraryManagementSystemProcedure()
BEGIN
    -- Example query inside db_LibraryManagement
    SELECT * FROM db_LibraryManagement.books;
END $$]

GO
	/* ======================= TABLES ========================*/

CREATE TABLE publisher (
   publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
   publisher_PublisherAddress VARCHAR(200) NOT NULL,
   publisher_PublisherPhone VARCHAR(50) NOT NULL
);
CREATE TABLE book (
   book_BookID INT NOT NULL AUTO_INCREMENT,
   book_Title VARCHAR(100) NOT NULL,
   book_PublisherName VARCHAR(100) NOT NULL,
   PRIMARY KEY (book_BookID),
   CONSTRAINT fk_publisher_name1 FOREIGN KEY (book_PublisherName) 
      REFERENCES publisher(publisher_PublisherName)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);
CREATE TABLE library_branch (
   library_branch_BranchID INT NOT NULL AUTO_INCREMENT,
   library_branch_BranchName VARCHAR(100) NOT NULL,
   library_branch_BranchAddress VARCHAR(200) NOT NULL,
   PRIMARY KEY (library_branch_BranchID)
);
SELECT * FROM library_branch

CREATE TABLE borrower (
		borrower_CardNo INT NOT NULL AUTO_INCREMENT,
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL,
        PRIMARY KEY (borrower_CardNo)
	);
    
SELECT * FROM borrower

CREATE TABLE book_loans (
   book_loans_LoansID INT NOT NULL AUTO_INCREMENT,
   book_loans_BookID INT NOT NULL,
   book_loans_BranchID INT NOT NULL,
   book_loans_CardNo INT NOT NULL,
   book_loans_DateOut VARCHAR(50) NOT NULL,
   book_loans_DueDate VARCHAR(50) NOT NULL,
   PRIMARY KEY (book_loans_LoansID),
   CONSTRAINT fk_book_id1 FOREIGN KEY (book_loans_BookID) 
      REFERENCES book(book_BookID)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
   CONSTRAINT fk_branch_id1 FOREIGN KEY (book_loans_BranchID) 
      REFERENCES library_branch(library_branch_BranchID)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
   CONSTRAINT fk_cardno FOREIGN KEY (book_loans_CardNo) 
      REFERENCES borrower(borrower_CardNo)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);

SELECT * FROM book_loans

CREATE TABLE book_copies (
    book_copies_CopiesID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_copies_BookID INT NOT NULL,
    book_copies_BranchID INT NOT NULL,
    book_copies_No_Of_Copies INT NOT NULL,
    CONSTRAINT fk_book_id2 FOREIGN KEY (book_copies_BookID) REFERENCES book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_branch_id2 FOREIGN KEY (book_copies_BranchID) REFERENCES library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT * FROM book_copies

CREATE TABLE book_authors (
    book_authors_AuthorID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    book_authors_BookID INT NOT NULL,
    book_authors_AuthorName VARCHAR(50) NOT NULL,
    FOREIGN KEY (book_authors_BookID) REFERENCES book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE
);

SELECT * FROM book_authors

/*======================== END TABLES ======================*/


/*==================== POPULATING TABLES ======================*/

INSERT INTO publisher
		(publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745')		
	;
    
SELECT * FROM publisher
INSERT INTO book (book_Title, book_PublisherName) VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');
        
SELECT * FROM book WHERE book_PublisherName = 'George Allen & Unwin'

INSERT INTO library_branch(library_branch_BranchName, library_branch_BranchAddress) VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104');
        
SELECT * FROM library_branch

INSERT INTO borrower (borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone) VALUES
		('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
 
SELECT * FROM borrower







INSERT INTO book_loans (book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate) 
VALUES   
    ('1','1','1','1/1/18','2/2/18'),   
    ('2','1','1','1/1/18','2/2/18'),   
    ('3','1','1','1/1/18','2/2/18'),   
    ('4','1','1','1/1/18','2/2/18'),   
    ('5','1','2','1/3/18','2/3/18'),   
    ('6','1','2','1/3/18','2/3/18'),   
    ('7','1','2','1/3/18','2/3/18'),   
    ('8','1','2','1/3/18','2/3/18'),   
    ('9','1','2','1/3/18','2/3/18'),   
    ('11','1','2','1/3/18','2/3/18'),   
    ('12','2','5','12/12/17','1/12/18'),   
    ('10','2','5','12/12/17','1/12/17'),   
    ('20','2','5','2/3/18','3/3/18'),   
    ('18','2','5','1/5/18','2/5/18'),   
    ('19','2','5','1/5/18','2/5/18'),   
    ('19','2','8','1/3/18','2/3/18'),   
    ('11','2','6','1/7/18','2/7/18'),   
    ('1','2','6','1/7/18','2/7/18'),   
    ('2','2','8','1/7/18','2/7/18'),   
    ('3','2','8','1/7/18','2/7/18'),   
    ('5','2','5','12/12/17','1/12/18'),   
    ('4','3','3','1/9/18','2/9/18'),   
    ('7','3','2','1/3/18','2/3/18'),   
    ('17','3','2','1/3/18','2/3/18'),   
    ('16','3','4','1/3/18','2/3/18'),   
    ('15','3','4','1/3/18','2/3/18'),   
    ('15','3','8','1/3/18','2/3/18'),   
    ('14','3','4','1/3/18','2/3/18'),   
    ('13','3','8','1/3/18','2/3/18'),   
    ('13','3','2','1/3/18','2/3/18'),   
    ('19','3','2','12/12/17','1/12/18'),   
    ('20','4','3','1/3/18','2/3/18'),   
    ('1','4','2','1/12/18','2/12/18'),   
    ('3','4','8','1/3/18','2/3/18'),   
    ('18','4','8','1/3/18','2/3/18'),   
    ('12','4','2','1/4/18','2/4/18'),   
    ('11','4','3','1/15/18','2/15/18'),   
    ('9','4','3','1/15/18','2/15/18'),   
    ('7','4','8','1/1/18','2/2/18'),   
    ('4','4','3','1/1/18','2/2/18'),   
    ('1','4','3','2/2/17','3/2/18'),   
    ('20','4','3','1/3/18','2/3/18'),   
    ('1','4','2','1/12/18','2/12/18'),   
    ('3','4','8','1/13/18','2/13/18'),   
    ('18','4','8','1/13/18','2/13/18'),   
    ('12','4','2','1/14/18','2/14/18'),   
    ('11','4','3','1/15/18','2/15/18'),   
    ('9','4','3','1/15/18','2/15/18'),   
    ('7','4','8','1/19/18','2/19/18'),   
    ('4','4','3','1/19/18','2/19/18'),   
    ('1','4','3','1/22/18','2/22/18');

SELECT * FROM book_loans

INSERT INTO book_copies
		(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
	
SELECT * FROM book_copies

INSERT INTO book_authors
		(book_authors_BookID,book_authors_AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');
        
SELECT * FROM book_authors	


/*============================== END POPULATING TABLES ==============================*/

/* =================== STORED PROCEDURE QUERY QUESTIONS =================================== */

/* #1- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"? */

			
CREATE PROCEDURE bookCopiesAtAllSharpstown (
    IN bookTitle VARCHAR(70), 
    IN branchName VARCHAR(70)
)
BEGIN
    -- Default values for parameters if NULL
    IF bookTitle IS NULL THEN
        SET bookTitle = 'The Lost Tribe';
    END IF;
    
    IF branchName IS NULL THEN
        SET branchName = 'Sharpstown';
    END IF;

    SELECT 
        copies.book_copies_BranchID AS `Branch ID`, 
        branch.library_branch_BranchName AS `Branch Name`, 
        copies.book_copies_No_Of_Copies AS `Number of Copies`, 
        book.book_Title AS `Book Title`
    FROM book_copies AS copies
    INNER JOIN book AS book ON copies.book_copies_BookID = book.book_BookID
    INNER JOIN library_branch AS branch ON copies.book_copies_BranchID = branch.library_branch_BranchID
    WHERE book.book_Title = bookTitle
      AND branch.library_branch_BranchName = branchName;


CALL bookCopiesAtAllSharpstown('The Lost Tribe', 'Sharpstown');

/* #2- For each library branch, retrieve the branch name and the total number of books loaned out from that branch.  */
DELIMITER $$

CREATE PROCEDURE TotalLoansPerBranch()
BEGIN
    SELECT  
        Branch.library_branch_BranchName AS `Branch Name`, 
        COUNT(Loans.book_loans_BranchID) AS `Total Loans`
    FROM book_loans AS Loans
    INNER JOIN library_branch AS Branch 
        ON Loans.book_loans_BranchID = Branch.library_branch_BranchID
    GROUP BY Branch.library_branch_BranchName;
END $$

DELIMITER ;

CALL TotalLoansPerBranch();




        

	




 











