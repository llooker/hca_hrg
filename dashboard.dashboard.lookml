- dashboard: recruiting
  title: Recruiting
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Positions
    name: Positions
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: single_value
    fields: [recruiting_ats.count_postings, recruiting_ats.percent_postings_open]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Positions
    comparison_label: Unfilled
    series_types: {}
    defaults_version: 1
    row: 0
    col: 0
    width: 6
    height: 5
  - title: "% Apply > Accept"
    name: "% Apply > Accept"
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: single_value
    fields: [recruiting_ats.percent_accepted_original, recruiting_ats.apps_required_for_1_accept]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: "% Apply > Accept"
    comparison_label: Apps to Fill 1 Post
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 12
    width: 6
    height: 5
  - title: Recruiting Funnel
    name: Recruiting Funnel
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: looker_column
    fields: [recruiting_ats.count_applications, recruiting_ats.count_evaluations,
      recruiting_ats.count_interviews, recruiting_ats.count_offers, recruiting_ats.count_accepts]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    defaults_version: 1
    listen: {}
    row: 5
    col: 0
    width: 10
    height: 8
  - title: Applications
    name: Applications
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: single_value
    fields: [recruiting_ats.count_applications, recruiting_ats.applications_per_posting]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 5
  - title: Applicant waiting on HCA for (2) Evaluation
    name: Applicant waiting on HCA for (2) Evaluation
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: looker_grid
    fields: [recruiting_ats.job_position_id, recruiting_ats.applicant_email, recruiting_ats.applicant_id,
      recruiting_ats.date_apply, recruiting_ats.difference_apply_eval, recruiting_ats.decision_null,
      recruiting_ats.date_future]
    sorts: [recruiting_ats.difference_apply_eval desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recruiting_ats.decision_null: Decision
      recruiting_ats.date_future: Date Decision
      recruiting_ats.difference_apply_eval: Days Waiting
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    defaults_version: 1
    listen: {}
    row: 13
    col: 0
    width: 12
    height: 6
  - title: Applicant waiting on HCA for (4) Offer
    name: Applicant waiting on HCA for (4) Offer
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: looker_grid
    fields: [recruiting_ats.job_position_id, recruiting_ats.applicant_email, recruiting_ats.applicant_id,
      recruiting_ats.date_interview, recruiting_ats.difference_int_offer, recruiting_ats.decision_null,
      recruiting_ats.date_future]
    sorts: [recruiting_ats.difference_int_offer desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recruiting_ats.decision_null: Decision
      recruiting_ats.date_future: Date Decision
      recruiting_ats.difference_apply_eval: Days Waiting
      recruiting_ats.difference_int_offer: Days Waiting
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    defaults_version: 1
    listen: {}
    row: 19
    col: 0
    width: 12
    height: 6
  - title: HCA waiting on Applicant to (5) Accept
    name: HCA waiting on Applicant to (5) Accept
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: looker_grid
    fields: [recruiting_ats.job_position_id, recruiting_ats.applicant_email, recruiting_ats.applicant_id,
      recruiting_ats.date_offer, recruiting_ats.difference_offer_accept, recruiting_ats.decision_null,
      recruiting_ats.date_future]
    sorts: [recruiting_ats.difference_offer_accept desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recruiting_ats.decision_null: Decision
      recruiting_ats.date_future: Date Decision
      recruiting_ats.difference_apply_eval: Days Waiting
      recruiting_ats.difference_eval_int: Days Waiting
      recruiting_ats.date_interview: Date Eval
      recruiting_ats.difference_offer_accept: Days Waiting
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    defaults_version: 1
    listen: {}
    row: 19
    col: 12
    width: 12
    height: 6
  - title: HCA waiting on Applicant to schedule (3) Interview
    name: HCA waiting on Applicant to schedule (3) Interview
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: looker_grid
    fields: [recruiting_ats.job_position_id, recruiting_ats.applicant_email, recruiting_ats.applicant_id,
      recruiting_ats.date_interview, recruiting_ats.difference_eval_int, recruiting_ats.decision_null,
      recruiting_ats.date_future]
    sorts: [recruiting_ats.difference_eval_int desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      recruiting_ats.decision_null: Decision
      recruiting_ats.date_future: Date Decision
      recruiting_ats.difference_apply_eval: Days Waiting
      recruiting_ats.difference_eval_int: Days Waiting
      recruiting_ats.date_interview: Date Eval
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    defaults_version: 1
    listen: {}
    row: 13
    col: 12
    width: 12
    height: 6
  - title: Days to Fill
    name: Days to Fill
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: single_value
    fields: [recruiting_ats.avg_difference_apply_accept, recruiting_ats.avg_difference_post_accept]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    comparison_label: Days From Posting To Fill
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 5
  - title: Avg Time To Fill, by Stage
    name: Avg Time To Fill, by Stage
    model: hrg_recruiting_retention
    explore: recruiting_ats
    type: looker_bar
    fields: [recruiting_ats.avg_difference_post_apply, recruiting_ats.avg_difference_apply_eval,
      recruiting_ats.avg_difference_eval_int, recruiting_ats.avg_difference_int_offer,
      recruiting_ats.avg_difference_offer_accept]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: inline
    percentType: total
    percentPosition: inline
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Applications
    comparison_label: "# Apps / Post"
    defaults_version: 1
    hidden_series: [recruiting_ats.avg_difference_post_apply]
    listen: {}
    row: 5
    col: 10
    width: 14
    height: 8
