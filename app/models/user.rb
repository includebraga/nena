class User < ApplicationRecord
  has_many :organization_users
  has_many :organizations, through: :organization_users
  validates :email, :name, presence: true
end
