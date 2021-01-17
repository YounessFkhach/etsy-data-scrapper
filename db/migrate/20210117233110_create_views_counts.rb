class CreateViewsCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :views_counts do |t|
      t.integer :count
      t.references :listing

      t.timestamps
    end
  end
end
