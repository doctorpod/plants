class PopulateGrowingsName < ActiveRecord::Migration[5.2]
  def up
    Growing.all.each do |growing|
      growing.update(name: "#{growing.seed ? growing.seed.name : growing.plant_name} - #{growing.created_at.to_date}")
    end
  end

  def down
    Growing.update_all(name: nil)
  end
end
