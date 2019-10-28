FactoryBot.define do

  factory :task do
    name { 'Factoryで作ったデフォルトのタイトル１' }
    content { 'Factoryで作ったデフォルトのコンテント１' }
    status{'完了'}
    label{'ffff'}
    priority{'高'}
    cut_off_date{'2021-03-26'}
  end

  factory :second_task, class: Task do
    name { 'Factoryで作ったデフォルトのタイトル２' }
    content { 'Factoryで作ったデフォルトのコンテント２' }
    status{'未着手'}
    label{'ffff'}
    priority{'中'}
    cut_off_date{'2021-03-26'}



  end
end
