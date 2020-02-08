class BookComment < ApplicationRecord

belongs_to :user
belongs_to :book

# コメントの空送信をバリア
validates :comment, presence: true
end
