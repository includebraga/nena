class Project < ApplicationRecord
  belongs_to :organization
  has_many :user_project_payments
  has_many :users, through: :user_project_payments
  has_many :payments, through: :user_project_payments
  has_one :location

  def location_name
    location.try(:name)
  end

  def location_name=(name)
    self.location = Location.find_by(city: name) if name.present?
  end
end
