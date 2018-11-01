class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :AccountNumber
      t.integer :number
      t.decimal :balance
      t.timestamps
    end
  end
end
