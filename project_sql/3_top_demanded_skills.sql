/*
Question: What are the most in-demand skills for software engineers?
- Identify the top 5 in-demand skills for a software engineer
- Focus on all job postings
- Why do we do this? Retrieves the top 5 skills with the highest demand
    in the job market, providing insights into the most valuable skills for future software engineers.
*/
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Software Engineer' AND
    job_work_from_home = true
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5