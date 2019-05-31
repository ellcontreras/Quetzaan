class CreateUserdataCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :userdata_checkouts do |t|
      t.references :user, foreign_key: true
      t.references :checkout, foreign_key: true
      t.string :name
      t.string :street
      t.integer :external_number
      t.integer :internal_number
      t.string :country
      t.string :zip_code
      t.string :state
      t.string :city

      t.timestamps
    end
  end
end
