class CreateDusersTutors < ActiveRecord::Migration
  def change
    create_table :dusers_tutors do |t|
      t.belongs_to :duser, index: true
      t.belongs_to :tutor, index: true
    end
  end
end
