class AddSowingMonthsToSeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :seeds, :direct_sowing_months, :string
    add_column :seeds, :covered_sowing_months, :string
  end
end
