/*
Question: What skills are required for the top-paying software engineer jobs?
- Use the top highest-paying jobs (in Poland or remote ones) from the first query
- Add the specific skills required for these roles
- Why do we do this? To provide a much more detailed look at which high-paying jobs demand certain skills, 
    helping future software engineers understand which skill to develop that align with the highest salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC

/*
Here's an analysis of the top skills in high-paying software engineering roles for 2023

Key Highlights 🚀

Python 🐍 takes the lead as the top-demanded skill for lucrative software engineering positions.
Its versatility across data science, automation, and web development makes it a must-have.

SQL 💾 remains a cornerstone, reflecting the critical need for data management and manipulation across applications.

Cloud expertise ☁️, especially in AWS and Azure, is highly sought-after, as companies continue to 
migrate and scale their infrastructure online.

Web Development 💻 skills like TypeScript, JavaScript, and React are essential, 
showcasing a strong demand for both front-end and full-stack capabilities.

Data Platforms 📊 like MongoDB and Snowflake highlight the importance of modern, 
scalable databases, especially as companies work with larger datasets.

[
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "python"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "javascript"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "typescript"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "azure"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "aws"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "snowflake"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "spark"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "225000.0",
    "company_name": "Datavant",
    "skills": "react"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "python"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "elasticsearch"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "dynamodb"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "aws"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "snowflake"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "pandas"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "airflow"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "react"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "graphql"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "SmarterDx",
    "skills": "node.js"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "Huckleberry Labs",
    "skills": "python"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "Huckleberry Labs",
    "skills": "aws"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "job_location": "Anywhere",
    "salary_year_avg": "205000.0",
    "company_name": "Huckleberry Labs",
    "skills": "gcp"
  },
  {
    "job_id": 1231528,
    "job_title": "Senior Software Engineer, Server Security",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1231528,
    "job_title": "Senior Software Engineer, Server Security",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1398776,
    "job_title": "Senior Software Engineer, Cluster Scalability",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1398776,
    "job_title": "Senior Software Engineer, Cluster Scalability",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "Orbis",
    "skills": "typescript"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "Orbis",
    "skills": "ruby"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "job_location": "Anywhere",
    "salary_year_avg": "200000.0",
    "company_name": "Orbis",
    "skills": "ruby"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "javascript"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "css"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "react"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "graphql"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "node.js"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "191000.0",
    "company_name": "Webflow",
    "skills": "react.js"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "job_location": "Anywhere",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "python"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "job_location": "Anywhere",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "javascript"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "job_location": "Anywhere",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "typescript"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "job_location": "Anywhere",
    "salary_year_avg": "185000.0",
    "company_name": "Pulley",
    "skills": "golang"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "job_location": "Anywhere",
    "salary_year_avg": "184500.0",
    "company_name": "ConsenSys",
    "skills": "javascript"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "job_location": "Anywhere",
    "salary_year_avg": "184500.0",
    "company_name": "ConsenSys",
    "skills": "typescript"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "job_location": "Anywhere",
    "salary_year_avg": "184500.0",
    "company_name": "ConsenSys",
    "skills": "react"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "python"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "javascript"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "html"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "css"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "c#"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "mongodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "redis"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "mysql"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "elasticsearch"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "mongodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "dynamodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "couchbase"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "azure"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "aws"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "182500.0",
    "company_name": "Robert Half",
    "skills": "asp.net"
  },
  {
    "job_id": 40870,
    "job_title": "Senior Software Engineer, Query",
    "job_location": "Anywhere",
    "salary_year_avg": "174500.0",
    "company_name": "MongoDB",
    "skills": "c++"
  },
  {
    "job_id": 40870,
    "job_title": "Senior Software Engineer, Query",
    "job_location": "Anywhere",
    "salary_year_avg": "174500.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 40870,
    "job_title": "Senior Software Engineer, Query",
    "job_location": "Anywhere",
    "salary_year_avg": "174500.0",
    "company_name": "MongoDB",
    "skills": "c"
  },
  {
    "job_id": 40870,
    "job_title": "Senior Software Engineer, Query",
    "job_location": "Anywhere",
    "salary_year_avg": "174500.0",
    "company_name": "MongoDB",
    "skills": "rust"
  },
  {
    "job_id": 40870,
    "job_title": "Senior Software Engineer, Query",
    "job_location": "Anywhere",
    "salary_year_avg": "174500.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 176192,
    "job_title": "Lead Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "167500.0",
    "company_name": "Harnham",
    "skills": "typescript"
  },
  {
    "job_id": 176192,
    "job_title": "Lead Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "167500.0",
    "company_name": "Harnham",
    "skills": "ruby"
  },
  {
    "job_id": 176192,
    "job_title": "Lead Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "167500.0",
    "company_name": "Harnham",
    "skills": "redis"
  },
  {
    "job_id": 176192,
    "job_title": "Lead Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "167500.0",
    "company_name": "Harnham",
    "skills": "ruby"
  },
  {
    "job_id": 176192,
    "job_title": "Lead Software Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "167500.0",
    "company_name": "Harnham",
    "skills": "kubernetes"
  },
  {
    "job_id": 178098,
    "job_title": "Principal Software/Data Engineer (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "164500.0",
    "company_name": "Liberty Mutual Insurance",
    "skills": "sql"
  },
  {
    "job_id": 178098,
    "job_title": "Principal Software/Data Engineer (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "164500.0",
    "company_name": "Liberty Mutual Insurance",
    "skills": "python"
  },
  {
    "job_id": 178098,
    "job_title": "Principal Software/Data Engineer (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "164500.0",
    "company_name": "Liberty Mutual Insurance",
    "skills": "java"
  },
  {
    "job_id": 178098,
    "job_title": "Principal Software/Data Engineer (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "164500.0",
    "company_name": "Liberty Mutual Insurance",
    "skills": "dynamodb"
  },
  {
    "job_id": 178098,
    "job_title": "Principal Software/Data Engineer (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "164500.0",
    "company_name": "Liberty Mutual Insurance",
    "skills": "aws"
  },
  {
    "job_id": 178098,
    "job_title": "Principal Software/Data Engineer (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "164500.0",
    "company_name": "Liberty Mutual Insurance",
    "skills": "aurora"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "sql"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "python"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "postgresql"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "aurora"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "pandas"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "airflow"
  },
  {
    "job_id": 623792,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "161000.0",
    "company_name": "Vareto",
    "skills": "excel"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "sql"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "python"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "go"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "ruby"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "rust"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "kafka"
  },
  {
    "job_id": 309010,
    "job_title": "Senior Software Engineer - Data Systems - Remote",
    "job_location": "Anywhere",
    "salary_year_avg": "157500.0",
    "company_name": "Voltus",
    "skills": "ruby"
  },
  {
    "job_id": 238599,
    "job_title": "Senior ETL Developer (BN)",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "156500.0",
    "company_name": "Alter Solutions",
    "skills": "azure"
  },
  {
    "job_id": 238599,
    "job_title": "Senior ETL Developer (BN)",
    "job_location": "Warsaw, Poland",
    "salary_year_avg": "156500.0",
    "company_name": "Alter Solutions",
    "skills": "oracle"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "sql"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "python"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "java"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "shell"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "javascript"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "html"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "css"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "mongo"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "golang"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "neo4j"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "elasticsearch"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "sql server"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "azure"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "aws"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "oracle"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "snowflake"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "gcp"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "kafka"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "angular"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "jquery"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "linux"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "jenkins"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "github"
  },
  {
    "job_id": 84917,
    "job_title": "Software Engineer - Data Engineering/Enterprise App Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "ansible"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "sql"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "python"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "java"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "shell"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "javascript"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "html"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "css"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "mongo"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "golang"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "neo4j"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "elasticsearch"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "sql server"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "azure"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "aws"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "oracle"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "snowflake"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "gcp"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "kafka"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "angular"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "jquery"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "linux"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "jenkins"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "github"
  },
  {
    "job_id": 417162,
    "job_title": "Software Engineer - Data Engineering/Enterprise Application Platforms",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Cisco",
    "skills": "ansible"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "sql"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "python"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "c#"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "sql server"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "azure"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "snowflake"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "airflow"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "asp.net"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "asp.net core"
  },
  {
    "job_id": 682763,
    "job_title": "Senior Software Engineer (Data Science Enablement)",
    "job_location": "Anywhere",
    "salary_year_avg": "155000.0",
    "company_name": "Shelf Engine",
    "skills": "kubernetes"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "python"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "typescript"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "aws"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "bigquery"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "snowflake"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "react"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "django"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "linux"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "tableau"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "looker"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "kubernetes"
  },
  {
    "job_id": 384267,
    "job_title": "Software Engineer, Infrastructure",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "Secoda",
    "skills": "docker"
  },
  {
    "job_id": 1254612,
    "job_title": "Product Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "TipTop",
    "skills": "sql"
  },
  {
    "job_id": 1254612,
    "job_title": "Product Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "TipTop",
    "skills": "python"
  },
  {
    "job_id": 1254612,
    "job_title": "Product Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "TipTop",
    "skills": "bigquery"
  },
  {
    "job_id": 1254612,
    "job_title": "Product Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "TipTop",
    "skills": "react"
  },
  {
    "job_id": 1254612,
    "job_title": "Product Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "TipTop",
    "skills": "flow"
  },
  {
    "job_id": 1254612,
    "job_title": "Product Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "150000.0",
    "company_name": "TipTop",
    "skills": "github"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "sql"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "python"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "mysql"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "aws"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "pandas"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "numpy"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "airflow"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "django"
  },
  {
    "job_id": 1084354,
    "job_title": "Software Engineer, Platform Data Science (Remote)",
    "job_location": "Anywhere",
    "salary_year_avg": "140500.0",
    "company_name": "Terray Therapeutics",
    "skills": "fastapi"
  },
  {
    "job_id": 1207704,
    "job_title": "Performance Analyst",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Kforce Technology Staffing",
    "skills": "excel"
  },
  {
    "job_id": 143493,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "sql"
  },
  {
    "job_id": 143493,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "typescript"
  },
  {
    "job_id": 143493,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "gcp"
  },
  {
    "job_id": 143493,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "node"
  },
  {
    "job_id": 887258,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "sql"
  },
  {
    "job_id": 887258,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "typescript"
  },
  {
    "job_id": 887258,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "gcp"
  },
  {
    "job_id": 887258,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "graphql"
  },
  {
    "job_id": 887258,
    "job_title": "Founding fullstack engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "140000.0",
    "company_name": "Livedocs",
    "skills": "node"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "python"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "redis"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "mysql"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "postgresql"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "azure"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "aws"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "snowflake"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "gcp"
  },
  {
    "job_id": 596116,
    "job_title": "Senior Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "138000.0",
    "company_name": "CorgiAI",
    "skills": "git"
  },
  {
    "job_id": 1811129,
    "job_title": "Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "PropelAuth",
    "skills": "python"
  },
  {
    "job_id": 1811129,
    "job_title": "Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "PropelAuth",
    "skills": "go"
  },
  {
    "job_id": 1811129,
    "job_title": "Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "PropelAuth",
    "skills": "rust"
  },
  {
    "job_id": 1811129,
    "job_title": "Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "PropelAuth",
    "skills": "aws"
  },
  {
    "job_id": 1811129,
    "job_title": "Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "PropelAuth",
    "skills": "pulumi"
  },
  {
    "job_id": 1811129,
    "job_title": "Backend Engineer",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "PropelAuth",
    "skills": "slack"
  },
  {
    "job_id": 75429,
    "job_title": "CX LEAD SOFTWARE ENGINEER - ACTUARIAL - LEAD DATA ENGINEER  ...",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 75429,
    "job_title": "CX LEAD SOFTWARE ENGINEER - ACTUARIAL - LEAD DATA ENGINEER  ...",
    "job_location": "Anywhere",
    "salary_year_avg": "135000.0",
    "company_name": "Robert Half",
    "skills": "python"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "python"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "typescript"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "mongodb"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "react"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "express"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "node.js"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "node"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "next.js"
  },
  {
    "job_id": 1065710,
    "job_title": "Software Engineer, Tools (React)",
    "job_location": "Anywhere",
    "salary_year_avg": "133000.0",
    "company_name": "MongoDB",
    "skills": "fastify"
  },
  {
    "job_id": 1464217,
    "job_title": "Sr. Software Engineer (API and Integrations)",
    "job_location": "Anywhere",
    "salary_year_avg": "132500.0",
    "company_name": "Robert Half",
    "skills": "sql"
  },
  {
    "job_id": 1464217,
    "job_title": "Sr. Software Engineer (API and Integrations)",
    "job_location": "Anywhere",
    "salary_year_avg": "132500.0",
    "company_name": "Robert Half",
    "skills": "c#"
  },
  {
    "job_id": 1464217,
    "job_title": "Sr. Software Engineer (API and Integrations)",
    "job_location": "Anywhere",
    "salary_year_avg": "132500.0",
    "company_name": "Robert Half",
    "skills": "azure"
  }
]
*/