class Post < ActiveRecord::Base
  has_many :likes
  has_many :l_users, through: :likes, source: :user
  has_many :comments
  has_many :pictures, dependent: :destroy
  has_one  :detail
end
