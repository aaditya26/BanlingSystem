class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :AccountNumber
      t.decimal :amount
      t.string :TransactionType
      t.timestamps
    end
  end
end
