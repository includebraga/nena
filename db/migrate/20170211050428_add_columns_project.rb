class AddColumnsProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :initial_date, :datetime
    add_column :projects, :final_date, :datetime
  end
end
