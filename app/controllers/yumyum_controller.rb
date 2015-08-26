class YumyumController < ApplicationController
  def index
    @recipe = Bigrecipe.find(1)  
  end
  
  def smallrecipe
    @recipepage = Smallrecipe.find(params[:id])
  end
end
