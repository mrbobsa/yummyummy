class Tutor < ActiveRecord::Base
    mount_uploader :tutor_image, RecipeimageUploader
    has_and_belongs_to_many :dusers
    has_and_belongs_to_many :smallrecipes
    
end
