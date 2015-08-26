class Bigrecipe < ActiveRecord::Base
    has_many :smallrecipes
end
