class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.text :text
      t.string :image
      t.string :video
      t.timestamps
    end
  end
end
