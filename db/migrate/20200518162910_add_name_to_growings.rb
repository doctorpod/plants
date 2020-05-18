class AddNameToGrowings < ActiveRecord::Migration[5.2]
  def up
    add_column :growings, :name, :string
  end

  def down
    remove_index :growings, :name
    remove_column :growings, :name
  end
end
