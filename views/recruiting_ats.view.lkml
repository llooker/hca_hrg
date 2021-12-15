view: recruiting_ats {
  sql_table_name: `hca-data-sandbox.hrg_recruiting.synthetic_3_create_job_applications`
    ;;

  dimension_group: acceptance {
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
    sql: ${TABLE}.acceptance_date ;;
  }

  dimension: applicant_id {
    type: number
    sql: ${TABLE}.applicant_id ;;
  }

  dimension_group: application {
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
    sql: ${TABLE}.application_date ;;
  }

  dimension: application_id {
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension_group: evaluation {
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
    sql: ${TABLE}.evaluation_date ;;
  }

  dimension_group: interview {
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
    sql: ${TABLE}.interview_date ;;
  }

  dimension: job_position_id {
    type: number
    sql: ${TABLE}.job_position_id ;;
  }

  dimension_group: offer {
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
    sql: ${TABLE}.offer_date ;;
  }

  dimension_group: post {
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
    sql: ${TABLE}.post_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
