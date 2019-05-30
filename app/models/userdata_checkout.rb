class UserdataCheckout < ApplicationRecord
  belongs_to :user
  belongs_to :checkout
end
