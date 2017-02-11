class RenameUserProjectPaymentsColumnsNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_project_payments, :projects_id, :project_id
    rename_column :user_project_payments, :users_id, :user_id
  end
end
