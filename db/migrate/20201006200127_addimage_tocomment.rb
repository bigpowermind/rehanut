class AddimageTocomment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :image, :string
  end
end
