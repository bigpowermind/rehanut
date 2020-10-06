class AddnameTocontent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :name, :string
  end
end
