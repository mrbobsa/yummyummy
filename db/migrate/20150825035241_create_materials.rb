class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      
      t.string :material_code
      t.string :material_normal
      t.string :material_perished
      t.string :material_gray
      t.string :material_name

      t.timestamps null: false
    end
  end
end
