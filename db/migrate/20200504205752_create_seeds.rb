class CreateSeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :seeds do |t|
      t.string :name
      t.date :acquired
      t.string :source
      t.date :sow_by

      t.timestamps
    end
  end
end
