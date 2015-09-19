class CreateSmallrecipes < ActiveRecord::Migration
  def change
    create_table :smallrecipes do |t|
      
      t.integer :bigrecipe_id
      t.string :smallrecipe_name
      t.string :smallrecipe_image
      t.string :smallrecipe_content
      t.integer :smallrecipe_heart
      t.integer :smallrecipe_time
      t.integer :smallrecipe_level

      t.timestamps null: false
    end
  end
end
