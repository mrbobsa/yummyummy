class CreatePrides < ActiveRecord::Migration
  def change
    create_table :prides do |t|
      
      t.string :pride_email
      t.string :pride_image
      t.string :pride_title
      t.string :pride_content
      t.integer :pride_heart

      t.timestamps null: false
    end
  end
end
