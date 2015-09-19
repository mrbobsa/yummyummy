class Duser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_and_belongs_to_many :tutors
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :smallrecipes, :dependent => :destroy
 
  
  has_attached_file :user_image, :styles => { :medium => "300x300>", :thumb => "100x100" }, :default_url => "/assets/avartar.png"
  validates_attachment_content_type :user_image, :content_type => /\Aimage\/.*\Z/
  
end
