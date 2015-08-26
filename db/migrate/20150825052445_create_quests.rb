class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      
      t.string :quest_email
      t.string :quest_image
      t.string :quest_title
      t.string :quest_content

      t.timestamps null: false
    end
  end
end
