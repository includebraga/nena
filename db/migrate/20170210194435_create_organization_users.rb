class CreateOrganizationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :organization_users do |t|
      t.boolean :admin
      t.references :organizations
      t.references :users

      t.timestamps
    end
  end
end
