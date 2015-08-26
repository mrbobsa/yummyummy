class Detailrecipe < ActiveRecord::Base
    belongs_to :tip
    belongs_to :smallrecipe
end
