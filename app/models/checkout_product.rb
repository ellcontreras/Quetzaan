class CheckoutProduct < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :checkout
end
