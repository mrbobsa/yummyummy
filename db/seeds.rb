# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.new
user.user_email = "yumyum@naver.com"
user.user_password = "1234"
user.user_favorite = "밥"
user.user_image = "프로필사진"
user.user_nickname = "냠냠이"
user.save

tutor = Tutor.new
tutor.tutor_name = "파썰기"
tutor.tutor_image = "이미지파일"
tutor.tutor_content = "어슷썰기를 할 때는 어슷어슷"
tutor.tutor_link = "파를써는 동영상"
tutor.save

material = Material.new
material.material_code = "001"
material.material_normal = "정상이미지"
material.material_perished = "상했져요"
material.material_gray = "회색재료"
material.material_name ="쌀"
material.save

quest = Quest.new
quest.quest_email = "로그인 된 유저 아이디"
quest.quest_image = "글쓴이의 프로필이미지"
quest.quest_title = "다시마 밥"
quest.quest_content = "다시마 몇개 넣나요??"
quest.save

reply = Questreply.new
reply.quest_id = 1
reply.questreply_email = "yumyum2@naver.com"
reply.questreply_content = "세개 넣으세요"
reply.save

pride = Pride.new
pride.pride_email = "로그인된 사람 아이디"
pride.pride_image = "글쓴이의 프로필"
pride.pride_title = "다시마 밥"
pride.pride_content = "존맛"
pride.pride_heart = 0
pride.save

reply = Pridereply.new
reply.pride_id = 1
reply.pride_email = "yumyum3@naver.com"
reply.pride_content = "오 쩌는듯"
reply.save

recipe = Bigrecipe.new
recipe.bigrecipe_category = "밥류"
recipe.bigrecipe_image = "다시마밥 이미지"
recipe.bigrecipe_name = "다시마 밥"
recipe.save

recipe = Smallrecipe.new
recipe.bigrecipe_id = 1
recipe.smallrecipe_name = "기본"
recipe.smallrecipe_image = "기본 밥 이미지"
recipe.smallrecipe_heart = 0
recipe.save

reply = Smallreply.new
reply.smallrecipe_id = 1
reply.smallreply_email = "yumyum2@naver.com"
reply.smallreply_content = "엄청 간편한듯"
reply.save

reply = Smallrere.new
reply.smallreply_id = 1
reply.smallrere_email = "yumyum3@naver.com"
reply.smallrere_content = "실제로도 맛남"
reply.save

tip = Tip.new
tip.tip_image = "팁사진"
tip.tip_content = "파기름만드는팁"
tip.save

recipe = Detailrecipe.new
recipe.smallrecipe_id = 1
recipe.detailrecipe_image = "레시피사진"
recipe.detailrecipe_content = "다시마는 3개만 넣으세요"
recipe.detailrecipe_voice = "오디오 추후구현"
recipe.tip_id = 1
recipe.save

cold = Recipecold.new
cold.smallrecipe_id = 1
cold.recipecold_material = "001"
cold.recipecold_trait = true
cold.save