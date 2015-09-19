class Smallrecipe < ActiveRecord::Base
    mount_uploader :smallrecipe_image, RecipeimageUploader
    has_and_belongs_to_many :dusers, :dependent => :destroy
    has_many :detailrecipes
    belongs_to :bigrecipe
    has_many :smallreplies
    has_many :materials, :through => :recipecolds
    has_many :recipecolds
end
