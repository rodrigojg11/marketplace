class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :method
      t.integer :status
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
