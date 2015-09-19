# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tutor = Tutor.new
tutor.tutor_name = "파썰기"
tutor.tutor_image = "이미지파일"
tutor.tutor_content = "어슷썰기를 할 때는 어슷어슷"
tutor.tutor_link = "파를써는 동영상"
tutor.save

quest = Quest.new
quest.quest_email = "로그인 된 유저 아이디"
quest.quest_image = "글쓴이의 프로필이미지"
quest.quest_title = "다시마 밥"
quest.quest_content = "다시마 몇개 넣나요??"
quest.save

pride = Pride.new
pride.pride_email = "로그인된 사람 아이디"
pride.pride_image = "글쓴이의 프로필"
pride.pride_title = "다시마 밥"
pride.pride_content = "존맛"
pride.pride_heart = 0
pride.save


user = Duser.new
user.email = "admin@test.com"
user.password = "test1234"
user.password_confirmation = "test1234"
user.user_nickname = "admin"
user.user_favorite = "김치"
user.admin = true
user.save
