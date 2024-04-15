Use covid_capstone_2;

select * from corona_tested_006
limit 10;

-- Number of Corona patients with Shortness of Breath

SELECT COUNT(*) AS Shortness_of_Breath_Count
FROM corona_tested_006
WHERE Shortness_of_Breath = 'TRUE';

-- Number of Negative Corona Patients with Fever and Sore Throat

SELECT COUNT(*) AS Fever_Sore_Throat_Count
FROM corona_tested_006
WHERE Corona = 'Negative' AND Fever = 'TRUE' AND Sore_Throat = 'TRUE';

-- Ranking Positve Cases by Month

SELECT MONTH(Test_Date) AS Test_Month, COUNT(*) AS Positive_Cases
FROM corona_tested_006
WHERE Corona = 'Positive'
GROUP BY Test_Month
ORDER BY Positive_Cases DESC;

-- Female Negative Corona Patients with Cough and Headache

SELECT COUNT(*) AS Female_Negative_Count
FROM corona_tested_006
WHERE Sex = 'Female' AND Corona = 'Negative' AND Cough_symptoms = 'TRUE' AND Headache = 'TRUE';

-- Elderly Corona Patients with Breathing Problems

SELECT COUNT(*) AS Elderly_Breathing_Problems_Count
FROM corona_tested_006
WHERE Age_60_Above = 'Yes' AND Corona = 'Positive' AND Shortness_of_Breath = 'TRUE';

-- Most Common symptoms among COVID Positive patients 

SELECT SUM(Cough_symptoms='True') AS Cough_Count, SUM(Fever='True') AS Fever_Count, SUM(Shortness_of_Breath='True') AS Shortness_of_Breath_Count,SUM(Sore_Throat='True') AS Sore_Throat_Count
FROM corona_tested_006
WHERE Corona = 'Positive';

-- Less Common Symptoms among COVID Negative patients 

SELECT SUM(Cough_symptoms='True') AS Cough_Count, SUM(Fever='True') AS Fever_Count, SUM(Shortness_of_Breath='True') AS Shortness_of_Breath_Count,SUM(Sore_Throat='True') AS Sore_Throat_Count
FROM corona_tested_006
WHERE corona = 'Negative';

-- Most common Symptoms among covid positive males with contact abroad

SELECT SUM(Cough_symptoms='True') AS Cough_Count, SUM(Fever='True') AS Fever_Count, SUM(Shortness_of_Breath='True') AS Shortness_of_Breath_Count,SUM(Sore_Throat='True') AS Sore_Throat_Count
FROM corona_tested_006
WHERE corona = 'Positive' and sex='male' and known_contact ='Abroad';