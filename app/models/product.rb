class Product < ApplicationRecord
  validates :image, presence: true

  has_attached_file :image, styles: {:medium => "650px"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
