class Project < ApplicationRecord
  belongs_to :organization
  has_many :user_project_payments
  has_many :users, through: :user_project_payments
  has_many :payments, through: :user_project_payments
end
