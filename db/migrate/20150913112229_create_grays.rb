class CreateGrays < ActiveRecord::Migration
  def change
    create_table :grays do |t|
      
      t.string :material_id
      t.string :gray_image

      t.timestamps null: false
    end
  end
end
