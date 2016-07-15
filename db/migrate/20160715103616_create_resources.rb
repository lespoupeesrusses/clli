class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :abstract
      t.text :url

      t.timestamps
    end
  end
end
