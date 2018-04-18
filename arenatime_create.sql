-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-09-26 08:12:30.27

-- tables
-- Table: CheckIn
CREATE TABLE CheckIn (
    Id int  NOT NULL,
    Client_Id int  NOT NULL,
    Place_Id int  NOT NULL,
    Event_Id int  NOT NULL,
    Check_Dt date  NOT NULL,
    Sector varchar(12)  NULL,
    Row int  NULL,
    Seat int  NULL,
    Description varchar(1024)  NULL,
    CONSTRAINT CheckIn_pk PRIMARY KEY (Id)
);

-- Table: Client
CREATE TABLE Client (
    Id int  NOT NULL,
    Country_Id int  NOT NULL,
    Email varchar(255)  NOT NULL,
    Pwd varchar(64)  NOT NULL,
    Fname varchar(64)  NULL,
    Lname varchar(64)  NULL,
    Nickname varchar(64)  NOT NULL,
    Bdate date  NULL,
    Sex char(1)  NULL,
    CONSTRAINT Client_pk PRIMARY KEY (Id)
);

-- Table: Competition
CREATE TABLE Competition (
    Id int  NOT NULL,
    Name varchar(32)  NOT NULL,
    CONSTRAINT Competition_pk PRIMARY KEY (Id)
);

-- Table: Country
CREATE TABLE Arenatime.Country (
    Id int  NOT NULL,
    Country_Name varchar(64)  NOT NULL,
    CONSTRAINT Country_pk PRIMARY KEY (Id)
);

-- Table: Event
CREATE TABLE Event (
    Id int  NOT NULL,
    Place_Id int  NOT NULL,
    Sport_Id int  NOT NULL,
    Competition_Id int  NOT NULL,
    Event_Dt date  NOT NULL,
    Result varchar(32)  NULL,
    Description varchar(4000)  NULL,
    Participant_1 int  NULL,
    Participant_2 int  NULL,
    CONSTRAINT Event_pk PRIMARY KEY (Id)
);

-- Table: Friend
CREATE TABLE Friend (
    Id int  NOT NULL,
    Client_Id int  NOT NULL,
    Friend_Id int  NOT NULL,
    CONSTRAINT Friend_U UNIQUE (Client_Id, Friend_Id) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT Friend_pk PRIMARY KEY (Id)
);

-- Table: Like
CREATE TABLE "Like" (
    Id int  NOT NULL,
    CheckIn_Id int  NOT NULL,
    Client_Id int  NOT NULL,
    CONSTRAINT Like_pk PRIMARY KEY (Id)
);

-- Table: Participant
CREATE TABLE Participant (
    Id int  NOT NULL,
    Name varchar(64)  NOT NULL,
    CONSTRAINT Participant_pk PRIMARY KEY (Id)
);

-- Table: Place
CREATE TABLE Place (
    Id int  NOT NULL,
    Country_Id int  NOT NULL,
    Name varchar(128)  NOT NULL,
    Localname varchar(128)  NULL,
    City varchar(64)  NOT NULL,
    Address varchar(128)  NULL,
    Longitude decimal(6,6)  NOT NULL,
    Latitude decimal(6,6)  NOT NULL,
    Url varchar(256)  NULL,
    Capacity int  NULL,
    Description varchar(4000)  NULL,
    CONSTRAINT name_uniqe UNIQUE (Name) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT Place_pk PRIMARY KEY (Id)
);

-- Table: Rating
CREATE TABLE Rating (
    Id int  NOT NULL,
    Place_Id int  NOT NULL,
    Client_Id int  NOT NULL,
    RatingType_Id int  NOT NULL,
    Rate int  NOT NULL,
    Description varchar(1024)  NULL,
    CONSTRAINT Rating_pk PRIMARY KEY (Id)
);

-- Table: RatingType
CREATE TABLE RatingType (
    Id int  NOT NULL,
    Rating_Name varchar(64)  NOT NULL,
    CONSTRAINT RatingType_pk PRIMARY KEY (Id)
);

-- Table: Sport
CREATE TABLE Sport (
    Id int  NOT NULL,
    Sport_Name varchar(32)  NOT NULL,
    CONSTRAINT Sport_pk PRIMARY KEY (Id)
);

-- foreign keys
-- Reference: CheckIn_Client (table: CheckIn)
ALTER TABLE CheckIn ADD CONSTRAINT CheckIn_Client
    FOREIGN KEY (Client_Id)
    REFERENCES Client (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: CheckIn_Event (table: CheckIn)
ALTER TABLE CheckIn ADD CONSTRAINT CheckIn_Event
    FOREIGN KEY (Event_Id)
    REFERENCES Event (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: CheckIn_Place (table: CheckIn)
ALTER TABLE CheckIn ADD CONSTRAINT CheckIn_Place
    FOREIGN KEY (Place_Id)
    REFERENCES Place (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Event_Competition (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Competition
    FOREIGN KEY (Competition_Id)
    REFERENCES Competition (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Event_Participant_Guest (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Participant_Guest
    FOREIGN KEY (Participant_2)
    REFERENCES Participant (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Event_Participant_Home (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Participant_Home
    FOREIGN KEY (Participant_1)
    REFERENCES Participant (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Event_Sports_List (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Sports_List
    FOREIGN KEY (Sport_Id)
    REFERENCES Sport (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Friend_Client (table: Friend)
ALTER TABLE Friend ADD CONSTRAINT Friend_Client
    FOREIGN KEY (Client_Id)
    REFERENCES Client (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Friend_User_Id (table: Friend)
ALTER TABLE Friend ADD CONSTRAINT Friend_User_Id
    FOREIGN KEY (Friend_Id)
    REFERENCES Client (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Like_CheckIn (table: Like)
ALTER TABLE "Like" ADD CONSTRAINT Like_CheckIn
    FOREIGN KEY (CheckIn_Id)
    REFERENCES CheckIn (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Like_Client (table: Like)
ALTER TABLE "Like" ADD CONSTRAINT Like_Client
    FOREIGN KEY (Client_Id)
    REFERENCES Client (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Place_country (table: Place)
ALTER TABLE Place ADD CONSTRAINT Place_country
    FOREIGN KEY (Country_Id)
    REFERENCES Country (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Rating_Client (table: Rating)
ALTER TABLE Rating ADD CONSTRAINT Rating_Client
    FOREIGN KEY (Client_Id)
    REFERENCES Client (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Rating_Place (table: Rating)
ALTER TABLE Rating ADD CONSTRAINT Rating_Place
    FOREIGN KEY (Place_Id)
    REFERENCES Place (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: Rating_Rating_Type (table: Rating)
ALTER TABLE Rating ADD CONSTRAINT Rating_Rating_Type
    FOREIGN KEY (RatingType_Id)
    REFERENCES RatingType (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: client_country (table: Client)
ALTER TABLE Client ADD CONSTRAINT client_country
    FOREIGN KEY (Country_Id)
    REFERENCES Country (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: event_Place (table: Event)
ALTER TABLE Event ADD CONSTRAINT event_Place
    FOREIGN KEY (Place_Id)
    REFERENCES Place (Id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.

