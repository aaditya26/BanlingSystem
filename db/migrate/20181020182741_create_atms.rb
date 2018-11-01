class CreateAtms < ActiveRecord::Migration[5.2]
  def change
    create_table :atms do |t|
      t.string :transaction_number
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
