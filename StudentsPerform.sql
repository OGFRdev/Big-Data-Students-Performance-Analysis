use StudentsPerformance
go

select * from StudentsPerformance

-- 1. What is the distribution of students by gender?

select Gender, count(*) as Student_Count from StudentsPerformance
group by Gender;

-- 2. Does parental level of education affect students performance?

select Parental_Level_Of_Education, 
avg(Math_Score) as avg_math, 
avg(Reading_Score) as avg_reading, 
avg(Writing_Score) as avg_writing from StudentsPerformance
group by Parental_Level_Of_Education
order by avg_math desc;

-- 3. How do average scores compare between male and female?

select Gender, 
avg(Average) as Overall_Average_Score from StudentsPerformance
group by Gender;

-- 4. Which race/ethnicity has the highest average scores?

select Race_Ethnicity,
avg(Average) as Overall_Average_Score from StudentsPerformance
group by Race_Ethnicity
order by Overall_Average_Score desc;

-- 5. Do students with standard lunch perform better than those with free/reduced lunch?

select Lunch,
avg(Average) as Overall_Average_Score from StudentsPerformance
group by Lunch
order by Overall_Average_Score desc;

-- 6. Did students who took test prep perform better than those who didn’t?

select Test_Preparation_Course,
avg(Average) as Overall_Average_Score from StudentsPerformance
group by Test_Preparation_Course
order by Overall_Average_Score desc;

-- 7. Does test prep affect genders differently? 

select Gender, Test_Preparation_Course,
avg(Average) as Overall_Average_Score from StudentsPerformance
group by Gender, Test_Preparation_Course
order by Overall_Average_Score desc;

-- 8. How many students scored above 90 in all three subjects? 

select count(*) as Best_Students from StudentsPerformance
where Math_Score > 90 and Reading_Score > 90 and Writing_Score > 90;

-- 9. How many students are struggling (scores < 50 in any subject)?

select count(*) as Poor_Performing from StudentsPerformance
where Math_Score < 50 and Reading_Score < 50 and Writing_Score < 50;

