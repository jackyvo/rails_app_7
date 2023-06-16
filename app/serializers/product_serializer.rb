class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :sku, :isbn, :description
  has_one :brand
end
