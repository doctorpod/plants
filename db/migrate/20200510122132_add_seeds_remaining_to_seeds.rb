class AddSeedsRemainingToSeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :seeds, :seeds_remaining, :boolean, default: true
  end
end
