class Project < ApplicationRecord
  belongs_to :organization
  has_many :user_organization_payments
  has_many :users, through: :user_project_payments
end
