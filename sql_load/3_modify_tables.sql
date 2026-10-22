/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
Database Load Issues (follow if receiving permission denied when running SQL code below)

NOTE: If you are having issues with permissions. And you get error: 

'could not open file "[your file path]\job_postings_fact.csv" for reading: Permission denied.'

1. Open pgAdmin
2. In Object Explorer (left-hand pane), navigate to `sql_course` database
3. Right-click `sql_course` and select `PSQL Tool`
    - This opens a terminal window to write the following code
4. Get the absolute file path of your csv files
    1. Find path by right-clicking a CSV file in VS Code and selecting “Copy Path”
5. Paste the following into `PSQL Tool`, (with the CORRECT file path)

\copy company_dim FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/

-- NOTE: This has been updated from the video to fix issues with encoding

-- COPY company_dim
-- FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\company_dim.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- COPY skills_dim
-- FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_dim.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- COPY job_postings_fact
-- FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\job_postings_fact.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- COPY skills_job_dim
-- FROM 'D:\SQL\SQL_Project_Data_Job_Analysis\csv_files\skills_job_dim.csv'
-- WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT
    (SELECT COUNT(*) FROM company_dim) AS companies,
    (SELECT COUNT(*) FROM skills_dim) AS skills,
    (SELECT COUNT(*) FROM job_postings_fact) AS jobs,
    (SELECT COUNT(*) FROM skills_job_dim) AS skill_job_links;

SELECT
    job_id,
    job_title_short AS title,
    job_location AS location,
    job_posted_date :: DATE AS date

FROM
    job_postings_fact
ORDER BY 
    job_id
LIMIT
    10;