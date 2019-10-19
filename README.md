-Model
task
user

-controller
tasks
users

-schema for "tasks table"
data-type   | column
------------|------------
 t.text     | task_name
 t.string   | task_status
 t.string   | label
 t.datetime | cut_off_date
 t.datetime | created_at, null: false
 t.datetime | updated_at, null: false
 t.bigint   | user_id
 t.index    | ["user_id"], name: "index_tasks_on_user_id"

-schema for "users table"
data-type   | column
------------|------------
 t.string   | name"
 t.string   | email"
 t.string   | password_digest"
 t.datetime | created_at", null: false
 t.datetime | updated_at", null: false
 t.index    | ["email"], name: "index_users_on_email", unique: true

 --add_foreign_key "pictures", "users"

 |column|
 |:--||:--|
 |align left|align left|
 |a|a|


|header1|header2|
|:--|--:|:--:|
|align left|align right|align center|
|a|b|c|


|data-type|column||
|:--|--:|
|align left|align right|align center|
|a|b|c|
