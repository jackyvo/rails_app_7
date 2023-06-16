class BrandSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :description, :status
end
