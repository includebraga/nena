class User < ApplicationRecord
  has_many :organization_users
  has_many :organizations, through: :organization_users
  has_many :user_project_payments
  has_many :projects, through: :user_project_payments
  has_many :payments, through: :user_project_payments
  has_one :location
  validates :email, :name, presence: true

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.email = "#{auth['uid']}@#{auth['provider']}.com"
    user.name = auth['info']['name']
    user.img  = auth['info']['image']
    debugger
    if User.exists?(user)
      user
    else
      user.save!
      user
    end
  end
end
