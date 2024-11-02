USE new_schema_1;

CREATE table books(
	BookID INT PRIMARY KEY,
    Title varchar(255),
    Author varchar(255),
    Price  decimal(10,2),
    PublicationDate date
);

SELECT * 
FROM books ;

SELECT Title, Author
FROM books WHERE  Price>50;