class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates  :status, presence: true
  enum status: [ :active, :unactive, :banned], _default: 'unactive'
end