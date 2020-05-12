class AddPlantedOutToSowings < ActiveRecord::Migration[5.2]
  def change
    add_column :sowings, :planted_out, :date
  end
end
