class Checkout < ApplicationRecord
  belongs_to :user
  has_many :checkout_product
end
