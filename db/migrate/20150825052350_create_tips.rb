class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      
      t.string :tip_image
      t.text :tip_content

      t.timestamps null: false
    end
  end
end
