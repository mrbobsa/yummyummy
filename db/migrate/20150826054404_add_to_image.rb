class AddToImage < ActiveRecord::Migration
   def self.up
	  change_table :dusers do |t| #signup은 원래 devise에서 만든 모델
      t.attachment :user_image #photo는 파라미터(임의설정)
    end
  end

  def self.down
    drop_attached_file :dusers, :user_image
  end
end
