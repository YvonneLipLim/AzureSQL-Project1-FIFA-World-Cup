--Q1. Which teams qualified for the World Cup from 1930 to 2022?
SELECT *
FROM [FIFA].[dbo].[Qualifying_Teams]
ORDER BY [Year] DESC;

--Q2. Which were the teams that reached the top 4 from 1930 to 2022?
SELECT [Year],
    MAX(CASE WHEN TeamRank = 1 THEN Team END) AS Champion,
    MAX(CASE WHEN TeamRank = 2 THEN Team END) AS "Runner_Up",
    MAX(CASE WHEN TeamRank = 3 THEN Team END) AS "Third_Place",
    MAX(CASE WHEN TeamRank = 4 THEN Team END) AS "Fourth_Place"
FROM dbo.WorldCup_Combined_Results
GROUP BY Year
ORDER BY [Year] DESC;

--Q3. Which were the teams that were eliminated at the knock-out stage from 1930 to 2022?
SELECT *
FROM dbo.WorldCup_Combined_Results
WHERE [TeamRank] > 16
ORDER BY [Year] DESC;

--Q4. Which top 4 teams had won the most champion titles from 1930 to 2022?
SELECT 
    CASE 
        WHEN Team = 'West Germany' THEN 'Germany'
        ELSE Team
    END AS Team,
    COUNT(CASE WHEN TeamRank = 1 THEN 1 END) AS Champion,
    COUNT(CASE WHEN TeamRank = 2 THEN 1 END) AS Runner_Up,
    COUNT(CASE WHEN TeamRank = 3 THEN 1 END) AS Third_Place,
    COUNT(CASE WHEN TeamRank = 4 THEN 1 END) AS Fourth_Place,
    (COUNT(CASE WHEN TeamRank = 1 THEN 1 END) + COUNT(CASE WHEN TeamRank = 2 THEN 1 END) + COUNT(CASE WHEN TeamRank = 3 THEN 1 END) + COUNT(CASE WHEN TeamRank = 4 THEN 1 END)) AS TotalWins
FROM dbo.WorldCup_Combined_Results
WHERE [Year] BETWEEN 1930 AND 2022
GROUP BY 
    CASE 
        WHEN Team = 'West Germany' THEN 'Germany'
        ELSE Team
    END
ORDER BY Champion DESC, TotalWins DESC, Team ASC;
