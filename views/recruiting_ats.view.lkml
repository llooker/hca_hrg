view: recruiting_ats {
  sql_table_name: `hca-data-sandbox.hrg_recruiting.synthetic_3_create_job_applications`
    ;;

#######################
### Original Dimensions
#######################

## ID

  dimension: applicant_id {
    group_label: "ID"
    type: number
    sql: ${TABLE}.applicant_id ;;
  }

  dimension: application_id {
    group_label: "ID"
    type: number
    sql: ${TABLE}.application_id ;;
  }

  dimension: job_position_id {
    group_label: "ID"
    type: number
    sql: ${TABLE}.job_position_id ;;
  }

## 0. Posting

  dimension_group: post {
    label: "0 - Post"
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

## 1. Apply

  dimension_group: application {
    label: "1 - Apply"
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

## 2. Evaluate

  dimension_group: evaluation {
    label: "2 - Evaluate"
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

  dimension: evaluation_decision {
    group_label: "Decision"
    label: "2 - Evaluate - Decision"
    type: string
    sql: ${TABLE}.evaluation_decision ;;
  }

## 3. Interview

  dimension_group: interview {
    label: "3 - Interview"
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

  dimension: interview_decision {
    group_label: "Decision"
    label: "3 - Interview - Decision"
    type: string
    sql: ${TABLE}.interview_decision ;;
  }

## 4. Offer

  dimension_group: offer {
    label: "4 - Offer"
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

  dimension: offer_decision {
    group_label: "Decision"
    label: "4 - Offer - Decision"
    type: string
    sql: ${TABLE}.offer_decision ;;
  }

## 5. Accept

  dimension_group: acceptance {
    label: "5 - Accept"
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

  dimension: acceptance_decision {
    group_label: "Decision"
    label: "5 - Accept - Decision"
    type: string
    sql: ${TABLE}.acceptance_decision ;;
  }


#######################
### Derived Dimensions
#######################

### Days in process

  dimension: difference_post_apply {
    group_label: "Length of Time"
    label: "0-1 - Days to Apply"
    type: duration_day
    sql_start: ${post_date} ;;
    sql_end: ${application_date} ;;
  }

  dimension: difference_apply_eval {
    group_label: "Length of Time"
    label: "1-2 - Days to Evaluate"
    type: duration_day
    sql_start: ${application_date} ;;
    sql_end: ${evaluation_date} ;;
  }

  dimension: difference_eval_int {
    group_label: "Length of Time"
    label: "2-3 - Days to Interview"
    type: duration_day
    sql_start: ${evaluation_date} ;;
    sql_end: ${interview_date} ;;
  }

  dimension: difference_int_offer {
    group_label: "Length of Time"
    label: "3-4 - Days to Offer"
    type: duration_day
    sql_start: ${interview_date} ;;
    sql_end: ${offer_date} ;;
  }

  dimension: difference_offer_accept {
    group_label: "Length of Time"
    label: "4-5 - Days to Accept"
    type: duration_day
    sql_start: ${offer_date} ;;
    sql_end: ${acceptance_date} ;;
  }

### Days Since Post

  dimension: difference_post_apply2 {
    group_label: "Length of Time (Since Post)"
    label: "0-1 - Days to Apply"
    type: duration_day
    sql_start: ${post_date} ;;
    sql_end: ${application_date} ;;
  }

  dimension: difference_post_eval {
    group_label: "Length of Time (Since Post)"
    label: "0-2 - Days to Evaluate"
    type: duration_day
    sql_start: ${post_date} ;;
    sql_end: ${evaluation_date} ;;
  }

  dimension: difference_post_int {
    group_label: "Length of Time (Since Post)"
    label: "0-3 - Days to Interview"
    type: duration_day
    sql_start: ${post_date} ;;
    sql_end: ${interview_date} ;;
  }

  dimension: difference_post_offer {
    group_label: "Length of Time (Since Post)"
    label: "0-4 - Days to Offer"
    type: duration_day
    sql_start: ${post_date} ;;
    sql_end: ${offer_date} ;;
  }

  dimension: difference_post_accept {
    group_label: "Length of Time (Since Post)"
    label: "0-5 - Days to Accept"
    type: duration_day
    sql_start: ${post_date} ;;
    sql_end: ${acceptance_date} ;;
  }

### Days Since App

  dimension: difference_apply_eval2 {
    group_label: "Length of Time (Since Apply)"
    label: "1-2 - Days to Evaluate"
    type: duration_day
    sql_start: ${application_date} ;;
    sql_end: ${evaluation_date} ;;
  }

  dimension: difference_apply_int {
    group_label: "Length of Time (Since Apply)"
    label: "1-3 - Days to Interview"
    type: duration_day
    sql_start: ${application_date} ;;
    sql_end: ${interview_date} ;;
  }

  dimension: difference_apply_offer {
    group_label: "Length of Time (Since Apply)"
    label: "1-4 - Days to Offer"
    type: duration_day
    sql_start: ${application_date} ;;
    sql_end: ${offer_date} ;;
  }

  dimension: difference_apply_accept {
    group_label: "Length of Time (Since Apply)"
    label: "1-5 - Days to Accept"
    type: duration_day
    sql_start: ${application_date} ;;
    sql_end: ${acceptance_date} ;;
  }

  dimension: decision_null {
    group_label: "Z"
    type: string
    sql: NULL ;;
  }

  dimension: applicant_email {
    group_label: "Z"
    type: string
    sql: 'applicant_email_' || ${applicant_id} || '@gmail.com';;
    action: {
      label: "Ping Candidate"
      url: "https://hooks.zapier.com/hooks/catch/lkfjasdlkfxaoiu/"
      icon_url: "http://www.google.com/s2/favicons?domain=zapier.com"
      form_param: {
        name: "Reporter"
        type: string
        default: "{{ _user_attributes.email }}"
      }
      form_param: {
        name: "Applicant"
        type: string
        default: "{{ applicant_id._rendered_value }}"
      }
      form_param: {
        name: "Job Position"
        type: string
        default: "{{ job_position_id._rendered_value }}"
      }
      form_param: {
        name: "Comments"
        type: textarea
        default: "Please investigate in more detail"
      }
    }
    action: {
      label: "Ping Hiring Manager"
      url: "https://hooks.zapier.com/hooks/catch/lkfjasdlkfxaoiu/"
      icon_url: "http://www.google.com/s2/favicons?domain=zapier.com"
      form_param: {
        name: "Reporter"
        type: string
        default: "{{ _user_attributes.email }}"
      }
      form_param: {
        name: "Applicant"
        type: string
        default: "{{ applicant_id._rendered_value }}"
      }
      form_param: {
        name: "Job Position"
        type: string
        default: "{{ job_position_id._rendered_value }}"
      }
      form_param: {
        name: "Comments"
        type: textarea
        default: "Please investigate in more detail"
      }
    }
  }

  dimension: date_future {
    group_label: "Z"
    type: string
    sql: NULL ;;
  }

  dimension: date_apply {
    group_label: "Z"
    type: date
    sql: date_add(current_date(), interval ${difference_apply_eval}*-1 day) ;;
  }

  dimension: date_offer {
    group_label: "Z"
    type: date
    sql: date_add(current_date(), interval ${difference_int_offer}*-1 day) ;;
  }

  dimension: date_accept {
    group_label: "Z"
    type: date
    sql: date_add(current_date(), interval ${difference_offer_accept}*-1 day) ;;
  }

  dimension: date_interview {
    group_label: "Z"
    type: date
    sql: date_add(current_date(), interval ${difference_eval_int}*-1 day) ;;
  }

#######################
### Measures
#######################

### Funnel #

  measure: count_postings {
    group_label: "Funnel #"
    label: "0 - # - Post"
    type: count_distinct
    sql: ${job_position_id} ;;
  }

  measure: count_applications {
    group_label: "Funnel #"
    label: "1 - # - Apply"
    type: count
  }

  measure: count_evaluations {
    group_label: "Funnel #"
    label: "2 - # - Evaluate"
    type: count
    filters: [evaluation_date: "-null", evaluation_decision: "Pass"]
  }

  measure: count_interviews {
    group_label: "Funnel #"
    label: "3 - # - Interview"
    type: count
    filters: [interview_date: "-null"]
  }

  measure: count_offers {
    group_label: "Funnel #"
    label: "4 - # - Offers"
    type: count
    filters: [offer_date: "-null", offer_decision: "Pass"]
  }

  measure: count_accepts {
    group_label: "Funnel #"
    label: "5 - # - Accepts"
    type: count
    filters: [acceptance_date: "-null", acceptance_decision: "Pass"]
  }

### Funnel %

  measure: percent_evaluated {
    group_label: "Funnel %"
    label: "1-2 - % Apply to Evaluate"
    type: number
    sql: ${count_evaluations} / nullif(${count_applications},0) ;;
    value_format_name: percent_1
  }

  measure: percent_interviewed {
    group_label: "Funnel %"
    label: "2-3 - % Eval to Interview"
    type: number
    sql: ${count_interviews} / nullif(${count_evaluations},0) ;;
    value_format_name: percent_1
  }

  measure: percent_offered {
    group_label: "Funnel %"
    label: "3-4 - % Int to Offer"
    type: number
    sql: ${count_offers} / nullif(${count_interviews},0) ;;
    value_format_name: percent_1
  }

  measure: percent_accepted {
    group_label: "Funnel %"
    label: "4-5 - % Offer to Accept"
    type: number
    sql: ${count_accepts} / nullif(${count_offers},0) ;;
    value_format_name: percent_1
  }

  measure: percent_evaluated_original {
    group_label: "Funnel % (from Start)"
    label: "1-2 - % Apply to Evaluate"
    type: number
    sql: ${count_evaluations} / nullif(${count_applications},0) ;;
    value_format_name: percent_1
  }

  measure: percent_interviewed_original {
    group_label: "Funnel % (from Start)"
    label: "1-3 - % Apply to Interview"
    type: number
    sql: ${count_interviews} / nullif(${count_applications},0) ;;
    value_format_name: percent_1
  }

  measure: percent_offered_original {
    group_label: "Funnel % (from Start)"
    label: "1-4 - % Apply to Offer"
    type: number
    sql: ${count_offers} / nullif(${count_applications},0) ;;
    value_format_name: percent_1
  }

  measure: percent_accepted_original {
    group_label: "Funnel % (from Start)"
    label: "1-5 - % Apply to Accept"
    type: number
    sql: ${count_accepts} / nullif(${count_applications},0) ;;
    value_format_name: percent_1
  }

  measure: apps_required_for_1_eval {
    group_label: "Funnel # (Apps to Reach 1)"
    label: "2 - Apps to Reach 1 Evaluation"
    type: number
    sql: 1 / nullif(${percent_evaluated_original},0) ;;
    value_format_name: decimal_1
  }

  measure: apps_required_for_1_int {
    group_label: "Funnel # (Apps to Reach 1)"
    label: "3 - Apps to Reach 1 Interview"
    type: number
    sql: 1 / nullif(${percent_interviewed_original},0) ;;
    value_format_name: decimal_1
  }

  measure: apps_required_for_1_offer {
    group_label: "Funnel # (Apps to Reach 1)"
    label: "4 - Apps to Reach 1 Offer"
    type: number
    sql: 1 / nullif(${percent_offered_original},0) ;;
    value_format_name: decimal_1
  }

  measure: apps_required_for_1_accept {
    group_label: "Funnel # (Apps to Reach 1)"
    label: "5 - Apps to Reach 1 Accept"
    type: number
    sql: 1 / nullif(${percent_accepted_original},0) ;;
    value_format_name: decimal_1
  }

### Counts

  measure: count_applicants {
    group_label: "Counts"
    type: count_distinct
    sql: ${applicant_id} ;;
  }

  measure: applications_per_applicant {
    group_label: "Counts"
    type: number
    sql: ${count_applications} / nullif(${count_applicants},0) ;;
    value_format_name: decimal_1
  }

  measure: posting_per_applicant {
    group_label: "Counts"
    type: number
    sql: ${count_postings} / nullif(${count_applicants},0) ;;
    value_format_name: decimal_1
  }

  measure: applications_per_posting {
    group_label: "Counts"
    type: number
    sql: ${count_applications} / nullif(${count_postings},0) ;;
    value_format_name: decimal_1
  }

  measure: count_posting_no_applications {
    group_label: "Counts"
    type: count_distinct
    sql: ${job_position_id} ;;
    filters: [application_id: "null"]
  }

  measure: percent_postings_open {
    group_label: "Counts"
    type: number
    sql: ${count_accepts} / nullif(${count_postings},0) ;;
    value_format_name: percent_1
  }

  measure: percent_postings_filled {
    group_label: "Counts"
    type: number
    sql: 1 - ${percent_postings_open} ;;
    value_format_name: percent_1
  }

### Days in process

  measure: avg_difference_post_apply {
    group_label: "Length of Time"
    label: "0-1 - Avg Days to Apply"
    type: average
    sql: ${difference_post_apply} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_apply_eval {
    group_label: "Length of Time"
    label: "1-2 - Avg Days to Evaluate"
    type: average
    sql: ${difference_apply_eval} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_eval_int {
    group_label: "Length of Time"
    label: "2-3 - Avg Days to Interview"
    type: average
    sql: ${difference_eval_int} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_int_offer {
    group_label: "Length of Time"
    label: "3-4 - Avg Days to Offer"
    type: average
    sql: ${difference_int_offer} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_offer_accept {
    group_label: "Length of Time"
    label: "4-5 - Avg Days to Accept"
    type: average
    sql: ${difference_offer_accept} ;;
    value_format_name: decimal_1
  }

### Days Since Post

  measure: avg_difference_post_apply2 {
    group_label: "Length of Time (Since Post)"
    label: "0-1 - Avg Days to Apply"
    type: average
    sql: ${difference_post_apply2} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_post_eval {
    group_label: "Length of Time (Since Post)"
    label: "0-2 - Avg Days to Evaluate"
    type: average
    sql: ${difference_post_eval} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_post_int {
    group_label: "Length of Time (Since Post)"
    label: "0-3 - Avg Days to Interview"
    type: average
    sql: ${difference_post_int} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_post_offer {
    group_label: "Length of Time (Since Post)"
    label: "0-4 - Avg Days to Offer"
    type: average
    sql: ${difference_post_offer} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_post_accept {
    group_label: "Length of Time (Since Post)"
    label: "0-5 - Avg Days to Accept"
    type: average
    sql: ${difference_post_accept} ;;
    value_format_name: decimal_1
  }

### Days Since App

  measure: avg_difference_apply_eval2 {
    group_label: "Length of Time (Since Apply)"
    label: "1-2 - Avg Days to Evaluate"
    type: average
    sql: ${difference_apply_eval2} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_apply_int {
    group_label: "Length of Time (Since Apply)"
    label: "1-3 - Avg Days to Interview"
    type: average
    sql: ${difference_apply_int} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_apply_offer {
    group_label: "Length of Time (Since Apply)"
    label: "1-4 - Avg Days to Offer"
    type: average
    sql: ${difference_apply_offer} ;;
    value_format_name: decimal_1
  }

  measure: avg_difference_apply_accept {
    group_label: "Length of Time (Since Apply)"
    label: "1-5 - Avg Days to Accept"
    type: average
    sql: ${difference_apply_accept} ;;
    value_format_name: decimal_1
  }
}
