class Location < ApplicationRecord
  has_many :users
  has_many :projects

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
