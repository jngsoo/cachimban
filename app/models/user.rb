class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :likes
  has_many :l_posts, through: :likes, source: :post
  
  before_save {self.email = email.downcase}                                      
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i        
  validates :email, presence: true, length: {maximum: 30}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
end
