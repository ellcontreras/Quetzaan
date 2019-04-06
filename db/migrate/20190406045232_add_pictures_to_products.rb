class AddPicturesToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_pictures, :string
  end
end
