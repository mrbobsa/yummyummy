class CreateBigrecipes < ActiveRecord::Migration
  def change
    create_table :bigrecipes do |t|
      
      t.string :bigrecipe_category
      t.string :bigrecipe_image
      t.string :bigrecipe_name

      t.timestamps null: false
    end
  end
end
