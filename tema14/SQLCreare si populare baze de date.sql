CREATE TABLE [Publisher](
    [PublisherId] [int] NOT NULL,
    [Name] [varchar](50) NULL,
    CONSTRAINT [pk_publisher] PRIMARY KEY CLUSTERED
    (
        [PublisherId] ASC
    ) WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

CREATE TABLE [Book](
       [BookId] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
       [Title] [varchar](50) NULL,
       [PublisherId] [int] NULL,
       [Year] [int] NULL,
       [Price] [decimal](18, 0) NULL
       )
GO
ALTER TABLE [Book]  WITH CHECK ADD  CONSTRAINT [fk_book_publisherid] FOREIGN KEY([PublisherId])
REFERENCES [Publisher] ([PublisherId])
ON DELETE CASCADE
GO
ALTER TABLE [Book] CHECK CONSTRAINT [fk_book_publisherid]
GO


INSERT INTO Publisher (PublisherId,Name) VALUES (1,'Albatros');
INSERT INTO Publisher (PublisherId,Name) VALUES (2,'Corint');
INSERT INTO Publisher (PublisherId,Name) VALUES (3,'Curtea veche');
INSERT INTO Publisher (PublisherId,Name) VALUES (4,'Nemira');
INSERT INTO Publisher (PublisherId,Name) VALUES (5,'Humanitas');
INSERT INTO Publisher (PublisherId,Name) VALUES (6,'Historia');
INSERT INTO Publisher (PublisherId,Name) VALUES (7,'Litera');
INSERT INTO Publisher (PublisherId,Name) VALUES (8,'Minerva');
INSERT INTO Publisher (PublisherId,Name) VALUES (9,'Niculescu');
INSERT INTO Publisher (PublisherId,Name) VALUES (10,'Academiei Romane');


INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Scurta istorie a omenirii',1,2015,50);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Totul se termina cu noi',2,2016,17);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Hotul de carti',2,2009,27);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Inteligenta emotionala',3,2016,21);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Ultima scrisoare de dragoste',4,2018,25);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Fata din tren',10,2016,19);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Fiica negustorului de matase',7,2017,21);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Gandeste si vei fi bogat',5,2016,23);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Eu, si totusi alta',6,2018,19);
INSERT INTO Book(Title,PublisherId, Year, Price) VALUES ('Oamenii fericiti citesc si beau cafeaua',8,2018,30);


