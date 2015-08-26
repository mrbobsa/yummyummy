class CreatePridereplies < ActiveRecord::Migration
  def change
    create_table :pridereplies do |t|
      
      t.integer :pride_id
      t.string :pride_email
      t.string :pride_content

      t.timestamps null: false
    end
  end
end
