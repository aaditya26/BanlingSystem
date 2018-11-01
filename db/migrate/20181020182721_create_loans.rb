class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.string :type
      t.decimal :amount
      t.timestamps
    end
  end
end
