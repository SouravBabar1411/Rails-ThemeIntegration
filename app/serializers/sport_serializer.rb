class SportSerializer < ActiveModel::Serializer
  attributes :id, :name

  #assosiation
  has_many :posts
  has_many :announcements
end
