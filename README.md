<h1>Software Engineering Job Market Analysis 📊</h1>

<p>This repository provides a SQL-based analysis of software engineering jobs, focusing on high-paying roles and the skills most in demand within the job market. The project uses SQL scripts to answer key questions regarding salary, job demand, and skill optimization for software engineers, specifically for positions in Poland or remote roles.</p>

<h2>Table of Contents</h2>

<a href="#section1">Project Overview</a> <br />
<a href="#section2">Data Structure</a> <br />
<a href="#section3">Queries and Analysis</a>
<ul>
        <a href="#section4"><li> Top Paying Jobs </li></a>
        <a href="#section5"><li> Skills for Top-Paying Jobs </li></a>
        <a href="#section6"><li> Most In-Demand Skills </li></a>
        <a href="#section7"><li> Highest Paying Skills </li></a>
        <a href="#section8"><li> Optimal Skills for Career Growth </li></a>
</ul>
<a>Database Setup and Data Loading</a> <br />
<a>Visualizations</a> <br />
<a>Next Steps</a> <br />
<a>Contributing</a> <br />
<div class="section 1" id="section1">
<h2>Project Overview</h2>
This project aims to answer the following questions about software engineering jobs:
<ul>
        <li><b>Top Paying Jobs</b>: What are the top-paying software engineering roles?</li>
        <li><b>Skills Required for High-Paying Jobs</b>: What skills are needed for these top-paying roles?</li>
        <li><b>Most In-Demand Skills</b>: What are the most sought-after skills for software engineers?</li>
        <li><b>Highest Paying Skills</b>: Which skills are associated with the highest average salaries?</li>
        <li><b>Optimal Skills for Learning</b>: Which skills offer the best combination of demand and high salary?</li>
</ul>
Using these insights, this project offers guidance to software engineers on which skills to develop for both financial and career advancement.
</div>
<div class="section 2" id="section2">
<h2>Data Structure</h2>
This project uses a star schema with the following tables:
<ul>
        <li>company_dim: Stores information about companies posting jobs.</li>
        <li>skills_dim: Lists individual skills and their categories.</li>
        <li>job_postings_fact: Contains job postings data, including job titles, locations, salaries, and additional job characteristics.</li>
        <li>skills_job_dim: Connects skills to job postings, allowing for analysis of which jobs require specific skills.</li>
</ul>
</div>
<div class="section 3" id="section3">
<h2>Queries and Analysis</h2>
<div class="section 4" id="section4">
<h3>1. Top Paying Jobs</h3>
<ul>
        <li><b>Script</b>: 1_top_paying_jobs.sql</li>
        <li><b>Objective</b>: Lists the top 30 highest-paying software engineering roles available in Poland or remotely.</li>
        <li><b>Output</b>: Provides details on each job, including job title, location, company, and average yearly salary.</li>
</ul>
<h5>Example Output</h5>
<table>
  <tr>
    <th><b>Job Title</b></th>
    <th><b>Location</b></th>
    <th><b>Company</b></th>
    <th><b>Salary (Yearly)</b></th> 
    <th><b>Posted Date</b></th>      
  </tr>
  <tr>
    <th>Senior Software Engineer</th>
    <th>Warsaw, Poland</th>
    <th>XYZ corp.</th>  
    <th><i>Salary</i></th> 
    <th><i>Date</i></th>      
  </tr>      
</table>
</div>
<div class="section 5" id="section5">
<h3>2. Skills for Top-Paying Jobs</h3>
<ul>
        <li><b>Script</b>: 2_top_paying_job_skills.sql</li>
        <li><b>Objective</b>: Identifies skills associated with the top-paying software engineering roles.</li>
        <li><b>Output</b>: Lists job titles, companies, and required skills for each top-paying position.</li>
</ul>
<h5>Example Output</h5>
<table>
  <tr>
    <th><b>Job Title</b></th>
    <th><b>Company</b></th>
    <th><b>Skill</b></th>
  </tr>
  <tr>
    <th>Senior Software Engineer</th>
    <th>XYZ corp.</th>  
    <th>Python</th>
  </tr>      
  <tr>
    <th>Data Engineer</th>
    <th>ABC Inc</th>  
    <th>SQL</th>
  </tr>  
</table>
📊 Graph:
![image alt](https://github.com/kokitko/SQL_Project_Data_Job_Analysis/blob/main/image.png?raw=true)
</div>
3. Most In-Demand Skills
Script: 3_top_demanded_skills.sql
Objective: Ranks the top 5 most in-demand skills across all software engineering roles.
Output: Displays skills and their demand count based on job postings.
Example Output
Skill	Demand Count
Python	
𝐶
𝑜
𝑢
𝑛
𝑡
Count
SQL	
𝐶
𝑜
𝑢
𝑛
𝑡
Count
📊 Graph Suggestion:
Bar chart: Show demand counts for the top 5 most requested skills.
4. Highest Paying Skills
Script: 4_top_paying_skills.sql
Objective: Highlights skills associated with the highest average salaries.
Output: Lists skills and their average associated salaries.
Example Output
Skill	Average Salary
Cassandra	
𝑆
𝑎
𝑙
𝑎
𝑟
𝑦
Salary
DynamoDB	
𝑆
𝑎
𝑙
𝑎
𝑟
𝑦
Salary
📊 Graph Suggestion:
Horizontal bar chart: Ranks the top 10 skills by average salary.
5. Optimal Skills for Career Growth
Script: 5_optimal_skills.sql
Objective: Finds skills with both high demand and high average salaries, offering insights into the best skills for job security and financial growth.
Output: Displays skills, demand counts, and average salaries.
Example Output
Skill	Demand Count	Average Salary
Python	
𝐶
𝑜
𝑢
𝑛
𝑡
Count	
𝑆
𝑎
𝑙
𝑎
𝑟
𝑦
Salary
SQL	
𝐶
𝑜
𝑢
𝑛
𝑡
Count	
𝑆
𝑎
𝑙
𝑎
𝑟
𝑦
Salary
📊 Graph Suggestion:
Bubble chart: Show demand count vs. average salary for each skill, with bubble size representing demand.
</div>
