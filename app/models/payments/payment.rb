class Payment < ApplicationRecord
  has_many :user_project_payments
  has_many :projects, through: :user_project_payments
  has_many :users, through: :user_project_payments

  def project
    user_project_payments.first.project
  end
end
