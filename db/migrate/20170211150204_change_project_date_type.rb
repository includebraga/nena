class ChangeProjectDateType < ActiveRecord::Migration[5.0]
  def change
    change_column :projects, :initial_date, :datetime
    change_column :projects, :final_date, :datetime
  end
end
