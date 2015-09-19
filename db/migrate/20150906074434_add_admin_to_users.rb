class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :dusers, :admin, :boolean, :default => false
  end
end
