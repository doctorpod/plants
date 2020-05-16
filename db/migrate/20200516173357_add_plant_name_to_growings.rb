class AddPlantNameToGrowings < ActiveRecord::Migration[5.2]
  def change
    add_column :growings, :plant_name, :string
  end
end
