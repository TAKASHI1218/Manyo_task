require 'rails_helper'


RSpec.feature "ラベル機能", type: :feature do
  before do
    User.create!(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    visit new_session_path
    fill_in 'session_email', with: 'aaa@gmail.com'
    fill_in 'session_password', with: '61346134'
    click_on 'Log in'
  end

  scenario "ラベル入力のテスト" do
    visit new_task_path
    fill_in 'task_name', with: 'test_task_01'
    fill_in 'task_content', with: 'testtesttest'
    select '完了', from: 'task_status'
    select '2019', from: 'task_cut_off_date_1i'
    select '3月', from: 'task_cut_off_date_2i'
    select '26', from: 'task_cut_off_date_3i'
    select '高', from: 'task_priority'
    check ("#task_label_ids_8")

    click_on 'create_new'
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
    expect(page).to have_content 'ラベル1'
  end
end
