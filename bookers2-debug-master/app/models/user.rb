class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false
  #コメント機能
  has_many :book_comments, dependent: :destroy
  #いいね機能
  has_many :favorites, dependent: :destroy
  
  # フォロー機能
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # ① フォローしている人取得(Userのfollowerから見た関係)
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # ② フォローされている人取得(Userのfolowedから見た関係)
  
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人(自分がフォローされている人)
  
# model/user.rb
# ユーザーをフォローする
def follow(user_id)
  follower.create(followed_id: user_id)
end

# ユーザーのフォローを外す
def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
end

# フォロー確認をおこなう
def following?(user)
  following_user.include?(user)
end
end
