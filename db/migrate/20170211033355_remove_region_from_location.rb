class RemoveRegionFromLocation < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :region
  end
end
