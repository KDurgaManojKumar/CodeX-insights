/*1a */
select gender as Gender, count(respondent_id) as "Total Responses"
from dim_repondents
group by gender
order by count(respondent_id) desc;
/*1b */
select age as "Age Group",
count(respondent_id) as "Total Respondents"
from dim_repondents
group by age
order by count(respondent_id) desc;

/*1c */
SELECT Marketing_channels, COUNT(*) AS Reach_Count_for_youth
FROM fact_survey_responses
JOIN dim_repondents ON fact_survey_responses.Respondent_ID = dim_repondents.respondent_ID
WHERE dim_repondents.age in ('15-18','19-30')
GROUP BY Marketing_channels
ORDER BY Reach_Count DESC;

/*2a */
SELECT Ingredients_expected, COUNT(*) AS Preference_Count
FROM fact_survey_responses
GROUP BY Ingredients_expected
order by Preference_count desc ;

/* 2b */
SELECT Packaging_preference, COUNT(*) AS Preference_Count
FROM fact_survey_responses
GROUP BY Packaging_preference
order by Preference_count  desc;

/* 3a */ 
SELECT Current_brands, COUNT(*) AS Brand_Count
FROM fact_survey_responses
GROUP BY Current_brands
ORDER BY Brand_Count DESC;

/* 3b */
SELECT Reasons_for_choosing_brands, COUNT(*) AS Reason_Count
FROM fact_survey_responses
GROUP BY Reasons_for_choosing_brands
ORDER BY Reason_Count DESC;

/* 4 a */
SELECT Marketing_channels, COUNT(*) AS Respondent_ID 
FROM fact_survey_responses
GROUP BY Marketing_channels
ORDER BY Respondent_ID DESC;

/* 4 b */
SELECT Marketing_channels, COUNT(*) AS Response_Count, SUM(CASE WHEN Heard_before = 'Yes' THEN 1 ELSE 0 END) AS Heard_Count
FROM fact_survey_responses
where Current_brands = "CodeX"
GROUP BY Marketing_channels
ORDER BY Response_Count DESC;

/* 5a */

SELECT AVG(Taste_experience) AS Overall_Rating
FROM fact_survey_responses
WHERE current_brands = 'CodeX';

/* 5b */
SELECT c.City, COUNT(*) AS Respondent_Count
FROM dim_repondents r
JOIN dim_cities c ON r.City_ID = c.City_ID
GROUP BY c.City
ORDER BY Respondent_Count DESC;



/* 6a */
SELECT Purchase_location, COUNT(*) AS Preference_Count
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY Preference_Count DESC;

/* 6b */
SELECT Typical_consumption_situations, COUNT(*) AS Situation_Count
FROM fact_survey_responses
GROUP BY Typical_consumption_situations
ORDER BY Situation_Count DESC;

/* 6c */

SELECT Price_Range, Limited_Edition_Packaging, COUNT(*) AS Respondent_Count
FROM fact_survey_responses
GROUP BY Price_Range, Limited_Edition_Packaging;

/* 7a */

SELECT 
    CASE 
        WHEN Brand_Perception = 'Positive' THEN 'Branding'
        WHEN Taste_Experience >= 4 THEN 'Taste'
        WHEN Current_Brands like '%CodeX%' THEN 'Availability'
        ELSE 'Other'
    END AS Focus_Area,
COUNT(*) AS Respondent_Count
FROM fact_survey_responses
GROUP BY Focus_Area
order by Focus_Area desc;



SELECT Age, City, COUNT(*) AS Respondent_Count
FROM dim_repondents
GROUP BY Age, City
ORDER BY Respondent_Count DESC;



