/*
Question: What are the top skills based on salary?
- We're looking at the average salary associated with each skill for software engineers
- Focusing on roles with specified salaries, regardless of location
- Why do we do this? We reveal how different skills impact on salary for software engineers
    and help to identify the "must have" skills that should be studied or improved
*/
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Software Engineer' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 25

/*
Data and Database Skills Dominate: Top salaries go to experts in scalable databases like Cassandra, 
Neo4j, and DynamoDB, reflecting a high demand for managing large and complex data systems.

Specialized Languages & Frameworks: Niche languages (Assembly, Julia, Clojure) and 
high-demand web frameworks (ASP.NET Core, Ruby on Rails, Node.js) command premium pay, 
especially in performance-critical and full-stack roles.

Cloud & Data Visualization on the Rise: Skills in cloud-native tools (Go, Aurora) 
and data visualization/BI platforms (Matplotlib, Looker) are highly valued as companies 
prioritize cloud scalability and data-driven decision-making.

[
  {
    "skills": "cassandra",
    "average_salary": "213333"
  },
  {
    "skills": "debian",
    "average_salary": "196500"
  },
  {
    "skills": "neo4j",
    "average_salary": "183840"
  },
  {
    "skills": "couchbase",
    "average_salary": "166250"
  },
  {
    "skills": "assembly",
    "average_salary": "157188"
  },
  {
    "skills": "asp.net core",
    "average_salary": "155000"
  },
  {
    "skills": "ruby on rails",
    "average_salary": "149500"
  },
  {
    "skills": "dynamodb",
    "average_salary": "148813"
  },
  {
    "skills": "node",
    "average_salary": "145147"
  },
  {
    "skills": "aurora",
    "average_salary": "144561"
  },
  {
    "skills": "express",
    "average_salary": "143816"
  },
  {
    "skills": "go",
    "average_salary": "142748"
  },
  {
    "skills": "julia",
    "average_salary": "142500"
  },
  {
    "skills": "workfront",
    "average_salary": "142430"
  },
  {
    "skills": "sharepoint",
    "average_salary": "141454"
  },
  {
    "skills": "clojure",
    "average_salary": "140000"
  },
  {
    "skills": "next.js",
    "average_salary": "138433"
  },
  {
    "skills": "matplotlib",
    "average_salary": "137675"
  },
  {
    "skills": "mongo",
    "average_salary": "137502"
  },
  {
    "skills": "alteryx",
    "average_salary": "137500"
  },
  {
    "skills": "golang",
    "average_salary": "136685"
  },
  {
    "skills": "node.js",
    "average_salary": "136657"
  },
  {
    "skills": "looker",
    "average_salary": "134431"
  },
  {
    "skills": "atlassian",
    "average_salary": "134000"
  },
  {
    "skills": "c",
    "average_salary": "133721"
  }
]

*/