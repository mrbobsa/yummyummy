class CreateRecipecolds < ActiveRecord::Migration
  def change
    create_table :recipecolds do |t|
      
      t.string :recipecold_material
      t.boolean :recipecold_trait, default: false
      t.integer :smallrecipe_id

      t.timestamps null: false
    end
  end
end
