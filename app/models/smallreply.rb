class Smallreply < ActiveRecord::Base
    belongs_to :smallrecipe
    has_many :smallreres
end
