class Quest < ActiveRecord::Base
    has_many :questreplies
    mount_uploader :quest_image, RecipeimageUploader
end
