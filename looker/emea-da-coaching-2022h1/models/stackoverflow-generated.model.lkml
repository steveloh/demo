connection: "lohk-argolis-stackoverflow"
label: "lohk-stackoverflow"

# include all the views
include: "/views/**/*.view"

# Right now there is no need to work on caching policy
# datagroup: test-generated-project_default_datagroup {
#   # sql_trigger: SELECT MAX(id) FROM etl_log;;
#   max_cache_age: "1 hour"
# }

# persist_with: test-generated-project_default_datagroup

explore: posts_questions {
  label: "Questions by users and badges"

  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${posts_questions.owner_user_id} = ${users.id} ;;
  }

  join: badges {
    type: left_outer
    relationship: many_to_one
    sql_on: ${badges.user_id} = ${users.id} ;;
  }
}
