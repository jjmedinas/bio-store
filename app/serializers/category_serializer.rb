class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :identifier, :slug, :image
end
