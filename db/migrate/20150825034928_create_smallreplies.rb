class CreateSmallreplies < ActiveRecord::Migration
  def change
    create_table :smallreplies do |t|
      
      t.integer :smallrecipe_id
      t.string :smallreply_email
      t.text :smallreply_content

      t.timestamps null: false
    end
  end
end
