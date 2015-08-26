class CreateSmallrecipes < ActiveRecord::Migration
  def change
    create_table :smallrecipes do |t|
      
      t.integer :bigrecipe_id
      t.string :smallrecipe_name
      t.string :smallrecipe_image
      t.integer :smallrecipe_heart

      t.timestamps null: false
    end
  end
end
