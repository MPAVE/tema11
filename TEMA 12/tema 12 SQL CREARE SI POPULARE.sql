CREATE TABLE Book
(
	BookID INT IDENTITY(1,1) PRIMARY KEY,
	Title VARCHAR(200) UNIQUE NOT NULL,
	PublisherId INT NOT NULL,
	YearOfPublish INT NOT NULL,
	Price INT
)

CREATE TABLE Author
(
	AuthorID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	BirthDate DATE
)

CREATE TABLE BookAuthor
(
	BookAuthorID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL,
	AuthorID INT NOT NULL,
	CONSTRAINT FK_BookAuthor_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_BookAuthor_AuthorID FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
)


CREATE TABLE Category
(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	NameCategory VARCHAR(100) UNIQUE NOT NULL 
)

CREATE TABLE BookCategory
(
	BookCategoryID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT NOT NULL,
	CategoryID INT NOT NULL,
	CONSTRAINT FK_BookCategory_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_BookCategory_CategoryID FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)

CREATE TABLE Address
(
	AddressID INT IDENTITY(1,1) PRIMARY KEY,
	Street VARCHAR(100) NOT NULL,
	BuildingNumber INT,
	BuildingName VARCHAR(150),
	EntranceNumber CHAR(10),
	FloorNr INT,
	ApartmentNumber INT,
	City VARCHAR(100) NOT NULL,
	PostalCode INT NOT NULL,
	County VARCHAR(100) NOT NULL,
	OtherDetails VARCHAR(200)
)
CREATE TABLE Library
(
	LibraryID INT IDENTITY(1,1) PRIMARY KEY,
	NameLibrary VARCHAR(200) NOT NULL,
	AddressID INT NOT NULL,
	CONSTRAINT FK_Library_AddressID FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
)

CREATE TABLE BookLibrary
(
	BookLibrID INT IDENTITY(1,1) PRIMARY KEY,
	LibraryID INT NOT NULL,
	BookID INT NOT NULL,
	Quantity INT NOT NULL,
	CONSTRAINT FK_BookLibrary_LibraryID FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID),
	CONSTRAINT FK_BookLibrary_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID)
)

CREATE TABLE Member
(
	MemberID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PermitNumber VARCHAR(30),
	AddressID INT NOT NULL,
	Gender VARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(50),
	EmailAddress VARCHAR(100),
	CONSTRAINT FK_Member_AddressID FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
)
CREATE TABLE Request
(
	RequestID INT IDENTITY(1,1) PRIMARY KEY,
	RequestedBy INT NOT NULL,
	BookID INT NOT NULL,
	DateRequested DATE NOT NULL,
	DateReturned DATE,
	CONSTRAINT FK_Request_BookID FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_Request_MemberID FOREIGN KEY (RequestedBy) REFERENCES Member(MemberID)
)

---------------------populare----------------------

INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Scurta istorie a omenirii',1,2015,50);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Totul se termina cu noi',1,2016,17);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Hotul de carti',2,2009,27);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Inteligenta emotionala',3,2016,21);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Ultima scrisoare de dragoste',4,2018,25);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Fata din tren',1,2016,19);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Fiica negustorului de matase',3,2017,21);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Gandeste si vei fi bogat',5,2016,23);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Eu, si totusi alta',6,2018,19);
INSERT INTO Book(Title,PublisherId, YearOfPublish, Price) VALUES ('Oamenii fericiti citesc si beau cafeaua',7,2018,30);


INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Harari','Yuval Noah','1977-05-04');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Collen','Hover','1967-08-08');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Markus','Zusak','1966-10-15');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Daniel','Goleman','1970-05-04');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Jojo','Moyes','1985-01-12');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Paula','Hawkins','1972-09-06');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Dinah','Jefferies','1972-09-06');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Napoleon','Hill','1965-07-10');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Jojo','Moyes','1985-01-12');
INSERT INTO Author(FirstName,LastName,BirthDate) VALUES('Martin','Lugand','1977-05-04');

INSERT INTO BookAuthor(BookID, AuthorID) VALUES (1,1);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (2,2);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (3,3);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (4,4);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (5,5);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (6,6);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (7,7);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (8,8);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (9,9);
INSERT INTO BookAuthor(BookID, AuthorID) VALUES (10,10);

INSERT INTO Category(NameCategory) VALUES ('Romantic');
INSERT INTO Category(NameCategory) VALUES ('Fictiune');
INSERT INTO Category(NameCategory) VALUES ('Fantasy');
INSERT INTO Category(NameCategory) VALUES ('Aventura');

INSERT INTO BookCategory(BookID, CategoryID) VALUES (1,1);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (2,2);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (3,2);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (4,4);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (5,4);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (6,1);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (7,2);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (6,4);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (2,3);
INSERT INTO BookCategory(BookID, CategoryID) VALUES (6,6);




INSERT INTO Address(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNr, ApartmentNumber, City, PostalCode, County) 
	VALUES ('Anton Pann ','SRL',557,'D',4,16,'Pascani',333333,'Iasi');
INSERT INTO Address(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNr, ApartmentNumber, City, PostalCode, County) 
	VALUES ('Aurel Vlaicu nr.2','Gradinita',24,'tr.3',2,1,'Iasi',654123,'Iasi');
INSERT INTO Address(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNr, ApartmentNumber, City, PostalCode, County,OtherDetails)
	VALUES ('Ion Creanga','ApaVital',13,2,4,1,'Tg Neamt',123412,'Neamt','fara detalii');
INSERT INTO Address(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNr, ApartmentNumber, City, PostalCode, County,OtherDetails)
	VALUES ('Toma Cozma','cladire',75,5,2,2,'Iasi',620413,'Iasi','fostul centru de politie');
INSERT INTO Address(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNr, ApartmentNumber, City, PostalCode, County,OtherDetails)
	VALUES ('Trandafirilor','cladire',9,12,1,1,'Iasi',500124,'Iasi','langa restaurant Oscar');
INSERT INTO Address(Street, BuildingName, BuildingNumber, EntranceNumber, FloorNr, ApartmentNumber, City, PostalCode, County,OtherDetails)
	VALUES ('Crizantemelor','casa',2,1,1,1,'Roman',123456,'Neamt','fara detalii');

INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Universitara',1);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Gheorghe Asachi',2);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Universitara',1);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Universitara',2);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Universitara',3);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Universitara',4);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Mihai Eminescu',1);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Mihai Eminescu',2);
INSERT INTO Library(NameLibrary,AddressID) VALUES ('Biblioteca Centrala Mihai Eminescu',3);

INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,6,10);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,7,4);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,8,2);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,11,4);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,1,5);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,2,3);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (2,3,7);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (3,2,5);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,3,10);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,4,6);
INSERT INTO BookLibrary(LibraryID,BookID,Quantity) VALUES (1,5,25);


INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Ioan','Pavel',4,'Male','0746 306285','ioan.p@gmail.com');
INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Popa','Luca',5,'Male','0741 171513','popa.luca@yahoo.com');
INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Moisuc','Razvan',5,'Male','0722 171513','moisuc@yahoo.com');
INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Alexandru','Vlad',5,'Male','0744 171513','vlad.a@yahoo.com');
INSERT INTO Member(FirstName,LastName,AddressID,Gender,PhoneNumber,EmailAddress) VALUES ('Axinte','Robert',5,'Male','0764 787816','arazvan@yahoo.com');

INSERT INTO Request(RequestedBy,BookID,DateRequested,DateReturned) VALUES (1,2,'2017-05-15','2017-05-21');
INSERT INTO Request(RequestedBy,BookID,DateRequested,DateReturned) VALUES (1,6,'2017-09-21','2017-09-30');
INSERT INTO Request(RequestedBy,BookID,DateRequested,DateReturned) VALUES (2,8,'2017-06-14','2017-06-24');
INSERT INTO Request(RequestedBy,BookID,DateRequested,DateReturned) VALUES (1,11,'2017-08-12','2017-08-21');
INSERT INTO Request(RequestedBy,BookID,DateRequested) VALUES (1,8,'2017-12-18');
INSERT INTO Request(RequestedBy,BookID,DateRequested) VALUES (2,5,'2017-03-11');
INSERT INTO Request(RequestedBy,BookID,DateRequested) VALUES (3,2,'2017-03-11');
INSERT INTO Request(RequestedBy,BookID,DateRequested) VALUES (1,9,'2017-10-13');
