class Gray < ActiveRecord::Base
    belongs_to :material
    mount_uploader :gray_image, RecipeimageUploader
end
