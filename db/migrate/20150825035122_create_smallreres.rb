class CreateSmallreres < ActiveRecord::Migration
  def change
    create_table :smallreres do |t|
      
      t.integer :smallreply_id
      t.string :smallrere_email
      t.string :smallrere_content

      t.timestamps null: false
    end
  end
end
