class AddPaintingTypeColumnToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :painting_type, :string
  end
end
