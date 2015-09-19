class CreateDusersMaterials < ActiveRecord::Migration
  def change
    create_table :dusers_materials do |t|
      t.belongs_to :duser, index: true
      t.belongs_to :material, index: true
    end
  end
end
