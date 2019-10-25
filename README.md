- Model

|Model|
|:--|
|task|
|user|


- controller

|controller|
|:--|
|tasks|
|users|



- scheme for tasks table

|data-type|column|
|:--|:--|
|t.text     | name
|t.text     | content
|t.string   | status
|t.string   | label
|t.string   | priority
|t.datetime | cut_off_date
|t.datetime | created_at, null: false
|t.datetime | updated_at, null: false
|t.bigint   | user_id
|t.index    | ["user_id"], name: "index_tasks_on_user_id"


- scheme for tasks user table

|data-type|column|
|:--|:--|
|t.string   | name
|t.string   | email
|t.string   | password_digest
|t.datetime | created_at", null: false
|t.datetime | updated_at", null: false
|t.index    | ["email"], name: "index_users_on_email", unique: true
|*reference  | add_foreign_key "tasks", "users"



> Herokuデプロイ方法
>>1
>>コミットする
>>
>>git add -A
>>
>>git commit -m "init"
>>
>>2
>>
>>herokuログイン
>> heroku login --interacgtive でログイン
>>
>> password 入力
>>
>>3
>>
>>Herokuに新しいアプリケーションを作成する。
>>
>>  heroku create　する。
>>
>>4
>>
>> 以下の3つを実行しasset compileを設定する。
>>
>>1.rails assets:precompile RAILS_ENV=production
>>
>>2.heroku buildpacks:set heroku/ruby
>>
>>3.heroku buildpacks:add --index 1 heroku/nodejs
>>
>>5
>>
>>Herokuにデプロイをする
>>
>> git push heroku master
>>
>>6
>>
>>データベースの移行
>>
>>heroku run rails db:migrate
>>
>>7
>>
>>アプリケーションにアクセスする
>>
>>heroku config
