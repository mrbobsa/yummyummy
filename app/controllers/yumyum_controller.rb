class YumyumController < ApplicationController
  def index
    @recipe = Bigrecipe.all.reverse
    if duser_signed_in?
      @image = current_duser.user_image
      @material = Duser.joins(:materials).select("dusers.id, materials.*").where("dusers.id" => current_duser.id).take(9)
      @materialcode=[]
      @material.each do |m|
        @materialcode << m.material_code
      end
    end
  end
  
  def smallrecipe
    @recipepage = Smallrecipe.find(params[:id]) #해당 페이지의 스몰레시피를 불러옴
    @bigrecipe = Bigrecipe.find(@recipepage.bigrecipe_id) #해당 스몰레시피의 빅 레시피를 불러옴
    @recipe_like = DusersSmallrecipe.where('smallrecipe_id' => params[:id]).count
    @recipepage.smallrecipe_heart = @recipe_like #해당 스몰레시피의 좋아요 갯수
    @recipepage.save
    @detail = Detailrecipe.where('smallrecipe_id' => params[:id])
    
=begin 
    주재료 출력 삭제s
    main_material = Recipecold.where('smallrecipe_id = ? AND recipecold_trait = ?',params[:id],true)
    @main_m = []
    main_material.each do |m|
      source = Material.where('material_code' => m.recipecold_material).take
      @main_m << source.material_name
    end
=end
    
    sub_material = Recipecold.where('smallrecipe_id = ? AND recipecold_trait = ?',params[:id],false)
    @sub_m = []
    sub_material.each do |m|
      source = Material.where('material_code' => m.recipecold_material).take
      @sub_m << source.material_name
    end
    
    if duser_signed_in?
      @image = current_duser.user_image
      recipe_m = Recipecold.where('smallrecipe_id' => params[:id])
      user_m = DusersMaterial.where('duser_id' => current_duser.id)
      empty_m = [] #나에게 없는 재료코드
      noempty_m = [] #나에게 있는 재료 코드
      @my_empty = [] # 나에게 없는 재료명
      
      # 레시피의 재료와 나의 재료를 비교하는 로직
      recipe_m.each do |recipe|
        find_m = user_m.where('material_id' => recipe.recipecold_material).take
        if find_m.nil?
          empty_m << recipe.recipecold_material
        else
          noempty_m << recipe.recipecold_material
        end
      end
      
      # 나에게 없는 재료명을 출력
      empty_m.each do |m|
        source = Material.where('material_code' => m).take
        @my_empty << source.material_name
      end
      @my_count = noempty_m.count #내가 갖고 있는 재료 갯수
      @total_count = recipe_m.count #레시피에 필요한 총 재료 갯수
      
      
    end
      #댓글
      @reply = Smallreply.where('smallrecipe_id' => params[:id])
      @replycount = @reply.count
  end
  
  def quest
    @article = Quest.all.reverse
    @reply = Questreply.where('quest_id' => params[:id])
  end
  
  def pride
    @article_2 = Pride.all
    @image = current_duser.user_image
  end
  
  def userinfo

    @image = current_duser.user_image
    user = current_duser.id
    
    # 내가 좋아요 한 튜토리얼을 불러옴
    @tutor = DusersTutor.where(:duser_id => user).count
    if @tutor.nil?
      @tutor = 0
    end
    
    # 내가 좋아요 한 레시피를 불러옴
    @recipe = DusersSmallrecipe.where(:duser_id => user).count
    if @recipe.nil?
      @recipe = 0
    end
    
    # 내가 갖고 있는 재료 테이블 (each를 이용해야 하나씩 출력)
    @material = Duser.joins(:materials).select("dusers.id, materials.*").where("dusers.id" => current_duser.id)
    @materialcode=[]
    @material.each do |m|
      @materialcode << m.material_code
    end
  end
  
  def tutorial
    @tutor = Tutor.all
  end
  
  def material
    @jaeryo = Gray.all
    
    # 내가 갖고 있는 재료 테이블 (each를 이용해야 하나씩 출력)
    @material = Duser.joins(:materials).select("dusers.id, materials.*").where("dusers.id" => current_duser.id)
    @materialcode=[]
      @material.each do |m|
        @materialcode << m.material_code
      end
    @image = current_duser.user_image
  end
  
  def connect ## tutorialscrap user와 튜토리얼을 연결시키는 기능
    if current_duser.nil? 
      redirect_to "/dusers/sign_in"
    else
       confirm = DusersTutor.where("tutor_id = ? AND duser_id = ?", params[:id], current_duser.id).take
      if confirm.nil?
        scrap = DusersTutor.new
        scrap.tutor_id = params[:id]
        scrap.duser_id = current_duser.id
        scrap.save
      end
      redirect_to :back
    end
  end
  
  def recipescrap # user와 레시피를 연결시키는 기능
    if current_duser.nil? 
      redirect_to "/dusers/sign_in"
    else
      confirm = DusersSmallrecipe.where("smallrecipe_id = ? AND duser_id = ?", params[:id], current_duser.id).take
      if confirm.nil?
        scrap = DusersSmallrecipe.new
        scrap.smallrecipe_id = params[:id]
        scrap.duser_id = current_duser.id
        scrap.save
      end
       redirect_to :back
    end
  end
  
  def myrecipe
    @myrecipe = Duser.joins(:smallrecipes).select("dusers.id, smallrecipes.id, smallrecipes.*").where("dusers.id" => current_duser.id)
    @mytutor = Duser.joins(:tutors).select("dusers.id, tutors.id, tutors.*").where("dusers.id" => current_duser.id)
  end
  
  def usercold
    dcold = DusersMaterial.where("duser_id = ? AND material_id = ?", current_duser.id, params[:id]).take
    if dcold.nil?
      ingredient = DusersMaterial.new
      ingredient.duser_id = current_duser.id
      ingredient.material_id = params[:id]
      ingredient.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def myrecipe_del
    recipe = DusersSmallrecipe.where("duser_id = ? AND smallrecipe_id = ?",current_duser.id,params[:id]).take
    recipe.destroy
    redirect_to :back
  end
  
  def mytutor_del
    tutor = DusersTutor.where("duser_id = ? AND tutor_id = ?",current_duser.id,params[:id]).take
    tutor.destroy
    redirect_to :back
  end
  
  def mymaterial_del
    material = DusersMaterial.where("duser_id = ? AND material_id = ?",current_duser.id, params[:id]).take
    material.destroy
    redirect_to :back
  end
  
  def writequest
    @image = current_duser.user_image
  end
  
  def questdb
    quest = Quest.new
    quest.quest_email = params[:email]
    quest.quest_title = params[:title]
    quest.quest_content = params[:content]
    quest.quest_image = current_duser.user_image
    quest.save
    redirect_to '/yumyum/quest'
  end
  
  def questreply
    reply = Questreply.new
    reply.quest_id = params[:id]
    reply.questreply_email = current_duser.email
    reply.questreply_content = params[:content]
    reply.save
    redirect_to :back
  end
  
  def reply_del
    reply = Questreply.find(params[:id])
    if current_duser.email == reply.questreply_email
      reply.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def pridereply_del
    reply = Pridereply.find(params[:id])
    if current_duser.email == reply.pridereply_email
      reply.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
    
  
  def quest_del
    quest = Quest.find(params[:id])
    if current_duser.email == quest.quest_email
      quest.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def writepride
    @image = current_duser.user_image
  end
  
  def pridedb
    pride = Pride.new
    pride.pride_email = params[:email]
    pride.pride_title = params[:title]
    pride.pride_content = params[:content]
    pride.pride_heart = 0
    pride.save
    redirect_to '/yumyum/pride'
  end
  
  def pridereply
    reply = Pridereply.new
    reply.pride_id = params[:id]
    reply.pridereply_email = current_duser.email
    reply.pridereply_content = params[:content]
    reply.save
    redirect_to :back
  end
  
  def pride_del
    pride = Pride.find(params[:id])
    if current_duser.email == pride.pride_email
      pride.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def prideheart
    heart = Pride.find(params[:id])
    heart.pride_heart += 1
    heart.save
    redirect_to :back
  end
  
  def quest_mod
    @quest = Quest.find(params[:id])
    @image = current_duser.user_image
  end
  
  def quest_mod2
    quest = Quest.find(params[:id])
    quest.quest_email = params[:email]
    quest.quest_title = params[:title]
    quest.quest_content = params[:content]
    quest.quest_image = current_duser.user_image
    quest.save
    redirect_to '/yumyum/quest'
  end
  
  def recipewrite
  end
  
  def recipeedit
    @bigrecipe = Bigrecipe.find(params[:id])
    @smallrecipe = Smallrecipe.where("bigrecipe_id" => params[:id]).take
    @detailrecipe = Detailrecipe.where("smallrecipe_id" => @smallrecipe.id).take
  end
  
  def recipedb
    if Bigrecipe.where("bigrecipe_name" => params[:title]).take.nil?
      big = Bigrecipe.new
      big.bigrecipe_name = params[:title]
      big.bigrecipe_category = params[:category]
      big.bigrecipe_image = params[:complete_image]
      big.save
    end
    bigrecipe = Bigrecipe.where("bigrecipe_name" => params[:title]).take
    small = Smallrecipe.new
    small.bigrecipe_id = bigrecipe.id 
    small.smallrecipe_name = params[:version]
    small.smallrecipe_image = params[:complete_image2]
    small.smallrecipe_level = params[:level]
    small.smallrecipe_time = params[:time]
    small.smallrecipe_content = params[:content]
    small.smallrecipe_heart = 0
    small.save
    
    
    smallrecipe = Smallrecipe.where("bigrecipe_id = ? AND smallrecipe_name = ?",bigrecipe.id, params[:version]).take
    1.upto(10).each do |x|
      unless params["detail_content#{x}"] == ""
        detail = Detailrecipe.new
        detail.smallrecipe_id = smallrecipe.id
        detail.detailrecipe_content = params["detail_content#{x}"]
        detail.detailrecipe_image = params["detail_image#{x}"]
        detail.detailrecipe_tip = params["tip_content#{x}"]
        detail.save
      end
    end
    
=begin
    주재료 db저장 삭제
    main_material = Recipecold.new
    main_material.smallrecipe_id = smallrecipe.id
    main_material.recipecold_material = params[:main_material]
    main_material.recipecold_trait = true
    main_material.save
=end

    #재료를 입력받아 DB에 저장시키는 로직
    material_a = params[:sub_material].split(',')
    material_a.each do |m|
      sub_material = Recipecold.new
      sub_material.smallrecipe_id = smallrecipe.id
      sub_material.recipecold_material = m
      sub_material.save  
    end
    
    redirect_to :back   
  end
  
  def smalledit
    smallrecipe = Smallrecipe.find(params[:id])   
  end
  
  def smalldelete
    smallrecipe = Smallrecipe.find(params[:id])
    bigrecipe = Bigrecipe.find(smallrecipe.bigrecipe_id)
    smallrecipe.destroy
    if bigrecipe.smallrecipes.empty?
      bigrecipe.destroy
    end
    redirect_to "/"
  end
  
  def material_write
  end
  
  def materialdb
    material = Material.new
    material.material_code = params[:code]
    material.material_name = params[:name]
    material.material_category= params[:category]
    material.normal_image = params[:selected]
    material.save
    
    material2 = Gray.new
    material2.material_id = params[:code]
    material2.gray_image = params[:basic]
    material2.save
    
    material3 = Perish.new
    material3.material_id = params[:code]
    material3.perish_image = params[:modified]
    material3.save
    
    redirect_to :back
  end
  
  def smallreply
    reply = Smallreply.new
    reply.smallrecipe_id = params[:id]
    reply.smallreply_email = current_duser.email
    reply.smallreply_content = params[:reply]
    reply.save
    redirect_to :back
  end
  
  def smallreply_del
    reply = Smallreply.find(params[:id])
    if reply.smallreply_email == current_duser.email
      reply.destroy
    end
    redirect_to :back
  end
  
  def material_del
    material = Material.find(params[:id])
    material.destroy
    gray = Gray.where('material_id' => params[:id]).take
    gray.destroy
    perish = Perish.where('material_id' => params[:id]).take
    perish.destroy
    
    redirect_to :back
  end
  
  def search_recipe
    @recipe = Bigrecipe.all.reverse
    if duser_signed_in?
      @order_recipe = Hash.new
      @image = current_duser.user_image
      @material = Duser.joins(:materials).select("dusers.id, materials.*").where("dusers.id" => current_duser.id).take(9)
      @materialcode=[]
      @material.each do |m|
        @materialcode << m.material_code
      end
      
      Smallrecipe.all.each do |small|
        key = small.id
        recipe_m = Recipecold.where('smallrecipe_id' => small.id)
        user_m = DusersMaterial.where('duser_id' => current_duser.id)
        empty_m = [] #나에게 없는 재료코드
        noempty_m = [] #나에게 있는 재료 코드
        
        # 레시피의 재료와 나의 재료를 비교하는 로직
        recipe_m.each do |recipe|
          find_m = user_m.where('material_id' => recipe.recipecold_material).take
          if find_m.nil?
            empty_m << recipe.recipecold_material
          else
            noempty_m << recipe.recipecold_material
          end
        end
        
        if recipe_m.count == 0
          percent = 0
        else
          percent = noempty_m.count/recipe_m.count
        end
        @order_recipe[key] = percent
      end
      @order_recipe.values.sort.reverse!
    end  
  end
  
end