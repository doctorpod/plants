class MakeGrowingsNameMandatoryAndUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :growings, :name, unique: true
  end
end
