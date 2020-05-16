class RenameSowingsToGrowings < ActiveRecord::Migration[5.2]
  def change
    rename_table :sowings, :growings
  end
end
