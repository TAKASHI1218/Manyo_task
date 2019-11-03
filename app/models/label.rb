class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :tasks, through: :labellings

  before_destroy do
   throw :abort if Label.where(name: 'ラベル1')
   throw :abort if Label.where(name: 'ラベル2')
   throw :abort if Label.where(name: 'ラベル3')
   throw :abort if Label.where(name: 'ラベル4')
   throw :abort if Label.where(name: 'ラベル5')
 end

end
