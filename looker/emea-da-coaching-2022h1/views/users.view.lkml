view: users {
  sql_table_name: `looker_demo_stackoverflow.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: about_me {
    type: string
    sql: ${TABLE}.about_me ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creation_date ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: down_votes {
    type: number
    sql: ${TABLE}.down_votes ;;
  }

  dimension_group: last_access {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_access_date ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: profile_image_url {
    type: string
    sql: ${TABLE}.profile_image_url ;;
  }

  dimension: reputation {
    type: number
    sql: ${TABLE}.reputation ;;
  }

  dimension: up_votes {
    type: number
    sql: ${TABLE}.up_votes ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
  }

  dimension: is_privileged {
    type: yesno
    sql: DATE_DIFF(CURRENT_DATE(), ${creation_date}, DAY) >= (365 * 5) AND ${reputation} >= 50;;
  }

  measure: privileged_count {
    type: count
    filters: [is_privileged: "Yes"]
  }


  measure: count {
    type: count
    drill_fields: [id, display_name, badges.count]
  }
}
