require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task, content: "変更")
    FactoryBot.create(:second_task, name: "名前変更")
  end

  scenario "タスク一覧のテスト" do

    Task.create!(name: 'test_task_01', content: 'testtesttest')
    Task.create!(name: 'test_task_02', content: 'samplesample')

    visit tasks_path

    # save_and_open_page

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'

  end

  scenario "タスク作成のテスト" do

    visit new_task_path
    fill_in 'task_name', with: 'ddd'
    fill_in 'task_content', with: 'ttt'

    click_button "登録する"
    expect(page).to have_content 'ddd','ttt'

  end

  scenario "タスク詳細のテスト" do
    @task=Task.create!(name: 'mmm', content: 'nnn')
    visit tasks_path(@task)
    expect(page).to have_content 'mmm','nnn'
  end
  #       visit tasks_path[30]
  # end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    Task.create!(name: 'test_task_01', content: 'testtesttest')
    Task.create!(name: 'test_task_03', content: 'samplesample')
  end
end
