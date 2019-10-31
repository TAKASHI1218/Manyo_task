require 'rails_helper'

RSpec.describe User, type: :model do

  it "すべて適切に入力されていればバリデーションが通る" do
    user = User.new(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    expect(user).to be_valid
  end

  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: '', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '61346134')
    expect(user).not_to be_valid
  end

  it "emailが空ならバリデーションが通らない" do
    user = User.new(name: 'aaa', email: '', password: '61346134', password_confirmation: '61346134')
    expect(user).not_to be_valid
  end

  it "passwordとpassword_confirmationに相違があらればバリデーションが通らない" do
    user = User.new(name: 'aaa', email: 'aaa@gmail.com', password: '61346134', password_confirmation: '12345')
    expect(user).not_to be_valid
  end

  it "emailが不適切なものであるときはバリデーションが通らない" do
    user = User.new(name: 'aaa', email: 'aaa', password: '61346134', password_confirmation: '61346134')
    expect(user).not_to be_valid
  end
end
