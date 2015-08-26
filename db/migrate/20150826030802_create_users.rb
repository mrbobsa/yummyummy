class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_email
      t.string :user_password
      t.string :user_favorite
      t.string :user_image
      t.string :user_nickname
      t.timestamps null: false
    end
  end
end
