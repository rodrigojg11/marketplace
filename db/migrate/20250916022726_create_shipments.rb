class CreateShipments < ActiveRecord::Migration[7.1]
  def change
    create_table :shipments do |t|
      t.string :provider
      t.string :tracking_number
      t.integer :status
      t.decimal :cost
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
