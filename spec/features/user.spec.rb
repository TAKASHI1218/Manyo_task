require 'rails_helper'

RSpec.feature "ユーザー管理機能", type: :feature do



scenario "ユーザーのテスト" do
  User.create!(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
  User.create!(name: 'aaa', email: 'bbb@gmail.com', password: '61346134', password_confirmation: '61346134')
  visit new_sessions
  fill_in 'session_email', with: 'aaa@gmail.com'
  fill_in 'session_password', with: '61346134'
end
end
