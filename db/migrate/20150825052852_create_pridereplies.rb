class CreatePridereplies < ActiveRecord::Migration
  def change
    create_table :pridereplies do |t|
      
      t.integer :pride_id
      t.string :pridereply_email
      t.string :pridereply_content

      t.timestamps null: false
    end
  end
end
