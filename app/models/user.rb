class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  # has_many(自分でつけたモデル名),class_name(本当のモデル名)
  #active=フォローする側、passive=フォローされる側（受動的）
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms, dependent: :destroy
  has_many :chats, dependent: :destroy

  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 50 }

  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: user.id).present?
  end

  def show
  if user_signed_in?
    @room = Room.new
    @rooms = current_user.rooms
    @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
  end
end


end
