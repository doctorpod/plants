class CreateSowings < ActiveRecord::Migration[5.2]
  def change
    create_table :sowings do |t|
      t.integer :seed_id
      t.date :sown_on
      t.string :compost_mix
      t.string :location
      t.text :notes
      t.integer :num_sown
      t.integer :num_germinated
      t.date :first_germinated_on
      t.date :potted_on

      t.timestamps
    end
  end
end
