-Model
task
user

-controller
tasks
users

-schema for "tasks table"
 -t.text "task_name"
 -t.string "task_status"
 -t.string "label"
 -t.datetime "cut_off_date"
 -t.datetime "created_at", null: false
 -t.datetime "updated_at", null: false
 -t.bigint "user_id"
 -t.index ["user_id"], name: "index_tasks_on_user_id"

-schema for "users table"
 -t.string "name"
 -t.string "email"
 -t.string "password_digest"
 -t.datetime "created_at", null: false
 -t.datetime "updated_at", null: false
 -t.index ["email"], name: "index_users_on_email", unique: true
 -add_foreign_key "pictures", "users"
