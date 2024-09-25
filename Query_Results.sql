--Query Qualifying Teams from 1930 to 2022
SELECT *
FROM [FIFA].[dbo].[Qualifying_Teams]
ORDER BY [Year] DESC;

--Query Top 4 Winning Teams for each World Cup
SELECT [Year],
    MAX(CASE WHEN TeamRank = 1 THEN Team END) AS Champion,
    MAX(CASE WHEN TeamRank = 2 THEN Team END) AS "Runner_Up",
    MAX(CASE WHEN TeamRank = 3 THEN Team END) AS "Third_Place",
    MAX(CASE WHEN TeamRank = 4 THEN Team END) AS "Fourth_Place"
FROM dbo.WorldCup_Combined_Results
GROUP BY Year
ORDER BY [Year] DESC;
