class AddPaintingPathColumnToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :painting_path, :string
  end
end
