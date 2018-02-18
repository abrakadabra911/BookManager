USE test; 
DROP TABLE IF EXISTS books; 
CREATE TABLE `books` (
  book_id int(11) NOT NULL AUTO_INCREMENT,
  book_title varchar(100) NOT NULL,
  book_description varchar(255) NOT NULL,
  book_author varchar(100) NOT NULL,
  book_isbn varchar(20) NOT NULL,
  book_printYear int(11) NOT NULL,
  book_readAlready tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (book_id)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

INSERT INTO books (book_title,book_description,book_author,book_isbn,book_printYear,book_readAlready) 
VALUES 
('title1','description1','Author1','isbn-code 1',2001,0),
('title2','description2','Author2','isbn-code 2',2002,0),
('title3','description3','Author3','isbn-code 3',2003,0),
('title4','description4','Author4','isbn-code 4',2004,0),
('title5','description5','Author5','isbn-code 5',2005,0),
('title6','description6','Author6','isbn-code 6',2006,0),
('title7','description7','Author7','isbn-code 7',2007,0),
('title8','description8','Author8','isbn-code 8',2008,0),
('title9','description9','Author9','isbn-code 9',2009,0),
('title10','description10','Author10','isbn-code 10',2010,0),
('title11','description11','Author11','isbn-code 11',2011,0),
('title12','description12','Author12','isbn-code 12',2012,0),
('title13','description13','Author13','isbn-code 13',2013,0),
('title14','description14','Author14','isbn-code 14',2014,0),
('title15','description15','Author15','isbn-code 15',2015,0),
('title16','description16','Author16','isbn-code 16',2016,0),
('title17','description17','Author17','isbn-code 17',2017,0),
('title18','description18','Author18','isbn-code 18',2018,0),
('title19','description19','Author19','isbn-code 19',2019,0),
('title20','description20','Author20','isbn-code 20',2020,0),
('title21','description21','Author21','isbn-code 21',2021,0);,('title21','description22','Author21','isbn-code 21',2021,0);
