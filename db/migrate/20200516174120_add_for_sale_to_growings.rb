class AddForSaleToGrowings < ActiveRecord::Migration[5.2]
  def change
    add_column :growings, :for_sale, :boolean, default: false
  end
end
