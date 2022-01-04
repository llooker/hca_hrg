connection: "gcp_hca_poc"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
include: "dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: recruiting_ats {}

explore: daily_snapshot {}

############ Caching Logic ############

persist_with: new_data

### PDT Timeframes

datagroup: new_data {
  max_cache_age: "24 hours"
  sql_trigger: SELECT max(measurement_timestamp) FROM `hca-data-sandbox.hrg_recruiting.synthetic_3_create_job_applications` ;;
}

datagroup: once_daily {
  max_cache_age: "24 hours"
  sql_trigger: SELECT current_date() ;;
}

datagroup: once_weekly {
  max_cache_age: "168 hours"
  sql_trigger: SELECT extract(week from current_date()) ;;
}

datagroup: once_monthly {
  max_cache_age: "720 hours"
  sql_trigger: SELECT extract(month from current_date()) ;;
}

datagroup: once_yearly {
  max_cache_age: "9000 hours"
  sql_trigger: SELECT extract(year from current_date()) ;;
}
