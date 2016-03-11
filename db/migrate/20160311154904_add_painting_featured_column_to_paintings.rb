class AddPaintingFeaturedColumnToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :painting_featured, :boolean
  end
end
