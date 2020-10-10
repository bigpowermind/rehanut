class Content < ApplicationRecord
  has_many :content_users
  # 多対多の記述
  has_many :users, through: :content_users
  has_many :comments

  # バリデーション
  #validates :name, presence: true, uniqueness: true
end
