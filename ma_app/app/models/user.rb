class User < ApplicationRecord
  has_many  :posts, dependent: :destroy
  has_many  :images, as: :imageable
  has_many  :groups, through: :memberships
  has_many  :memberships
  validates :username, :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  validates :username, :email, :password, presence: true
  scope :adults, -> { where('birthday >= ?', 18.years.from_now) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
