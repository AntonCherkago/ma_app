class Group < ApplicationRecord
  has_many  :users, through: :memberships
  has_many  :images, as: :imageable
  validates :name, :type, :status, presence: true
  validates :name, uniqueness: true
end
