class AddColumnToPictures < ActiveRecord::Migration[6.1]
  def change
    add_column :pictures, :content, :string
  end
end
