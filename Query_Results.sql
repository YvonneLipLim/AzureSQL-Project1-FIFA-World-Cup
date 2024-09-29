--Q1. Which teams qualified for the World Cup from 1930 to 2022?
--The results would consist of 11 columns after adding Continent column from dbo.TeamContinent table using JOIN 
SELECT wc.Year, wc.TeamRank, wc.Team AS Team, tc.Continent, wc.TotalGamesPlayed, wc.Win, wc.Draw, wc.Loss, wc.GoalsScored, wc.GoalsLoss, wc.Points
FROM FIFA.dbo.WorldCup_Combined_Results wc
JOIN dbo.TeamContinents tc ON wc.Team = tc.TeamName
ORDER BY [Year] DESC;


--Q2. Which were the teams that reached the top 4 from 1930 to 2022?
--The results would be the Top 4 Winning Teams for each World Cup Year including a new column for Total Teams participated.
SELECT [Year],
    MAX(CASE WHEN TeamRank = 1 THEN Team END) AS Champion,
    MAX(CASE WHEN TeamRank = 2 THEN Team END) AS Runner_Up,
    MAX(CASE WHEN TeamRank = 3 THEN Team END) AS Third_Place,
    MAX(CASE WHEN TeamRank = 4 THEN Team END) AS Fourth_Place,
    COUNT(DISTINCT Team) AS TotalTeams
FROM dbo.WorldCup_Combined_Results
GROUP BY [Year]
ORDER BY [Year] DESC;


--Q3. Which were the teams that were eliminated at the quarter-final stage?
--The results would display teams who didn't enter the quarter-final stage.
SELECT DISTINCT wc.Year, wc.TeamRank, wc.Team AS Team, tc.Continent, wc.TotalGamesPlayed, wc.Win, wc.Draw, wc.Loss, wc.GoalsScored, wc.GoalsLoss, wc.Points
FROM FIFA.dbo.WorldCup_Combined_Results wc
JOIN dbo.TeamContinents tc ON wc.Team = tc.TeamName
WHERE [TeamRank] > 8
ORDER BY [Year] DESC;


--Q4. Which teams had won the most World Cup titles from 1930 to 2022?
--The results would display the team with the most titles and the total wins for all World Cups.
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
--The results would display the team with total goals scored for all World Cups.
SELECT Team,  
        SUM(Win) AS TotalWin,
        SUM(Draw) AS TotalDraw,
        SUM(Loss) AS TotalLost,
        SUM(GoalsScored) AS TotalGoalsScored, 
        SUM(GoalsLoss) AS TotalGoalsLoss,
        SUM(GoalsScored) - SUM(GoalsLoss) AS GoalsDifference,
        SUM((Win) * 3 + Draw * 1) AS TotalPoints
FROM FIFA.dbo.WorldCup_Combined_Results
GROUP BY Team
ORDER BY TotalPoints DESC, Team DESC;


--Q6 Performance of the teams for each World Cup
--The results would display the respective teams' points for each World Cup.
SELECT wc.Team, 
       tc.Continent, 
       wc.Year,
       SUM(wc.Win) AS Win,
       SUM(wc.Draw) AS Draw,
       SUM(wc.Loss) AS Lost,
       SUM(wc.GoalsScored) AS TotalGoalsScored, 
       SUM(wc.GoalsLoss) AS TotalGoalsLoss,
       SUM(wc.GoalsScored) - SUM(wc.GoalsLoss) AS GoalsDifference,
       SUM((wc.Win) * 3 + wc.Draw * 1) AS TotalPoints
FROM FIFA.dbo.WorldCup_Combined_Results wc
JOIN dbo.TeamContinents tc ON wc.Team = tc.TeamName
GROUP BY wc.Team, tc.Continent, wc.Year
ORDER BY wc.Team, wc.Year;
