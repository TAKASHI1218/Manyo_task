require 'rails_helper'
require 'warden'
include Warden::Test::Helpers
Warden.test_mode!

RSpec.describe Task, type: :model do

  it "nameが空ならバリデーションが通らない" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    task = Task.new(name: '', content: '失敗テスト1', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト2', content: '', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).not_to be_valid
  end

  it "nameとcontentに内容が記載されていればバリデーションが通る" do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    task = Task.new(name: '失敗テスト3-1', content: '失敗テスト3-2', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).to be_valid
  end
#
#   ##############################################################################################################################
  it "statusが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト4', content: '失敗テスト4', status: '', cut_off_date: '2019-03-26', priority: '高')
    expect(task).not_to be_valid
  end

  it "cut_off_dateが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト5', content: '失敗テスト5', status: '未着手', cut_off_date: '', priority: '高')
    expect(task).not_to be_valid
  end

  it "priorityが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト6', content: '失敗テスト6', status: '未着手', cut_off_date: '2019-03-26', priority:'' )
    expect(task).not_to be_valid
  end

  it "nameとcontentとstatusとcut_off_dateとpriorityに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: '失敗テスト7', content: '失敗テスト7', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).to be_valid
  end

# ####################################################################################################################
  it "タスク検索で　aaa と選択し検索をしたらステータスが　完了　のもののみ表示される" do
    Task.create(name: 'aaa', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
    Task.create(name: 'aaabbb', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
    Task.create(name: 'bbb', content: '失敗テスト9', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    Task.create(name: 'ccc', content: '失敗テスト9', status: '着手中', cut_off_date: '2019-03-26', priority: '高')
    expect(Task.get_by_name('aaa').count).to eq 2
  end

  it "ステータス検索で　完了 と選択し検索をしたらステータスが　完了　のもののみ表示される" do
    Task.create(name: 'aaa', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
    Task.create(name: 'aaabbb', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
    Task.create(name: 'bbb', content: '失敗テスト9', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    Task.create(name: 'ccc', content: '失敗テスト9', status: '着手中', cut_off_date: '2019-03-26', priority: '高')
    expect(Task.get_by_status('2').count).to eq 2
  end
end
