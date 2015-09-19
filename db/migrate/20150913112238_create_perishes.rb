class CreatePerishes < ActiveRecord::Migration
  def change
    create_table :perishes do |t|
      
      t.string :material_id
      t.string :perish_image

      t.timestamps null: false
    end
  end
end
