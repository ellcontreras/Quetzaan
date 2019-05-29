class CreateCheckoutProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkout_products do |t|
      t.references :products, foreign_key: true
      t.references :checkout, foreign_key: true

      t.timestamps
    end
  end
end
