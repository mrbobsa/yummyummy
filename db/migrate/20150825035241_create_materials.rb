class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      
      t.string :material_code
      t.string :normal_image
      t.string :material_name
      t.string :material_category

      t.timestamps null: false
    end
  end
end
