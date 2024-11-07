/*
Question: What are the top-paying software engineer jobs?
- Identify the top 30 highest-paying Software Engineer roles that are available in Poland or remotely.
- Focus on job postings with specified salaries (without nulls).
*/

SELECT
    job_title,
    job_location,
    name AS company_name,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Software Engineer' AND
    (job_location LIKE '%Poland%' OR job_location = 'Anywhere') AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 30
