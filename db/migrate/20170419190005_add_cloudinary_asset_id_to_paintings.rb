class AddCloudinaryAssetIdToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :cloudinary_asset_id, :string
  end
end
