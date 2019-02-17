class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :identifier, :slug, :description, :stock, :price, :category
end
