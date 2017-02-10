class User < ApplicationRecord
  has_many :organization_users
  has_many :organizations, through: :organization_users
  has_many :user_project_payments
  has_many :projects, through: :user_project_payments
  has_many :payments, through: :user_project_payments
  validates :email, :name, presence: true
end
