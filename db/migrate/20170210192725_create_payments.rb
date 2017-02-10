class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :type
      t.float :quantity
      t.string :unit

      t.timestamps
    end
  end
end
