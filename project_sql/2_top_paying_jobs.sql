WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
SQL is the one skill every top-paying remote Data Analyst job asked for, with Python and Tableau close behind.

What the skills column shows

Your file has 66 rows. Each row is one skill for one job, spread across 8 jobs paying from $184,000 to $255,830.

The core three:

SQL: 8 of 8 jobs (100%). Every top-paying role requires it.
Python: 7 of 8 (88%). Only the UCLA Health role leaves it out.
Tableau: 6 of 8 (75%). This is the most-requested visualisation tool, well ahead of Power BI (2).

The second tier:

R: 4 jobs (50%)
Snowflake, Pandas, Excel: 3 jobs each
Azure, AWS, Power BI, Oracle: 2 jobs each
*/
