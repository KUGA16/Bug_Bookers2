class Relationship < ApplicationRecord
  #フォローする側
  belongs_to :following, class_name: "User"
  #フォローされる側
  belongs_to :follower, class_name: "User"
  # belongs_to(自分でつけたモデル名),class_name(本当のモデル名)
  validates :following_id, presence: true
end
