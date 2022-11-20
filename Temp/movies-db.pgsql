CREATE TABLE Genres (
    GenreID bigserial PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Description varchar(1000)
);
CREATE TABLE Directors (
    DirectorID serial PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Bio varchar(1000),
    Birthyear date,
    Deathyear date
);
----------------------------------------------------
-- Creating main table
CREATE TABLE Movies (
    MovieID serial PRIMARY KEY,
    Title varchar(50) NOT NULL,
    Description varchar(1000),
    DirectorID integer NOT NULL,
    GenreID integer NOT NULL,
    ImageURL varchar(300),
    Featured boolean,
    CONSTRAINT GenreKey FOREIGN KEY (GenreID) REFERENCES Genres (GenreID),
    CONSTRAINT DirectorKey FOREIGN KEY (DirectorID) REFERENCES Directors (DirectorID)
);
-----------------------------------------------------
-- Creating users table
CREATE TABLE Users (
    UserID serial PRIMARY KEY,
    Username varchar(50) NOT NULL,
    Password varchar(50) NOT NULL,
    Email varchar(50) NOT NULL,
    Birth_date date
);
-- Creating user-movies table
CREATE TABLE User_Movies (
    UserMovieID serial PRIMARY KEY,
    UserID integer,
    MovieID integer,
    CONSTRAINT UserKey FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT MovieKey FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);
---------------------------------------------------
--Genre data insertion
INSERT INTO Genres(Name, Description)
VALUES(
        'Thriller',
        'Thriller film, also known as suspense film or suspense thriller, is a broad film genre that involves excitement and suspense in the audience.'
    );
INSERT INTO Genres(Name, Description)
VALUES(
        'Animated',
        'Animation is a method in which pictures are manipulated to appear as moving images. In traditional animation, images are drawn or painted by hand on transparent celluloid sheets to be photographed and exhibited on film.'
    );
INSERT INTO Genres(Name, Description)
VALUES(
        'Comedy',
        'Comedy is a genre of film in which the main emphasis is on humor. These films are designed to make the audience laugh through amusement and most often work by exaggerating characteristics for humorous effect.'
    );
---------------------------------------------------
--Director data insertion
INSERT INTO Directors(Name, Bio, Birthyear, Deathyear)
VALUES(
        'Jonathan Demme',
        'Robert Jonathan Demme was an American director, producer, and screenwriter.',
        '1944-01-01',
        '2017-01-01'
    );
INSERT INTO Directors(Name, Bio, Birthyear)
VALUES (
        'Judd Apatow',
        'Judd Apatow is an American producer, writer, director, actor and stand-up comedian.',
        '1967-01-01'
    );
INSERT INTO Directors(Name, Bio, Birthyear)
VALUES (
        'Jim sung',
        'Jim sung is an Korean director, actor and father.',
        '1984-05-09'
    );
---------------------------------------------------
--Movie data insertion
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'Silence of the Lambs',
        'A young FBI cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer.',
        1,
        1,
        'silenceofthelambs.png',
        True
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'Matrix',
        'A young serial killer.',
        2,
        3,
        'Matrix.png',
        True
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'sunflower',
        NULL,
        3,
        1,
        'sunflower.png',
        True
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'Tokyo',
        NULL,
        3,
        1,
        NULL,
        False
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'Cairo film',
        NULL,
        2,
        3,
        NULL,
        True
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'damn SQL',
        NULL,
        3,
        1,
        NULL,
        True
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'the bug',
        NULL,
        3,
        1,
        NULL,
        False
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'help me',
        'A young serial killer.',
        1,
        1,
        NULL,
        True
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'Mac user',
        NULL,
        3,
        1,
        NULL,
        False
    );
-------------------------
INSERT INTO Movies(
        Title,
        Description,
        GenreID,
        DirectorID,
        ImageUrl,
        Featured
    )
VALUES(
        'Mega city',
        NULL,
        1,
        3,
        NULL,
        True
    );

---------------------------------------------------
--User data insertion
INSERT INTO Users(Username, Password, Email, Birth_date)
VALUES(
        'mahfouz',
        'passphrase',
        'mahmoud@yahoo.com',
        '2007-01-01'
    );
INSERT INTO Users(Username, Password, Email, Birth_date)
VALUES(
        'yun',
        'pass',
        'miko@yahoo.com',
        '2006-01-01'
    );
INSERT INTO Users(Username, Password, Email, Birth_date)
VALUES(
        'john',
        'passway',
        'john@yahoo.com',
        '2005-01-01'
    );


---------------------------------------------------
--User-movie data insertion
INSERT INTO Users (UserID, MovieID)
VALUES(1, 3);
INSERT INTO Users (UserID, MovieID)
VALUES(2, 1);
INSERT INTO Users (UserID, MovieID)
VALUES(3, 2);