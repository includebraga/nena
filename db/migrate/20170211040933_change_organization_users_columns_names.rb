class ChangeOrganizationUsersColumnsNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :organization_users, :users_id, :user_id
    rename_column :organization_users, :organizations_id, :organization_id
  end
end
