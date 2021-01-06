class CreateJoinTableListingTag < ActiveRecord::Migration[6.1]
  def change
    create_table :listing_tags do |t|
      t.references :tag
      t.references :listing
      t.index [:listing_id, :tag_id]
    end
  end
end
