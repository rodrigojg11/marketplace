class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
