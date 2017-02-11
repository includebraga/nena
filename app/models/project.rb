class Project < ApplicationRecord
  belongs_to :organization
  has_many :user_project_payments
  has_many :users, through: :user_project_payments
  has_many :payments, through: :user_project_payments
  belongs_to :location
  has_attached_file :avatar
  has_attached_file :hero
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :hero, content_type: /\Aimage\/.*\z/

  def location_name
    location.try(:name)
  end

  def location_name=(name)
    self.location = Location.find_by(city: name) if name.present?
  end
end
