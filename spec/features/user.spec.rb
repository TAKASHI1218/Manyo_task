require 'rails_helper'

RSpec.feature "ユーザー管理機能", type: :feature do

  scenario "ユーザーの作成、ログインのテスト" do
    User.create!(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    User.create!(name: 'aaa', email: 'bbb@gmail.com', password: '61346134', password_confirmation: '61346134')
    visit new_session_path
    fill_in 'session_email', with: 'aaa@gmail.com'
    fill_in 'session_password', with: '61346134'
    click_on 'Log in'
    expect(page).to have_content 'aaaのページ'
  end

  scenario "ユーザーの作成、ログアウトのテスト" do
    @user1 = User.create!(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    @user2 = User.create!(name: 'aaa', email: 'bbb@gmail.com', password: '61346134', password_confirmation: '61346134')
    visit new_session_path
    fill_in 'session_email', with: 'aaa@gmail.com'
    fill_in 'session_password', with: '61346134'
    click_on 'Log in'
    expect(page).to have_content 'aaaのページ'
    click_on 'Logout'
    expect(page).to have_content 'ログアウトしました。'
  end

  scenario "異なるユーザーは他人のユーザーのページにいけずに自分のスケジュール一覧のタスクページにいく。" do
    @user1 = User.create!(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    @user2 = User.create!(name: 'aaa', email: 'bbb@gmail.com', password: '61346134', password_confirmation: '61346134')
    visit new_session_path
    fill_in 'session_email', with: 'aaa@gmail.com'
    fill_in 'session_password', with: '61346134'
    click_on 'Log in'
    expect(page).to have_content 'aaaのページ'
    visit user_path(@user2)
    expect(page).to have_content 'スケジュール一覧'
  end

  scenario "ログインしている時は、ユーザー登録画面に行かせないように、コントローラで制御しましょう。(ログアウト状態になる。)" do
    @user1 = User.create!(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    @user2 = User.create!(name: 'aaa', email: 'bbb@gmail.com', password: '61346134', password_confirmation: '61346134')
    visit new_session_path
    fill_in 'session_email', with: 'aaa@gmail.com'
    fill_in 'session_password', with: '61346134'
    click_on 'Log in'
    expect(page).to have_content 'aaaのページ'
    visit new_user_path
    expect(page).to have_content 'Login'
  end

  scenario "ユーザ登録（create）をした時、同時にログインもさせるようにしましょう。" do
    visit new_user_path
    fill_in 'user_name', with: 'aaa'
    fill_in 'user_email', with: 'aaa@gmail.com'
    fill_in 'user_password', with: '61346134'
    fill_in 'user_password_confirmation', with: '61346134'
    click_on 'アカウント作成'
    expect(page).to have_content 'Logout'
  end
end
