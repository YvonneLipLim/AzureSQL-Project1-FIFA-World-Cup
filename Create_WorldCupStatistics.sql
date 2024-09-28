--Create a new table to add Host Country, Winning Coach, Top Scorer and Best Player for each World Cup
CREATE TABLE WorldCupStatistics (
    Year INT,
    Host VARCHAR(100),
    Champion VARCHAR(100),
    WinningCoachName VARCHAR(100),
    TopScorerTeam VARCHAR(100),
    TopScorerName VARCHAR(100),
    TopScorerTotalGoals INT,
    BestPlayerTeam VARCHAR(100),
    BestPlayerName VARCHAR(100)
);

-- Corrected INSERT INTO statement
INSERT INTO WorldCupStatistics (Year, Host, Champion, WinningCoachName, TopScorerTeam, TopScorerName, TopScorerTotalGoals, BestPlayerTeam, BestPlayerName) 
VALUES 
    ('1930', 'Uruguay', 'Uruguay', 'Alberto Suppici', 'Argentina', 'Guillermo Stábile', '8', ' ', 'Not awarded'),
    ('1934', 'Italy', 'Italy', 'Vittorio Pozzo', 'Czechoslovakia', 'Oldřich Nejedlý', '5', ' ', 'Not awarded'),
    ('1938', 'France', 'Italy', 'Vittorio Pozzo', 'Brazil', 'Leônidas', '7', ' ', 'Not awarded'),
    ('1950', 'Brazil', 'Uruguay', 'Juan López', 'Brazil', 'Ademir', '9', ' ', 'Not awarded'),
    ('1954', 'Switzerland', 'Germany', 'Sepp Herberger', 'Hungary', 'Sándor Kocsis', '11', ' ', 'Not awarded'),
    ('1958', 'Sweden', 'Brazil', 'Vicente Feola', 'France', 'Just Fontaine', '13', ' ', 'Not awarded'),
    ('1962', 'Chile', 'Brazil', 'Aymoré Moreira', 'France', 'Six players', '4', ' ', 'Not awarded'),
    ('1966', 'England', 'England', 'Alf Ramsey', 'Portugal', 'Eusébio', '9', ' ', 'Not awarded'),
    ('1970', 'Mexico', 'Brazil', 'Mário Zagallo', 'Germany', 'Gerd Müller', '10', ' ','Not awarded'),
    ('1974', 'Germany', 'Germany', 'Helmut Schön', 'Poland', 'Grzegorz Lato', '7', ' ', 'Not awarded'),
    ('1978', 'Argentina', 'Argentina', 'César Luis Menotti', 'Argentina', 'Mario Kempes', '6', 'Argentina', 'Mario Kempes'),
    ('1982', 'Spain', 'Italy', 'Enzo Bearzot', 'Italy', 'Paolo Rossi', '6', 'Italy', 'Paolo Rossi'),
    ('1986', 'Mexico', 'Argentina', 'Carlos Bilardo', 'England', 'Gary Lineker', '6', 'Argentina', 'Diego Maradona'),
    ('1990', 'Italy', 'Germany', 'Franz Beckenbauer', 'Italy', 'Salvatore Schillaci', '6', 'Italy', 'Salvatore Schillaci'),
    ('1994', 'United States', 'Brazil', 'Carlos Alberto Parreira', 'Hungary', 'Hristo Stoichkov', '6', 'Brazil', 'Romário'),
    ('1998', 'France', 'France', 'Aimé Jacquet', 'Croatia', 'Davor Šuker', '6', 'Brazil', 'Ronaldo'),
    ('2002', 'South Korea, Japan', 'Brazil', 'Luiz Felipe Scolari', 'Brazil', 'Ronaldo', '8', 'Germany', 'Oliver Kahn'),
    ('2006', 'Germany', 'Italy', 'Marcello Lippi', 'Germany', 'Miroslav Klose', '5', 'France', 'Zinedine Zidane'),
    ('2010', 'South Africa', 'Spain', 'Vicente del Bosque', ' ', 'Four players', '5', 'Uruguay', 'Diego Forlán'),
    ('2014', 'Brazil', 'Germany', 'Joachim Löw', 'Colombia', 'James Rodríguez', '6', 'Argentina', 'Lionel Messi'),
    ('2018', 'Russia', 'France', 'Didier Deschamps', 'England', 'Harry Kane', '6', 'Croatia', 'Luka Modrić'),
    ('2022', 'Qatar', 'Argentina', 'Lionel Scaloni', 'France', 'Kylian Mbappé', '8', 'Argentina', 'Lionel Messi');


--Query the new WorldCupStatistics table
SELECT *
FROM dbo.WorldCupStatistics
