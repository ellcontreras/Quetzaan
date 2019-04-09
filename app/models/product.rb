class Product < ApplicationRecord
  include AlgoliaSearch

  mount_uploaders :product_pictures, ProductPicturesUploader
  serialize :product_pictures, JSON

  algoliasearch do
    attribute :name
  end
end
