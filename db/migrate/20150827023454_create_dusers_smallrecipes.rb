class CreateDusersSmallrecipes < ActiveRecord::Migration
  def change
    create_table :dusers_smallrecipes do |t|
      t.belongs_to :duser, index: true
      t.belongs_to :smallrecipe, index: true
      
    end
  end
end
