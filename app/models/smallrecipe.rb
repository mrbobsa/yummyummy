class Smallrecipe < ActiveRecord::Base
    
    has_and_belongs_to_many :dusers
    has_many :detailrecipes
    has_and_belongs_to_many :tutors
    belongs_to :bigrecipe
    has_many :smallreplies
    has_many :materials, :through => :recipecolds
    has_many :recipecolds
end
