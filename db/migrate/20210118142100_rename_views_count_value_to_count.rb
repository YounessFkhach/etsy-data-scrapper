class RenameViewsCountValueToCount < ActiveRecord::Migration[6.1]
  def change
    rename_column :sales_counts, :value, :count
  end
end
