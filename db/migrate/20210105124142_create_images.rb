class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :listing
      t.integer :etsy_image_id
      t.string :url_full
      t.string :url_570_n
      t.string :url_75_75
      t.string :url_170_135
      t.string :hex_code

      t.timestamps
    end
  end
end
