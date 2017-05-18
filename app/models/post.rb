# Persistance layer representation for Posts
class Post < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { maximum: 150 }
  scope(:latest, -> { all.order('created_at DESC') })
end
