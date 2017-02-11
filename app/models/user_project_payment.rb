class UserProjectPayment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :payment
end
