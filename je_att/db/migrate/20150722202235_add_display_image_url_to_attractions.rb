class AddDisplayImageUrlToAttractions < ActiveRecord::Migration
  def change
  	add_column :attractions, :display_image_url, :string
  end
end
