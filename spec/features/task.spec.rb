require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧のテスト" do

    Task.create!(name: 'test_task_01', status: 'testtesttest')
    Task.create!(name: 'test_task_02', status: 'samplesample')

    visit tasks_path

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'


  end

  scenario "タスク作成のテスト" do

    visit new_task_path
    fill_in 'task_name', with: 'ddd'
    fill_in 'task_content', with: 'ttt'

    save_and_open_page


    click_button "登録する"
    expect(page).to have_content 'ddd','ttt'



  end

  scenario "タスク詳細のテスト" do
  end

  end
