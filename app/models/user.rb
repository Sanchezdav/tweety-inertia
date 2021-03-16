class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_person_name
  has_many :posts, inverse_of: :user, dependent: :destroy

  validates :name, presence: true

  def gravatar_url
    gravatar_id = Digest::MD5::hexdigest(self.email.downcase)
    "http://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
