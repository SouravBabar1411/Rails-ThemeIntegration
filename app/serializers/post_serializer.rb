class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :tag

  #assosiation
  belongs_to :sport
end
