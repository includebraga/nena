class User < ApplicationRecord
  validates :email, :name, presence: true
end
