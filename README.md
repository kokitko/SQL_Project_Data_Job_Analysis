# Software Engineering Job Market Analysis 📊

This repository provides a SQL-based analysis of software engineering jobs, focusing on high-paying roles and the skills most in demand within the job market. The project uses SQL scripts to answer various questions about the job market.

## Table of Contents

- [Project Overview](#project-overview)
- [Data Structure](#data-structure)
- [Queries and Analysis](#queries-and-analysis)
  - [Top Paying Jobs](#top-paying-jobs)
  - [Skills for Top-Paying Jobs](#skills-for-top-paying-jobs)
  - [Most In-Demand Skills](#most-in-demand-skills)
  - [Highest Paying Skills](#highest-paying-skills)
  - [Optimal Skills for Career Growth](#optimal-skills-for-career-growth)

## Project Overview

This project aims to answer the following questions about software engineering jobs:

- **Top Paying Jobs**: What are the top-paying software engineering roles?
- **Skills Required for High-Paying Jobs**: What skills are needed for these top-paying roles?
- **Most In-Demand Skills**: What are the most sought-after skills for software engineers?
- **Highest Paying Skills**: Which skills are associated with the highest average salaries?
- **Optimal Skills for Learning**: Which skills offer the best combination of demand and high salary?

Using these insights, this project offers guidance to software engineers on which skills to develop for both financial and career advancement.

## Data Structure

This project uses a star schema with the following tables:

- `company_dim`: Stores information about companies posting jobs.
- `skills_dim`: Lists individual skills and their categories.
- `job_postings_fact`: Contains job postings data, including job titles, locations, salaries, and additional job characteristics.
- `skills_job_dim`: Connects skills to job postings, allowing for analysis of which jobs require specific skills.

## Queries and Analysis

### Top Paying Jobs

- **Script**: `1_top_paying_jobs.sql`
- **Objective**: Lists the top 30 highest-paying software engineering roles available in Poland or remotely.
- **Output**: Provides details on each job, including job title, location, company, and average yearly salary.

#### Example Output

| Job Title              | Location       | Company  | Salary (Yearly) | Posted Date |
|------------------------|----------------|----------|-----------------|-------------|
| Senior Software Engineer | Warsaw, Poland | XYZ corp. | Salary          | Date        |

### Skills for Top-Paying Jobs

- **Script**: `2_top_paying_job_skills.sql`
- **Objective**: Identifies skills associated with the top-paying software engineering roles.
- **Output**: Lists job titles, companies, and required skills for each top-paying position.

#### Example Output

| Job Title              | Company  | Skill  |
|------------------------|----------|--------|
| Senior Software Engineer | XYZ corp. | Python |
| Data Engineer          | ABC Inc  | SQL    |

### Most In-Demand Skills

- **Script**: `3_top_demanded_skills.sql`
- **Objective**: Ranks the top 5 most in-demand skills across all software engineering roles.
- **Output**: Displays skills and their demand count based on job postings.

#### Example Output

| Skill  | Demand Count |
|--------|--------------|
| Python | Count        |
| SQL    | Count        |

### Highest Paying Skills

- **Script**: `4_top_paying_skills.sql`
- **Objective**: Highlights skills associated with the highest average salaries.
- **Output**: Lists skills and their average associated salaries.

#### Example Output

| Skill    | Average Salary |
|----------|----------------|
| Cassandra | Salary         |
| DynamoDB  | Salary         |

### Optimal Skills for Career Growth

- **Script**: `5_optimal_skills.sql`
- **Objective**: Finds skills with both high demand and high average salaries, offering insights into the best skills for job security and financial growth.
- **Output**: Displays skills, demand counts, and average salaries.

#### Example Output

| Skill ID | Skill  | Demand Count | Average Salary |
|----------|--------|--------------|----------------|
| 1        | Python | Count        | Salary         |
| 2        | SQL    | Count        | Salary         |
