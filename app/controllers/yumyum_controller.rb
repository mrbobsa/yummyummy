class YumyumController < ApplicationController
  def index
    @recipe = Bigrecipe.find(1)
    if duser_signed_in?
      @image = current_duser.user_image
    end
  end
  
  def smallrecipe
    @recipepage = Smallrecipe.find(params[:id])
  end
  
  def quest
    @article = Quest.all
  end
  
  def pride
    @article_2 = Pride.all
  end
end
