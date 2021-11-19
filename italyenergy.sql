-- create dataset
CREATE DATABASE energy
-- import share_v1, capitaelectricitycons_v1, electricitygeneration_v1


-- check if share_v1 is correctly imported
SELECT *
FROM [energy].[dbo].[share] 
WHERE country = 'Italy';
--check if capitaelectricitycons_v1 is correctly imported
SELECT *
FROM [energy].[dbo].[capitaelectricitycon]
WHERE country = 'Italy';
-- check if electricitygeneration is correctly imported
SELECT *
FROM [energy].[dbo].[electricitygeneration]
WHERE country = 'Italy';


-- I performed a control on years variable 
-- Check years variable: share min
SELECT MIN(years)
FROM [energy].[dbo].[share] 
WHERE country = 'Italy'; --1985
--Check years: share max
SELECT MAX(years)
FROM [energy].[dbo].[share] 
WHERE country = 'Italy'; --2020
--Check years: capitaelectricitycon min
SELECT MIN(years)
FROM [energy].[dbo].[capitaelectricitycon]
WHERE country = 'Italy'; --1985
--Check years: capitaelectricitycon max
SELECT MAX(years)
FROM [energy].[dbo].[capitaelectricitycon]
WHERE country = 'Italy'; --2020
-- Check years: electricitygeneration min
SELECT MIN(years)
FROM [energy].[dbo].[electricitygeneration]
WHERE country = 'Italy'; --1985
-- Check years: electricitygeneration max
SELECT MAX(years)
FROM [energy].[dbo].[electricitygeneration]
WHERE country = 'Italy'; --2020
-- Each imported table has the same maximum value and the same minimum value for the years value 


-- Join tables and creation of the final dataset
SELECT c.years,
    a.percapitaelectricity,
	b.electricitygeneration,
	c.coal,
	c.gas,
	c.hydro,
	c.solar, 
	c.wind,
	c.oil,
	c.nuclear,
	c.others
FROM [energy].[dbo].[capitaelectricitycon] AS a
INNER JOIN [energy].[dbo].[electricitygeneration] AS b
ON a.years = b.years
AND a.country = b.country 
INNER JOIN [energy].[dbo].[share] AS c
ON a.years = c.years
AND a.country = c.country
WHERE a.country = 'Italy'; 


-- save results
