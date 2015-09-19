class Material < ActiveRecord::Base
    has_and_belongs_to_many :dusers
    has_many :recipecolds
    has_many :smallrecipes, :through => :recipecolds
    has_one :gray
    has_one :perish
    mount_uploader :normal_image, RecipeimageUploader
    self.primary_key = 'material_code'
end
