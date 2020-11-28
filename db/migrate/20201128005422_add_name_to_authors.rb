class AddNameToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :name, :string
  end
end
