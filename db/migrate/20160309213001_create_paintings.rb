class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings do |t|
    	t.string :title
    	t.text :body
    	

      	t.timestamps
    end
  end
end
