class AddCreditCardToUserdataCheckout < ActiveRecord::Migration[5.2]
  def change
    add_column :userdata_checkouts, :creditcart_number, :string
    add_column :userdata_checkouts, :month, :string
    add_column :userdata_checkouts, :year, :string
    add_column :userdata_checkouts, :ccv, :string
  end
end
