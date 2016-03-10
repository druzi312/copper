class AddOrderingColumnToPaintings < ActiveRecord::Migration
  def change
    add_column :paintings, :ordering, :integer
  end
end
