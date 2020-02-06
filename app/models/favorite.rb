class Favorite < ApplicationRecord
  belogs_to :user
  blongs_to :book
end
