class AddEmailToDummy < ActiveRecord::Migration[7.1]
  def change
    add_column :dummies, :email, :string, null: false
    add_index :dummies, :email, unique: true
  end
end
