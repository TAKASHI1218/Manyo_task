FactoryBot.define do

  # factory :task :skip => true do
  #   name { 'Factoryで作ったaaa' }
  #   content { 'Factoryで作ったデフォルトのコンテント１' }
  #   status{'完了'}
  #   label{'ffff'}
  #   priority{'高'}
  #   cut_off_date{'2021-03-26'}
  # end
  # #
  # factory :second_task, class: Task :skip => true do
  #   name { 'Factoryで作ったbbb' }
  #   content { 'Factoryで作ったデフォルトのコンテント２' }
  #   status{'未着手'}
  #   label{'ffff'}
  #   priority{'中'}
  #   cut_off_date{'2021-03-26'}
  # end
  #
  factory :user do
    name {"hiro"}
    email {"tzzztt@example.com"}
    password {"61346134"}
    password_confirmation {"61346134"}
  end
end
