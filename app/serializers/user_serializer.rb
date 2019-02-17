class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :nickname, :email, :role, :state, :address
end
