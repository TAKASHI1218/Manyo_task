require 'rails_helper'

RSpec.describe Task, type: :model do

  it "nameが空ならバリデーションが通らない" do
    task = Task.new(name: '', content: '失敗テスト1', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    task = Task.new(name: '失敗テスト2', content: '', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).not_to be_valid
  end

  it "nameとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(name: '失敗テスト3-1', content: '失敗テスト3-2', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
    expect(task).to be_valid
  end

  ##############################################################################################################################
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

####################################################################################################################

 # describe "scope" do
 #     task = FactoryBot.create(:task)
 #     task2 = FactoryBot.create(:second_task)
 #     task3 = FactoryBot.create(:third_task)
 #
     it "タスク検索で　aaa と選択し検索をしたらステータスが　完了　のもののみ表示される" do
       Task.create(name: 'aaa', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
       Task.create(name: 'aaabbb', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
       Task.create(name: 'bbb', content: '失敗テスト9', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
       Task.create(name: 'ccc', content: '失敗テスト9', status: '着手中', cut_off_date: '2019-03-26', priority: '高')



       expect(Task.get_by_name('aaa').count).to eq 2
     end
   


  # describe "scope2" do
  #      task = FactoryBot.create(:task)
  #      task2 = FactoryBot.create(:second_task)
  #      task3 = FactoryBot.create(:third_task)

       it "ステータス検索で　完了 と選択し検索をしたらステータスが　完了　のもののみ表示される" do
         Task.create(name: 'aaa', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
         Task.create(name: 'aaabbb', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
         Task.create(name: 'bbb', content: '失敗テスト9', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
         Task.create(name: 'ccc', content: '失敗テスト9', status: '着手中', cut_off_date: '2019-03-26', priority: '高')

         expect(Task.get_by_status('2').count).to eq 2
       end
     end































#      let(:params) { { name: 'aaa' } }
#      binding.pry
#      Task.get_by_name params[:name]
#      expect(task).to include 'aaa'
#
#      end
#    end
#  end




     # it "検索で　完了 と選択し検索をしたらステータスが　完了　のもののみ表示される" do
     #   expect(get_by_name).to include(task)
     #
    #



    # describe "scope" do
    # describe "get_by_name" do
    #   subject{Task.open}
    #   it {is_expected.to include 'aaa'}










    # fill_in '#task_search', with: 'aaa'
    # click_on '検索'
    # expect(page).to have_content 'aaa'
    # expect(page).not_to have_content 'bbb' 'ccc'
  #
  # it "ステータス検索で　完了 と選択し検索をしたらステータスが　完了　のもののみ表示される" do
  #
  #   Task.create(name: 'aaa', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
  #   Task.create(name: 'aaabbb', content: '失敗テスト9', status: '完了', cut_off_date: '2019-03-26', priority: '高')
  #   Task.create(name: 'bbb', content: '失敗テスト9', status: '未着手', cut_off_date: '2019-03-26', priority: '高')
  #   Task.create(name: 'ccc', content: '失敗テスト9', status: '着手中', cut_off_date: '2019-03-26', priority: '高')
  #
  #   # visit tasks_path
  #
  #   select '完了', from: '#status'
  #   click_on '検索'
  #   expect(page).to have_content '完了'
  #   expect(page).not_to have_content '未着手' '着手中'
  # end
