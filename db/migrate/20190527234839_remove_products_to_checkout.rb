class RemoveProductsToCheckout < ActiveRecord::Migration[5.2]
  def change
    remove_column :checkouts, :products
  end
end
