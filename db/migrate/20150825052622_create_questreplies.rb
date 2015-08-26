class CreateQuestreplies < ActiveRecord::Migration
  def change
    create_table :questreplies do |t|
      
      t.integer :quest_id
      t.string :questreply_email
      t.string :questreply_content

      t.timestamps null: false
    end
  end
end
