```
/**********************
Purpose: Create synthetic data for funnel analysis
Author: Aaron Wilkowitz
Date Created: 2021-12-15
**********************/

/**********************
1000 Job Openings
  - 96 have no applicants
  - 211 have 1 applicant
  - 186 have 2 applicants
  - Etc. unless 1000
**********************/

CREATE OR REPLACE TABLE `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` AS
          SELECT 1 as value
UNION ALL SELECT 2 as value
UNION ALL SELECT 3 as value
UNION ALL SELECT 4 as value
UNION ALL SELECT 5 as value
UNION ALL SELECT 6 as value
UNION ALL SELECT 7 as value
UNION ALL SELECT 8 as value
UNION ALL SELECT 9 as value
UNION ALL SELECT 10 as value
;

CREATE OR REPLACE TABLE `hca-data-sandbox.hrg_recruiting.synthetic_2_create_job_openings` AS
with job_position_cte as (
SELECT
  row_number() over (partition by 'x') as job_position_id
FROM  `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` a -- 10
    , `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` b -- 100
    , `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` c -- 1000
LIMIT 1000
)
, number_applicants_cte as (
SELECT
    job_position_id
  , case
      when job_position_id <= 89 then   0
      when job_position_id <= 184 then  1
      when job_position_id <= 276 then  2
      when job_position_id <= 364 then  3
      when job_position_id <= 450 then  4
      when job_position_id <= 535 then  5
      when job_position_id <= 613 then  6
      when job_position_id <= 689 then  7
      when job_position_id <= 771 then  8
      when job_position_id <= 834 then  9
      when job_position_id <= 888 then  10
      when job_position_id <= 933 then  11
      when job_position_id <= 966 then  12
      when job_position_id <= 986 then  13
      when job_position_id <= 997 then  14
      when job_position_id <= 1000 then 15
    end as number_applicants
FROM job_position_cte
)
, end_row_cte as (
SELECT
    *
  , case when number_applicants = 0 then null else sum(number_applicants) OVER (ORDER BY job_position_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) end as end_row
  , DATE_ADD(current_date(), INTERVAL -260 day) as earliest_date
  , cast(round(rand() * 180,0) as int64) as days_to_post
FROM number_applicants_cte
)
SELECT
    *
  , case when number_applicants = 0 then null else end_row - number_applicants + 1 end as start_row
  , DATE_ADD(earliest_date, INTERVAL days_to_post day) as post_date
FROM end_row_cte
;

/*
SELECT *
FROM `hca-data-sandbox.hrg_recruiting.synthetic_2_create_job_openings`
ORDER BY 1 desc
*/

CREATE OR REPLACE TABLE `hca-data-sandbox.hrg_recruiting.synthetic_3_create_job_applications_pre` AS
with applicant_cte as (
SELECT
  row_number() over (partition by 'x') as application_id
FROM  `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` a -- 10
    , `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` b -- 100
    , `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` c -- 1000
    , `hca-data-sandbox.hrg_recruiting.synthetic_1_create_rows_10` d -- 1000
LIMIT 5425
)
, application_posting_mapping as (
SELECT
    a.job_position_id
  , b.application_id
  , b.application_id as applicant_id
  , a.post_date
  , cast(round(rand() * 20,0) as int64) as days_to_apply
  , cast(round(rand() * 25,0) as int64) as days_to_evaluate
  , cast(round(rand() * 15,0) as int64) as days_to_interview
  , cast(round(rand() * 8,0) as int64) as days_to_offer
  , cast(round(rand() * 10,0) as int64) as days_to_accept
FROM `hca-data-sandbox.hrg_recruiting.synthetic_2_create_job_openings` a
LEFT JOIN applicant_cte b
  ON b.application_id BETWEEN a.start_row and a.end_row
ORDER BY 1
)
-- , dates_cte as (
SELECT
    job_position_id
  , application_id
  , applicant_id
  , post_date
  , case when application_id is null then null else DATE_ADD(post_date, INTERVAL days_to_apply day) end as application_date
  , case when application_id is null then null else DATE_ADD(post_date, INTERVAL days_to_apply + days_to_evaluate day) end as evaluation_date
  , case when application_id is null then null else DATE_ADD(post_date, INTERVAL days_to_apply + days_to_evaluate + days_to_interview day) end as interview_date
  , case when application_id is null then null else DATE_ADD(post_date, INTERVAL days_to_apply + days_to_evaluate + days_to_interview + days_to_offer day) end as offer_date
  , case when application_id is null then null else DATE_ADD(post_date, INTERVAL days_to_apply + days_to_evaluate + days_to_interview + days_to_offer + days_to_accept day) end as acceptance_date
  , rand() as success_evaluate  -- 60% are chosen for interviews after applying
  , rand() as success_interview -- 95% of those chosen for interviews make it to interviews
  , rand() as success_offer     -- 70% of those interviewed are given an offer
  , rand() as success_accept    -- 80% of those offered accept the offer
FROM application_posting_mapping
-- )
;

CREATE OR REPLACE TABLE `hca-data-sandbox.hrg_recruiting.synthetic_3_create_job_applications` AS
with drop_out_cte as (
SELECT
    job_position_id
  , application_id
  , applicant_id
  , post_date
  , application_date
  , evaluation_date
  , case when success_evaluate < 0.6 then 'Pass' else 'Failure' end as evaluation_decision
  # Note: there's no decision for interview b/c the 5% fallout here is a scheduling / process problem
  , case when success_evaluate < 0.6 and success_interview < 0.95 then interview_date else NULL end as interview_date
  , case when success_evaluate < 0.6 and success_interview < 0.95 then offer_date else NULL end as offer_date
  , case when success_evaluate < 0.6 and success_interview < 0.95 and success_offer < 0.7 then 'Pass' else 'Failure' end as offer_decision
  , case when success_evaluate < 0.6 and success_interview < 0.95 and success_offer < 0.7 then acceptance_date else NULL end as acceptance_date
  , case when success_evaluate < 0.6 and success_interview < 0.95 and success_offer < 0.7 and success_accept < 0.8 then 'Pass' else 'Failure' end as acceptance_decision
FROM `hca-data-sandbox.hrg_recruiting.synthetic_3_create_job_applications_pre`
)
, earliest_acceptance_cte as (
SELECT
    job_position_id
--   , application_id
--   , application_date
--   , evaluation_date
--   , acceptance_date
  , min(coalesce(acceptance_date,'2999-01-01')) as earliest_acceptance
FROM drop_out_cte
-- WHERE acceptance_date is not null
-- AND evaluation_date > acceptance_date
GROUP BY 1
-- ORDER BY 1
)
SELECT
    a.job_position_id
  , a.application_id
  , a.applicant_id
  , a.post_date
  , a.application_date
--   , b.earliest_acceptance
--   , a.evaluation_date as evaluation_date2
--   , a.interview_date as interview_date2
--   , a.offer_date as offer_date2
--   , a.acceptance_date as acceptance_date2
  , case when a.evaluation_date > b.earliest_acceptance then b.earliest_acceptance else a.evaluation_date end as evaluation_date
  , case when a.evaluation_date > b.earliest_acceptance then 'Another acceptance came in' else a.evaluation_decision end as evaluation_decision
  , case when a.interview_date > b.earliest_acceptance then b.earliest_acceptance else a.interview_date end as interview_date
  , case when a.interview_date > b.earliest_acceptance then 'Another acceptance came in' else a.interview_date end as interview_decision
  , case when a.offer_date > b.earliest_acceptance then b.earliest_acceptance else a.offer_date end as offer_date
  , case when a.offer_date > b.earliest_acceptance then 'Another acceptance came in' else a.offer_decision end as offer_decision
  , case when a.acceptance_date > b.earliest_acceptance then b.earliest_acceptance else a.acceptance_date end as acceptance_date
  , case when a.acceptance_date > b.earliest_acceptance then 'Another acceptance came in' else a.acceptance_decision end as acceptance_decision
FROM drop_out_cte a
LEFT JOIN earliest_acceptance_cte b
  ON a.job_position_id = b.job_position_id
WHERE coalesce(a.application_date,'1900-01-01') <= b.earliest_acceptance
ORDER BY 1
;
```
