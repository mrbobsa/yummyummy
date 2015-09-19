class CreateDetailrecipesTutors < ActiveRecord::Migration
  def change
    create_table :detailrecipes_tutors do |t|
      t.belongs_to :detailrecipe, index: true
      t.belongs_to :tutor, index: true
      
      t.timestamps null: false
    end
  end
end
