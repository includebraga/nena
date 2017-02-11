class AddTaglineToProject < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :tagline, :string
  end
end
