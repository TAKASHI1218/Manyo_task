class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }

  before_destroy do
   throw :abort if User.where(admin: true).count < 2 && self.admin?

  end
end
