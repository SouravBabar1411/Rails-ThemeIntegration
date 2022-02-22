class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  #assosiation
  has_many :achievements
end
