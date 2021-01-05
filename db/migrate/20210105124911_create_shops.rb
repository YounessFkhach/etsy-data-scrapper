class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.integer :etsy_id
      t.string :name
      t.float :creation_tsz
      t.string :title
      t.string :announcement
      t.string :currency_unit
      t.string :url
      t.string :image_url
      t.integer :num_favorers
      t.string :languages, array: true, default: []
      t.string :icon_url


      t.timestamps
    end
  end
end
