class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :content

  # バリデーション
  validates :comment, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
