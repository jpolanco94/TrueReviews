--This is a preliminary database for my 'QuickScales' app project I am working on.
--I made this only as a reference for myself in the future and to get
--a better idea of what changes I need to make in the future.
--A readme will be added in the future to my github to explain the purpose behind
--my tables, columns, and the overall app.
--https://github.com/jpolanco94
-------------------------------------Creating and bringing the database into scope--------------------------------
DROP DATABASE IF EXISTS TrueReviews;
CREATE DATABASE TrueReviews;
USE TrueReviews;

---------------------------------------Creating my first table----------------------------------------------------
DROP TABLE IF EXISTS Reviewer
CREATE TABLE Reviewer
(
	 userid					INT			 NOT NULL
	,firstname				NVARCHAR(20) NOT NULL
	,lastname				NVARCHAR(20) NOT NULL
	,userpassword			NVARCHAR(20) NOT NULL
	,email					VARCHAR(30)  NOT NULL
	,numberofreviewsentered INT			 NULL
	,CONSTRAINT PK_AppUser PRIMARY KEY (userid)
)
----------------------------------------Creating second table-----------------------------------------------------
DROP TABLE IF EXISTS Business
CREATE TABLE Business
(
	 restaurantid	  INT			NOT NULL
	,restname		  VARCHAR(50)	NOT NULL
	,restadress		  VARCHAR(50)	NOT NULL
	,averagerating	  DECIMAL(5, 3) NULL
	,numberofreviews  INT		    NULL
	,lastreviewdate   DATE			NULL
	,lastreviewrating DECIMAL(5, 3) NULL
	,reviewid		  INT		    NOT NULL
	,CONSTRAINT PK_Business PRIMARY KEY (restaurantid)
)
------------------------------------------Creating third table-----------------------------------------------------
DROP TABLE IF EXISTS Review
CREATE TABLE Review
(
	 reviewid	  INT          NOT NULL 
	,reviewrating DECIMAL(5,3) NOT NULL
	,reviewdate   DATE		   NOT NULL
	,reviewtext	  VARCHAR(200) NOT NULL
	,userid		  INT          NOT NULL 
	,restaurantid INT          NOT NULL
	,CONSTRAINT PK_Review PRIMARY KEY (reviewid)
	,					  FOREIGN KEY (restaurantid) REFERENCES Business (restaurantid)
	,				      FOREIGN KEY (userid)		 REFERENCES Reviewer (userid)
)
--------------------------------------Adding data to the Reviewer table---------------------------------------------
INSERT INTO Reviewer
	(userid, firstname, lastname, userpassword, email, numberofreviewsentered)
VALUES
	  (1000, 'sam', 'lynch', 'qwerty1234', 'samlynch@fakeemail.com', 34)
	 ,(1001, 'samantha', 'guerra', 'password1234', 'sg99@fakeemail.com', 3)
	 ,(1002, 'george', 'pochanclas', 'lorot56', 'masterreviewer@fakeemail.com', 7)
	 ,(1003, 'demarcus', 'sisters' , 'thisisapassword123', 'ds12@fakeemail.com', 198)
-----------------------------------Adding data to the Business table using a sequence-----------------------------
CREATE SEQUENCE RestaurantIdSeq AS INT
	START WITH 1000
	NO CYCLE;

INSERT INTO Business
	(restaurantid, restname, restadress, averagerating, numberofreviews, lastreviewdate, lastreviewrating, reviewid)
VALUES
	 (NEXT VALUE FOR RestaurantIdSeq, 'Senor Grubbys', '213 Main Street', 4.3, 213, '2019-05-12', 5, 210)
	,(NEXT VALUE FOR RestaurantIdSeq, 'Mikes Pizza', '213 Main Street' , 1.2, 347, '2019-06-07', 2, 342)
	,(NEXT VALUE FOR RestaurantIdSeq, 'Crepes and Dates', '132 Main Street', 5, 12, '2018-05-12', 4, 123)
	
SELECT * 
From Business
-------------------------------------------------------------------------------------------------------------------
