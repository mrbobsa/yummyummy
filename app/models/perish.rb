class Perish < ActiveRecord::Base
    belongs_to :material
    mount_uploader :perish_image, RecipeimageUploader
end
