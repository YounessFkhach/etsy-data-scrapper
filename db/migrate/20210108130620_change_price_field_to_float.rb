class ChangePriceFieldToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :listings, :price, :float
  end
end
