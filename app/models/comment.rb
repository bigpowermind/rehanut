class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :content

  # バリデーション(imageカラムが空の場合、commentカラムも空であれば保存しない)
  validates :comment, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
