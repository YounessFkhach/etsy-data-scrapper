class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.integer :etsy_id, null: false
      t.string :state, default: :active
      t.integer :etsy_user_id
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :unit
      t.integer :quantity
      t.integer :taxonomy_id
      t.integer :suggested_taxonomy_id
      t.string :materials, array: true, default: []
      t.integer :shop_section_id
      t.integer :featured_rank
      t.float :state_tsz
      t.string :url
      t.integer :views
      t.integer :num_favorers
      t.integer :processing_min
      t.integer :processing_max
      t.string :who_made
      t.boolean :is_supply
      t.string :when_made
      t.integer :item_weight
      t.string :item_weight_unit
      t.integer :item_length
      t.integer :item_width
      t.integer :item_height
      t.string :item_dimensions_unit
      t.boolean :is_private, default: false
      t.string :recipient
      t.string :occasion
      t.string :style, array: true, default: []
      t.boolean :non_taxable
      t.boolean :is_customizable
      t.boolean :is_digital
      t.string :file_data
      t.boolean :has_variations
      t.string :language


      t.timestamps
    end
  end
end
