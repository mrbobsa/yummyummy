class CreateTutors < ActiveRecord::Migration
  def change
    create_table :tutors do |t|
      
      t.string :tutor_name
      t.string :tutor_image
      t.text :tutor_content
      t.string :tutor_link

      t.timestamps null: false
    end
  end
end
