class Puntutation < ApplicationRecord
  belongs_to :user
  belongs_to :checkout
end
