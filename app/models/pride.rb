class Pride < ActiveRecord::Base
    has_many :pridereplies
    mount_uploader :pride_image, RecipeimageUploader
end
