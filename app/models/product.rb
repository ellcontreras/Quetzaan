class Product < ApplicationRecord
  mount_uploaders :product_pictures, ProductPicturesUploader
  serialize :product_pictures, JSON
end
