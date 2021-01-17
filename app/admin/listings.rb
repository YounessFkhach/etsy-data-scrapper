ActiveAdmin.register Listing do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :etsy_id, :state, :etsy_user_id, :title, :description, :price, :unit, :quantity, :taxonomy_id, :suggested_taxonomy_id, :materials, :shop_section_id, :featured_rank, :url, :views, :num_favorers, :processing_min, :processing_max, :who_made, :is_supply, :when_made, :item_weight, :item_weight_unit, :item_length, :item_width, :item_height, :item_dimensions_unit, :is_private, :recipient, :occasion, :style, :non_taxable, :is_customizable, :is_digital, :file_data, :has_variations, :language, :shop_id, :creation_datetime, :state_datetime
  #
  # or
  #
  # permit_params do
  #   permitted = [:etsy_id, :state, :etsy_user_id, :title, :description, :price, :unit, :quantity, :taxonomy_id, :suggested_taxonomy_id, :materials, :shop_section_id, :featured_rank, :url, :views, :num_favorers, :processing_min, :processing_max, :who_made, :is_supply, :when_made, :item_weight, :item_weight_unit, :item_length, :item_width, :item_height, :item_dimensions_unit, :is_private, :recipient, :occasion, :style, :non_taxable, :is_customizable, :is_digital, :file_data, :has_variations, :language, :shop_id, :creation_datetime, :state_datetime]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  scope :active, default: true
  scope :all

  filter :title
  filter :etsy_id
  filter :creation_datetime

  index do
    id_column
    column :title
    column :views
    column 'Url' do |listing|
      link_to 'Open in etsy', listing.url, target: '_blank'
    end
    column :creation_datetime
  end
end
