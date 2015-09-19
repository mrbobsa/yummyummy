class Detailrecipe < ActiveRecord::Base
    belongs_to :smallrecipe
    has_and_belongs_to_many :tutors
    mount_uploader :detailrecipe_image, RecipeimageUploader
end
