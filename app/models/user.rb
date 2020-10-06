class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :content_users
  has_many :contents, through: :content_users
  has_many :comments

  #validates :name, presence: true, uniqueness: true
end
