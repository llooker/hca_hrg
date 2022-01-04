view: daily_snapshot {
  sql_table_name: `hca-data-sandbox.hrg_recruiting.synthetic_4_daily_snapshot`
    ;;

  dimension: pk {
    primary_key: yes
    sql: ${applicant_id} || ' | ' || ${measurement_raw} ;;
  }

  dimension: applicant_id {
    type: number
    sql: ${TABLE}.applicant_id ;;
  }

  dimension: application_id {
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension: days_since_status_change {
    type: number
    sql: ${TABLE}.days_since_status_change ;;
  }

  dimension: job_position_id {
    type: number
    sql: ${TABLE}.job_position_id ;;
  }

  dimension_group: measurement {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.measurement_date ;;
  }

  dimension: status {
    suggest_persist_for: "1 hour"
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_applications {
    type: count_distinct
    sql: ${application_id} ;;
  }

  measure: average_days_in_status {
    type: average
    sql: ${days_since_status_change} ;;
    value_format_name: decimal_1
  }

  measure: days_in_status_1_min {
    type: min
    sql: ${days_since_status_change} ;;
    value_format_name: decimal_1
  }

  measure: days_in_status_2_25 {
    type: percentile
    percentile: 25
    sql: ${days_since_status_change} ;;
    value_format_name: decimal_1
  }

  measure: days_in_status_3_median {
    type: median
    sql: ${days_since_status_change} ;;
    value_format_name: decimal_1
  }

  measure: days_in_status_4_75 {
    type: percentile
    percentile: 75
    sql: ${days_since_status_change} ;;
    value_format_name: decimal_1
  }

  measure: days_in_status_5_max {
    type: max
    sql: ${days_since_status_change} ;;
    value_format_name: decimal_1
  }
}
