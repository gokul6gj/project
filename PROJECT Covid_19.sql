-- 1) set the DataBase Your working with :
use project ;

-- 2) select data that  we are going to be use it :

select Country,
	Population,
	Total_Cases,
	Total_Tests,
	Total_Recovered,
	Total_deaths
	from project.covid_19
	order by 1 ;
 
-- 3) Country-wise total cases, total tests, total recovered, and total deaths
 
select Country,
	Total_Cases as Total_Cases, 
	Total_Tests as Total_Tests, 
	Total_Recovered as Total_Recovered, 
	Total_deaths as Total_Deaths
	from project.covid_19 
	WHERE Total_Recovered>1;

-- 4) Countries with the highest Cases:

SELECT Country , Total_Cases 
	FROM project.covid_19 
	ORDER BY Total_Cases DESC
	LIMIT 10 ;
    
-- 5) Countries with the highest tests:

SELECT Country , Total_Tests
	FROM project.covid_19 
    WHERE Total_Tests >=1
	ORDER BY Total_Cases DESC
	LIMIT 10 ;


-- 6) Countries with the highest Recovery_Cases:

SELECT Country , Total_Recovered 
	FROM project.covid_19 
	WHERE Total_Recovered >=1
	ORDER BY Total_Cases DESC
	LIMIT 10 ;

-- 7) Countries with the highest Death_Cases:

SELECT Country , Total_Deaths
	FROM project.covid_19 
	ORDER BY Total_Cases DESC
	LIMIT 10 ;
    
-- 8) Countries with the highest CASES RATE Percentage (cases per population):

SELECT Country,
	(SUM(Total_Cases) / SUM(population)*100) as Cases_Rate_Percentage
	FROM project.covid_19
	group by Country
	order by Cases_rate_Percentage DESC
    LIMIT 10;
    
-- 9) Countries with the highest TESTS RATE  (tests per population):

SELECT Country,
	(SUM(Total_tests) / SUM(population)) as Testing_Rate
	FROM project.covid_19
	group by Country
	order by Testing_rate DESC
    LIMIT 10;
    
-- 10) Countries with the highest RECOVERY RATE Percentage (Recovery per Total_cases):

SELECT Country,
	(SUM(Total_Recovered) / SUM(Total_Cases)*100) as Recovery_Rate_Percentage
	FROM project.covid_19
	group by Country
	order by Recovery_rate_percentage DESC
    LIMIT 10 ;

-- 11) Countries with the highest MORTALITY RATE Percentage Wise (deaths per total cases):

 SELECT 
	Country,
	(SUM(Total_Deaths) / SUM(Total_Cases)*100) AS Mortality_Rate_Percentage
	FROM project.covid_19
	GROUP BY Country
	ORDER BY mortality_rate_Percentage DESC
    LIMIT 10;

-- 12) the percentage of total cases Rate worldwide:

SELECT 
	 SUM(Population) AS Population_WorldWide,	
     SUM(Total_Cases) AS Total_Cases_WorldWide,
     (SUM(Total_Cases) / SUM(Population)*100) Cases_Rate_Percentage_WorldWide
     FROM project.covid_19 ;
	
 -- 13) the percentage of total Tests Rate worldwide:

SELECT 
	 SUM(Population) AS Population_WorldWide,	
     SUM(Total_Tests) AS Total_Tests_WorldWide,
     (SUM(Total_Tests) / SUM(Population)*100) Tests_Rate_Percentage_WorldWide
     FROM project.covid_19 ;   
    
-- 14) the percentage of recovered cases  worldwide:

SELECT 
	 SUM(Total_Cases) AS Total_Cases_WorldWide,	
     SUM(Total_Recovered) AS Total_Recovered_WorldWide,
     (SUM(Total_recovered) / SUM(Total_cases)*100) Recovery_Rate_Percentage_WorldWide
	FROM project.covid_19 ;
     
-- 15) the mortality rate (deaths per total cases) worldwide Percentage:
   
   SELECT 
	 SUM(Total_Cases) AS Total_Cases_WorldWide,	
     SUM(Total_Deaths) AS Total_Deaths_WorldWide,
     (SUM(Total_Deaths) / SUM(Total_cases)*100) Mortality_Rate_Rercentage_WorldWide
     FROM project.covid_19 ;

-- 16) the total number of Covid_19 reports worldwide:

select 
	sum(Total_Cases) as total_cases_WorldWide, 
	sum(Total_Tests) as total_tests_WorldWide, 
	sum(Total_Recovered) as total_recovered_WorldWide, 
	sum(Total_deaths) as total_deaths_WorldWide
	from project.covid_19;