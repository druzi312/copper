class AddPaperclipFieldsToPainting < ActiveRecord::Migration
  def change
    add_column :paintings, :image_file_name,    :string
    add_column :paintings, :image_content_type, :string
    add_column :paintings, :image_file_size,    :integer
    add_column :paintings, :image_updated_at,   :datetime
  end
end
