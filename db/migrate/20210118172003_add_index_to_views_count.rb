class AddIndexToViewsCount < ActiveRecord::Migration[6.1]
  def change
    add_index :listings, :sales_count
  end
end
