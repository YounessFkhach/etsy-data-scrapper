ActiveAdmin.register Listing do

  actions :all, :except => [:new]

  scope :active, default: true
  scope :all

  filter :title
  filter :content
  filter :views, as: :numeric
  filter :creation_datetime

  index do
    id_column
    column 'Image' do |listing|
      image_tag listing.images.first.url_75_75 if listing.images.first
    end
    column :title
    column :views
    column 'Price' do |listing|
      "#{listing.price} #{listing.unit}"
    end
    column 'Url' do |listing|
      link_to 'Open in etsy', listing.url, target: '_blank'
    end
    column :creation_datetime
  end
end
