-- January
DROP TABLE IF EXISTS january_jobs;

CREATE TABLE january_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
DROP TABLE IF EXISTS february_jobs;

CREATE TABLE february_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
DROP TABLE IF EXISTS march_jobs;

CREATE TABLE march_jobs AS
    SELECT
        *
    FROM
        job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT
    (SELECT COUNT(*) FROM january_jobs) AS january,
    (SELECT COUNT(*) FROM february_jobs) AS february,
    (SELECT COUNT(*) FROM march_jobs) AS march;

-- SELECT
--     job_posted_date
-- FROM
--     march_jobs;
