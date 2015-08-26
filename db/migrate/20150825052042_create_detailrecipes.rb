class CreateDetailrecipes < ActiveRecord::Migration
  def change
    create_table :detailrecipes do |t|
      
      t.integer :smallrecipe_id
      t.string :detailrecipe_image
      t.text :detailrecipe_content
      t.string :detailrecipe_voice
      t.integer :tip_id

      t.timestamps null: false
    end
  end
end
