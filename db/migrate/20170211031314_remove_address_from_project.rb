class RemoveAddressFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :address
  end
end
