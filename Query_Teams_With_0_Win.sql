--Query Teams With Zero Win Per World Cup Year
SELECT *
FROM [FIFA].[dbo].[Qualifying_Teams]
WHERE [Win] < 1
ORDER BY [Year] DESC;
