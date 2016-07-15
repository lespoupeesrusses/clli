class AddImageToResource < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :image, :text
  end
end
