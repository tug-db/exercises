DROP TABLE IF EXISTS Country, Users, Artist, Genre, Festival, Ticket, Friendship, UserArtist, FestivalGenres, ArtistGenre;
DROP TYPE IF EXISTS ticket_type;


CREATE TABLE Country (
  ISO_3166 CHAR(2) PRIMARY KEY,
  CountryName VARCHAR(256),
  GDP NUMERIC(32),
  Population INT
);

CREATE TABLE Users (
  UID INT PRIMARY KEY,
  Age INT,
  Gender VARCHAR(1),
  Joined TIMESTAMP,
  ISO_3166 CHAR(2) REFERENCES Country (ISO_3166)
);

CREATE TABLE Artist (
  AID INT PRIMARY KEY,
  ArtistName VARCHAR (256)
);

CREATE TABLE Genre (
  GID INT PRIMARY KEY,
  GenreName VARCHAR (256)
);


CREATE TABLE Festival (
  FID INT PRIMARY KEY,
  FestivalName VARCHAR(256),
  BeginDate DATE,
  Duration INT,
  Outdoors BOOL,
  Price DECIMAL,
  ISO_3166 CHAR(2) REFERENCES Country (ISO_3166)
);


CREATE TYPE ticket_type AS ENUM ('VIP', 'Standard');
CREATE TABLE Ticket (
  TID SERIAL PRIMARY KEY,
  UID INT REFERENCES Users (UID),
  FID INT REFERENCES Festival (FID),
  Type ticket_type
);

CREATE TABLE Friendship (
  User1 INT REFERENCES Users (UID),
  User2 INT REFERENCES Users (UID),
  PRIMARY KEY (User1, User2),
  CONSTRAINT columns_cannot_equal CHECK (User1 <> User2) 
);

CREATE TABLE UserArtist (
  UID INT REFERENCES Users (UID),
  AID INT REFERENCES Artist (AID),
  Playcount INT,
  PRIMARY KEY (UID,AID)
);

CREATE TABLE FestivalGenres (
  FID INT REFERENCES Festival (FID),
  GID INT REFERENCES Genre (GID),
  PRIMARY KEY (FID,GID)
);

CREATE TABLE ArtistGenre (
  AID INT REFERENCES Artist (AID),
  GID INT REFERENCES Genre (GID),
  PRIMARY KEY (AID,GID)
);
