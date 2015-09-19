class Bigrecipe < ActiveRecord::Base
    has_many :smallrecipes
    mount_uploader :bigrecipe_image, RecipeimageUploader
end
