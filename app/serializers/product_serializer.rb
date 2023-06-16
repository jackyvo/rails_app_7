class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :sku, :isbn, :description, :status
  has_one :brand
end
