class Task < ApplicationRecord
  # default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :content, presence: true
  validates :priority, presence: true
  validates :cut_off_date, presence: true
  validates :status, presence: true
  
  scope :get_by_name, ->(name) {
    where("name like ?", "%#{name}%")}
  scope :get_by_status, ->(status) {
    where(status: status)
    }

  enum priority:{高: 0,中: 1,低: 2 }
  enum status:{未着手: 0,着手中: 1,完了: 2}
end
