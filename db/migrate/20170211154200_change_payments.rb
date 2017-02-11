class ChangePayments < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_project_payments, :payments_id, :payment_id
  end
end
