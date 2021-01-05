class CreateSalesCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :sales_counts do |t|
      t.references :listing, null: false
      t.integer :value

      t.timestamps
    end
  end
end
