 require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  background do
    FactoryBot.create(:task, content: "変更")
    FactoryBot.create(:second_task, name: "名前変更")
  end

  scenario "タスク一覧のテスト" do
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    Task.create!(name: 'test_task_02', content: 'samplesample',  status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task_name', with: 'ddd'
    fill_in 'task_content', with: 'ttt'
    select '完了', from: 'task_status'
    select '2019', from: 'task_cut_off_date_1i'
    select '3月', from: 'task_cut_off_date_2i'
    select '26', from: 'task_cut_off_date_3i'
    select '高', from: 'task_priority'
    click_on 'create_new'
    expect(page).to have_content 'ddd','ttt'
  end

  scenario "タスク詳細のテスト" do
    @task=Task.create!(name: 'mmm', content: 'nnn', status: '未着手', cut_off_date: '2020-03-26', priority: '高')
    visit tasks_path(@task)
    expect(page).to have_content 'mmm','nnn'
  end
  #       visit tasks_path[30]
  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    Task.create!(name: 'test_task_01', content: 'testtesttest', status: '未着手', cut_off_date: '2020-03-26', priority: '高')
    Task.create!(name: 'test_task_03', content: 'samplesample', status: '未着手', cut_off_date: '2020-03-26', priority: '高')
    visit tasks_path
    tasks = all(".task_list")
    task_0 = tasks[0]
    expect(task_0).to have_content 'test_task_01'
  end
   #################################################################################################################
  scenario "終了期限のテスト" do
    Task.create(name: '333', content: 'nnn', status: '未着手', cut_off_date: '2020-03-26', priority: '高')
    Task.create(name: '111', content: 'nnn', status: '未着手', cut_off_date: '2000-03-26', priority: '高')
    Task.create(name: '444', content: 'nnn', status: '未着手', cut_off_date: '2021-03-26', priority: '高')
    Task.create(name: '222', content: 'nnn', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    visit tasks_path
    click_button '終了期限でソートする'
    tasks = all(".task_list")
    task_0 = tasks[0]
    expect(task_0).to have_content '111'
  end

  scenario "ステータスのテスト" do
    Task.create!(name: '222', content: 'nnn', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    Task.create!(name: '333', content: 'nnn', status: '着手中', cut_off_date: '2020-03-26', priority: '高')
    Task.create!(name: '111', content: 'nnn', status: '完了', cut_off_date: '2018-03-26', priority: '高')
    visit tasks_path
    select '完了', from: 'status'
    click_on 'commit'
    expect(page).to have_content '111'
    expect(page).not_to have_content '222'
    expect(page).not_to have_content '333'
  end
end
