-- Create table for Movies
CREATE TABLE IF NOT EXISTS Movies (
    MovieID INTEGER PRIMARY KEY,
    Title TEXT,
    ReleaseYear INTEGER,
    -- Add other relevant columns
    CONSTRAINT UC_Movie_Title_ReleaseYear UNIQUE (Title, ReleaseYear)
);

-- Create table for Media
CREATE TABLE IF NOT EXISTS Media (
    MediaID INTEGER PRIMARY KEY,
    MovieID INTEGER,
    MediaType TEXT CHECK(MediaType IN ('Video', 'Image')),
    MediaURL TEXT,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
);

-- Create table for Genres
CREATE TABLE IF NOT EXISTS Genres (
    GenreID INTEGER PRIMARY KEY,
    GenreName TEXT
);

-- Create table for MovieGenres (to establish many-to-many relationship)
CREATE TABLE IF NOT EXISTS MovieGenres (
    MovieID INTEGER,
    GenreID INTEGER,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Create table for Reviews
CREATE TABLE IF NOT EXISTS Reviews (
    ReviewID INTEGER PRIMARY KEY,
    MovieID INTEGER,
    UserID INTEGER,
    ReviewText TEXT,
    Rating INTEGER,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
    -- Add foreign key for UserID to reference a User table if exists
);

-- Create table for Artists
CREATE TABLE IF NOT EXISTS Artists (
    ArtistName TEXT PRIMARY KEY,
    -- Add other relevant columns
    CONSTRAINT UC_Artist_Name UNIQUE (ArtistName)
);

-- Create table for ArtistSkills (many-to-many relationship)
CREATE TABLE IF NOT EXISTS ArtistSkills (
    ArtistName TEXT,
    Skill TEXT,
    PRIMARY KEY (ArtistName, Skill),
    FOREIGN KEY (ArtistName) REFERENCES Artists(ArtistName)
);

-- Create table for Roles
CREATE TABLE IF NOT EXISTS Roles (
    RoleID INTEGER PRIMARY KEY,
    RoleName TEXT
);

-- Create table for MovieRoles (to establish many-to-many relationship)
CREATE TABLE IF NOT EXISTS MovieRoles (
    MovieID INTEGER,
    ArtistName TEXT,
    RoleID INTEGER,
    PRIMARY KEY (MovieID, ArtistName, RoleID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ArtistName) REFERENCES Artists(ArtistName),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Add sample data with some real-world movies and artists
INSERT INTO Movies (Title, ReleaseYear) VALUES
    ('Inception', 2010),
    ('The Shawshank Redemption', 1994),
    ('Pulp Fiction', 1994),
    ('The Godfather', 1972);

INSERT INTO Media (MovieID, MediaType, MediaURL) VALUES
    (1, 'Video', 'http://example.com/inception_trailer.mp4'),
    (2, 'Video', 'http://example.com/shawshank_redemption_trailer.mp4'),
    (3, 'Video', 'http://example.com/pulp_fiction_trailer.mp4'),
    (4, 'Video', 'http://example.com/godfather_trailer.mp4');

INSERT INTO Genres (GenreName) VALUES
    ('Sci-Fi'),
    ('Drama'),
    ('Crime');

INSERT INTO MovieGenres (MovieID, GenreID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3);

INSERT INTO Reviews (MovieID, UserID, ReviewText, Rating) VALUES
    (1, 1, 'Mind-bending masterpiece!', 5),
    (2, 2, 'A timeless classic.', 5),
    (3, 3, 'Quentin Tarantino at his best!', 4),
    (4, 1, 'An offer you can''t refuse.', 5);

INSERT INTO Artists (ArtistName) VALUES
    ('Leonardo DiCaprio'),
    ('Morgan Freeman'),
    ('Tim Robbins'),
    ('Quentin Tarantino'),
    ('Marlon Brando');

INSERT INTO ArtistSkills (ArtistName, Skill) VALUES
    ('Leonardo DiCaprio', 'Acting'),
    ('Morgan Freeman', 'Acting'),
    ('Tim Robbins', 'Acting'),
    ('Quentin Tarantino', 'Directing'),
    ('Quentin Tarantino', 'Writing'),
    ('Marlon Brando', 'Acting');

INSERT INTO Roles (RoleName) VALUES
    ('Actor'),
    ('Director'),
    ('Writer');

INSERT INTO MovieRoles (MovieID, ArtistName, RoleID) VALUES
    (1, 'Leonardo DiCaprio', 1),
    (2, 'Morgan Freeman', 1),
    (2, 'Tim Robbins', 1),
    (3, 'Quentin Tarantino', 2),
    (3, 'Quentin Tarantino', 3),
    (4, 'Marlon Brando', 1);

-- Retrieve data from the Movies table
SELECT * FROM Movies;

-- Retrieve data from the Media table
SELECT * FROM Media;

-- Retrieve data from the Genres table
SELECT * FROM Genres;

-- Retrieve data from the MovieGenres table
SELECT * FROM MovieGenres;

-- Retrieve data from the Reviews table
SELECT * FROM Reviews;

-- Retrieve data from the Artists table
SELECT * FROM Artists;

-- Retrieve data from the ArtistSkills table
SELECT * FROM ArtistSkills;

-- Retrieve data from the Roles table
SELECT * FROM Roles;

-- Retrieve data from the MovieRoles table
SELECT * FROM MovieRoles;
