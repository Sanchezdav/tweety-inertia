class Post < ApplicationRecord
  belongs_to :user, inverse_of: :posts

  validates :content, presence: :true
  validates :content, length: { minimum: 2, maximum: 150 }
end
