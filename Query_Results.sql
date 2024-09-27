--Q1. Which teams qualified for the World Cup from 1930 to 2022?
SELECT wc.Year, wc.TeamRank, wc.Team AS Team, tc.Continent, wc.TotalGamesPlayed, wc.Win, wc.Draw, wc.Loss, wc.GoalsScored, wc.GoalsLoss, wc.Points
FROM FIFA.dbo.WorldCup_Combined_Results wc
JOIN dbo.TeamContinents tc ON wc.Team = tc.TeamName
ORDER BY [Year] DESC;


--Q2. Which were the teams that reached the top 4 from 1930 to 2022?
SELECT [Year],
    MAX(CASE WHEN TeamRank = 1 THEN Team END) AS Champion,
    MAX(CASE WHEN TeamRank = 2 THEN Team END) AS Runner_Up,
    MAX(CASE WHEN TeamRank = 3 THEN Team END) AS Third_Place,
    MAX(CASE WHEN TeamRank = 4 THEN Team END) AS Fourth_Place
FROM dbo.WorldCup_Combined_Results
GROUP BY [Year]
ORDER BY [Year] DESC;


--Q3. Which were the teams that were eliminated at the knock-out stage from 1930 to 2022?
SELECT wc.Year, wc.TeamRank, wc.Team AS Team, tc.Continent, wc.TotalGamesPlayed, wc.Win, wc.Draw, wc.Loss, wc.GoalsScored, wc.GoalsLoss, wc.Points
FROM FIFA.dbo.WorldCup_Combined_Results wc
JOIN dbo.TeamContinents tc ON wc.Team = tc.TeamName
WHERE [TeamRank] > 16
ORDER BY [Year] DESC;


--Q4. Which teams had won the most champion titles from 1930 to 2022?
SELECT *
FROM (
    SELECT 
        Team,
        COUNT(CASE WHEN TeamRank = 1 THEN 1 END) AS Champion,
        COUNT(CASE WHEN TeamRank = 2 THEN 1 END) AS Runner_Up,
        COUNT(CASE WHEN TeamRank = 3 THEN 1 END) AS Third_Place,
        COUNT(CASE WHEN TeamRank = 4 THEN 1 END) AS Fourth_Place,
        (COUNT(CASE WHEN TeamRank = 1 THEN 1 END) + COUNT(CASE WHEN TeamRank = 2 THEN 1 END) + COUNT(CASE WHEN TeamRank = 3 THEN 1 END) + COUNT(CASE WHEN TeamRank = 4 THEN 1 END)) AS TotalWins
    FROM dbo.WorldCup_Combined_Results
    WHERE [Year] BETWEEN 1930 AND 2022
    GROUP BY Team
) AS Subquery
WHERE Champion > 0 OR Runner_Up > 0 OR Third_Place > 0 OR Fourth_Place > 0
ORDER BY Champion DESC, TotalWins DESC, Team ASC;


--Q5. Which teams scored the most goals throughout the World Cups?
SELECT Team, SUM(GoalsScored) AS TotalGoalsScored
FROM dbo.WorldCup_Combined_Results
GROUP BY Team
ORDER BY TotalGoalsScored DESC; 
