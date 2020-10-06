class CreateContentUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :content_users do |t|

      t.timestamps
    end
  end
end
