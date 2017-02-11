class Organization < ApplicationRecord
  has_many :organization_users
  has_many :users, through: :organization_users
  has_many :projects
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  has_attached_file :hero
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :hero, content_type: /\Aimage\/.*\z/

  def admin?(user)
    OrganizationUser.where(user_id: user.id, organization_id: id, admin: true).any?
  end
end
