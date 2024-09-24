--Query Top Performing Teams from 1930 to 2022
SELECT *
FROM [FIFA].[dbo].[Qualifying_Teams]
WHERE ([TeamRank] BETWEEN 1 AND 4) AND ([Year] BETWEEN 1930 AND 2022)
ORDER BY [Team] ASC, [TeamRank] ASC, [Year] DESC;
