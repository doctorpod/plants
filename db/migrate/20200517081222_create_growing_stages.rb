class CreateGrowingStages < ActiveRecord::Migration[5.2]
  def change
    create_table :growing_stages do |t|
      t.references :growing, foreign_key: true
      t.string :stage_type
      t.date :started_on
      t.string :growing_medium
      t.string :location
      t.date :first_growth_on
      t.integer :num_started
      t.integer :num_growing
      t.integer :num_lost
      t.text :notes

      t.timestamps
    end
  end
end
