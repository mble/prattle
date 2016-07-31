# Persistance layer representation for Posts
class Post < ApplicationRecord
  validates :content, length: { minimum: 1, maximum: 150 }, allow_blank: false
  scope :latest, -> { all.order('created_at DESC') }
end
