class CreateUserProjectPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_project_payments do |t|
      t.references :projects
      t.references :users

      t.timestamps
    end
  end
end
