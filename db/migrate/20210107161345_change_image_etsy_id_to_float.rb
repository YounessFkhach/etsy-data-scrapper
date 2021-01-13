class ChangeImageEtsyIdToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :images, :etsy_image_id, :float
  end
end
