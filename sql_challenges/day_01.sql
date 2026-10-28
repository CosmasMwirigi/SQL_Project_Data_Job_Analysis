/*
Day 1: Warm-up on the Kenyan job market
Skills: WHERE, COUNT, GROUP BY, ORDER BY, LIMIT, LEFT JOIN, NOT IN, HAVING
*/


/*
Challenge 1 (Easy)
How many Data Analyst job postings are there in Kenya?
- Use the job_country column.
- Return one number, named kenya_data_analyst_jobs.
*/

-- Your answer here
SELECT
    COUNT(job_id) AS kenya_data_analyst_jobs
FROM
    job_postings_fact
WHERE
    job_country = 'Kenya' AND
    job_title_short = 'Data Analyst';


/*
Challenge 2 (Medium)
Which 5 job titles (job_title_short) have the most postings in Kenya?
- Return job_title_short and the number of postings, named job_count.
- Sort from most to fewest postings.
*/

-- Your answer here



/*
Challenge 3 (Hard)
Which companies post the most Data Analyst jobs in Kenya?
- Return the company name and the number of Data Analyst postings, named job_count.
- Leave out the placeholder names 'confidential' and 'Anonymous Employer'.
- Only show companies with 8 or more Data Analyst postings.
- Sort from most to fewest postings.
Hint: you will need a JOIN, NOT IN and HAVING.
*/

-- Your answer here
