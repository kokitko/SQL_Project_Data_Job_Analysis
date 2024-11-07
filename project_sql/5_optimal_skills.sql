/*
Question: What are the most optimal skills to learn?
- Identify skills in high demand and associated with high average salaries for software engineers
- Concentrate on remote positions with specified salaries
- Why do we do this? We're targeting skills that offer job security (high demand) and financial
    benefits (high salaries), offering strategies insights for career development in software engineering 
*/
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Software Engineer'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = true
    GROUP BY
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS average_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Software Engineer'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = true
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 5
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 20;

-- Code with the same logic but written without subqueries
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Software Engineer' AND
    salary_year_avg IS NOT NULL
    AND job_work_from_home = true
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) > 5
ORDER BY
    average_salary DESC,
    demand_count DESC
LIMIT 20;